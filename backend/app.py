from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
import random
from datetime import datetime

app = Flask(__name__)
CORS(app)

def get_db():
    return mysql.connector.connect(
        host="localhost", user="root", password="", database="celeste_inventory"
    )

# ==========================================
# 1. AUTHENTICATION
# ==========================================
@app.route('/api/login', methods=['POST'])
def api_login():
    data = request.get_json()
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    cursor.execute("""
        SELECT u.*, w.warehouse_name 
        FROM users u LEFT JOIN warehouses w ON u.assigned_warehouse_id = w.id 
        WHERE u.username = %s AND u.password = %s
    """, (data['username'], data['password']))
    user = cursor.fetchone()
    
    if user:
        cursor.execute("UPDATE users SET last_active = NOW() WHERE id = %s", (user['id'],))
        cursor.execute("INSERT INTO activity_logs (user_id, action_description) VALUES (%s, %s)", (user['id'], 'Logged into the system.'))
        db.commit()
        cursor.close()
        db.close()
        
        return jsonify({
            "success": True, 
            "user": {
                "id": user['id'], "fullname": user['fullname'], "role": user['role'],
                "warehouse_id": user['assigned_warehouse_id'], "warehouse_name": user['warehouse_name'] or "Global"
            }
        }), 200
    
    cursor.close()
    db.close()
    return jsonify({"success": False, "message": "Invalid username or password"}), 401

# ==========================================
# 2. DASHBOARDS
# ==========================================
@app.route('/api/dashboard', methods=['GET'])
def api_dashboard():
    role = request.args.get('role')
    warehouse_id = request.args.get('warehouse_id')
    db = get_db()
    cursor = db.cursor(dictionary=True)
    payload = {}

    if role == 'Superadmin':
        # 1. Fetch Company Warehouses
        cursor.execute("SELECT w.warehouse_name, w.address, u.fullname as manager_name FROM warehouses w LEFT JOIN users u ON w.id = u.assigned_warehouse_id AND u.role != 'Superadmin'")
        payload['warehouses'] = cursor.fetchall()

        # 2. Fetch Global Stats
        cursor.execute("SELECT SUM(total_amount) as total FROM sales WHERE status = 'Completed'")
        payload['total_sales'] = cursor.fetchone()['total'] or 0

        cursor.execute("SELECT SUM(purchase_price * stock_quantity) as total FROM products")
        payload['total_cost'] = cursor.fetchone()['total'] or 0
            
        cursor.execute("SELECT COUNT(*) as total FROM sales WHERE status = 'Completed'")
        payload['total_sold'] = cursor.fetchone()['total'] or 0

        cursor.execute("SELECT SUM(stock_quantity) as total FROM products")
        payload['total_stock'] = cursor.fetchone()['total'] or 0

        cursor.execute("SELECT status, COUNT(*) as count FROM sales GROUP BY status")
        payload['donut_data'] = cursor.fetchall()
        
        cursor.execute("SELECT a.action_description, DATE_FORMAT(a.created_at, '%b %d, %h:%i %p') as time_ago, u.fullname FROM activity_logs a JOIN users u ON a.user_id = u.id ORDER BY a.created_at DESC LIMIT 10")
        payload['recent_logs'] = cursor.fetchall()
        
        cursor.execute("SELECT u.fullname, u.role, w.warehouse_name as assigned_warehouse, DATE_FORMAT(u.last_active, '%b %d, %Y - %h:%i %p') as last_active_fmt FROM users u LEFT JOIN warehouses w ON u.assigned_warehouse_id = w.id WHERE u.role != 'Superadmin'")
        payload['officials'] = cursor.fetchall()

    else:
        # 1. Fetch Zone-Specific Stats
        cursor.execute("SELECT SUM(s.total_amount) as total FROM sales s JOIN products p ON s.product_id = p.id WHERE s.status = 'Completed' AND p.warehouse_id = %s", (warehouse_id,))
        payload['total_sales'] = cursor.fetchone()['total'] or 0

        cursor.execute("SELECT SUM(purchase_price * stock_quantity) as total FROM products WHERE warehouse_id = %s", (warehouse_id,))
        payload['total_cost'] = cursor.fetchone()['total'] or 0

        cursor.execute("SELECT SUM(stock_quantity) as total FROM products WHERE warehouse_id = %s", (warehouse_id,))
        payload['total_stock'] = cursor.fetchone()['total'] or 0
        
        cursor.execute("SELECT COUNT(*) as total FROM sales s JOIN products p ON s.product_id = p.id WHERE s.status = 'Completed' AND p.warehouse_id = %s", (warehouse_id,))
        payload['total_sold'] = cursor.fetchone()['total'] or 0
        
        cursor.execute("SELECT s.status, COUNT(*) as count FROM sales s JOIN products p ON s.product_id = p.id WHERE p.warehouse_id = %s GROUP BY s.status", (warehouse_id,))
        payload['donut_data'] = cursor.fetchall()

    cursor.close()
    db.close()
    return jsonify({"success": True, "data": payload})

# ==========================================
# 3. PRODUCTS
# ==========================================
@app.route('/api/products', methods=['GET'])
def get_products():
    role = request.args.get('role')
    warehouse_id = request.args.get('warehouse_id')
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    if role == 'Superadmin':
        cursor.execute("SELECT p.*, w.warehouse_name FROM products p LEFT JOIN warehouses w ON p.warehouse_id = w.id ORDER BY p.id DESC")
    else:
        cursor.execute("SELECT p.*, w.warehouse_name FROM products p LEFT JOIN warehouses w ON p.warehouse_id = w.id WHERE p.warehouse_id = %s ORDER BY p.id DESC", (warehouse_id,))
        
    products = cursor.fetchall()
    cursor.execute("SELECT id, warehouse_name FROM warehouses")
    warehouses = cursor.fetchall()
    
    cursor.close()
    db.close()
    return jsonify({"success": True, "data": products, "warehouses": warehouses})

@app.route('/api/products', methods=['POST'])
def add_product():
    data = request.get_json()
    category_prefixes = {'Neckwear': 'NK', 'Finger Ring': 'RG', 'Wristwear': 'WW', 'Earwear': 'EW'}
    auto_sku = f"{category_prefixes.get(data['category'], 'ITM')}-{random.randint(1000, 9999)}"
    
    db = get_db()
    cursor = db.cursor()
    cursor.execute("""
        INSERT INTO products (product_name, sku, category, purchase_price, sale_price, stock_quantity, warehouse_id, status) 
        VALUES (%s, %s, %s, %s, %s, %s, %s, 'Active')
    """, (data['product_name'], auto_sku, data['category'], data['purchase_price'], data['sale_price'], data['stock_quantity'], data['warehouse_id']))
    
    cursor.execute("INSERT INTO activity_logs (user_id, action_description) VALUES (%s, %s)", (data['user_id'], f"Added product: {data['product_name']}"))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"success": True})

@app.route('/api/products/<int:id>', methods=['PUT', 'DELETE'])
def manage_product(id):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    if request.method == 'DELETE':
        user_id = request.args.get('user_id')
        cursor.execute("SELECT product_name FROM products WHERE id = %s", (id,))
        p_name = cursor.fetchone()['product_name']
        cursor.execute("DELETE FROM products WHERE id = %s", (id,))
        cursor.execute("INSERT INTO activity_logs (user_id, action_description) VALUES (%s, %s)", (user_id, f"Deleted product: {p_name}"))
    else:
        data = request.get_json()
        cursor.execute("""
            UPDATE products SET product_name=%s, category=%s, purchase_price=%s, sale_price=%s, stock_quantity=%s, warehouse_id=%s 
            WHERE id=%s
        """, (data['product_name'], data['category'], data['purchase_price'], data['sale_price'], data['stock_quantity'], data['warehouse_id'], id))
        cursor.execute("INSERT INTO activity_logs (user_id, action_description) VALUES (%s, %s)", (data['user_id'], f"Updated product: {data['product_name']}"))
        
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"success": True})

# ==========================================
# 4. WAREHOUSES & SUPERVISORS
# ==========================================
@app.route('/api/warehouses', methods=['GET', 'POST'])
def manage_warehouses():
    db = get_db()
    cursor = db.cursor(dictionary=True)
    if request.method == 'GET':
        cursor.execute("""
            SELECT w.id, w.warehouse_name, w.address, u.fullname as manager_name, COALESCE(SUM(p.stock_quantity), 0) as total_items
            FROM warehouses w LEFT JOIN users u ON w.id = u.assigned_warehouse_id AND u.role != 'Superadmin'
            LEFT JOIN products p ON w.id = p.warehouse_id GROUP BY w.id, w.warehouse_name, w.address, u.fullname ORDER BY w.warehouse_name ASC
        """)
        data = cursor.fetchall()
        cursor.close()
        db.close()
        return jsonify({"success": True, "data": data})
    else:
        data = request.get_json()
        cursor.execute("INSERT INTO warehouses (warehouse_name, address) VALUES (%s, %s)", (data['warehouse_name'], data['address']))
        db.commit()
        cursor.close()
        db.close()
        return jsonify({"success": True})

@app.route('/api/supervisors', methods=['GET'])
def get_supervisors():
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute("""
        SELECT u.id, u.fullname, u.username, u.role, w.warehouse_name, u.assigned_warehouse_id, DATE_FORMAT(u.last_active, '%b %d, %Y - %h:%i %p') as last_active_fmt
        FROM users u LEFT JOIN warehouses w ON u.assigned_warehouse_id = w.id WHERE u.role != 'Superadmin' ORDER BY u.fullname ASC
    """)
    staff = cursor.fetchall()
    cursor.execute("SELECT id, warehouse_name FROM warehouses")
    warehouses = cursor.fetchall()
    cursor.close()
    db.close()
    return jsonify({"success": True, "data": staff, "warehouses": warehouses})

# ==========================================
# 5. ORDERS & POS
# ==========================================
@app.route('/api/orders', methods=['GET'])
def get_orders():
    role = request.args.get('role')
    warehouse_id = request.args.get('warehouse_id')
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    base_query = """
        SELECT s.*, p.product_name, u.fullname as processed_by, COALESCE(v.lifetime_spend, 0) as lifetime_spend
        FROM sales s LEFT JOIN products p ON s.product_id = p.id LEFT JOIN users u ON s.processed_by_id = u.id
        LEFT JOIN (SELECT customer_name, SUM(total_amount) as lifetime_spend FROM sales WHERE status = 'Completed' GROUP BY customer_name) v ON s.customer_name = v.customer_name
    """
    
    # Query 1: Fetch the Orders
    if role == 'Superadmin':
        cursor.execute(base_query + " ORDER BY s.id DESC")
    else:
        cursor.execute(base_query + " WHERE p.warehouse_id = %s ORDER BY s.id DESC", (warehouse_id,))
    
    # YOU MUST FETCH THE ORDERS BEFORE STARTING THE SECOND QUERY!
    orders = cursor.fetchall()
    
    # Query 2: Fetch the available products for the Dropdown
    if role == 'Superadmin':
        cursor.execute("SELECT id, product_name, stock_quantity, sale_price FROM products WHERE stock_quantity > 0")
    else:
        cursor.execute("SELECT id, product_name, stock_quantity, sale_price FROM products WHERE warehouse_id = %s AND stock_quantity > 0", (warehouse_id,))
        
    products = cursor.fetchall()
    
    cursor.close()
    db.close()
    return jsonify({"success": True, "data": orders, "products": products})

@app.route('/api/orders', methods=['POST'])
def add_order():
    data = request.get_json()
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    cursor.execute("SELECT product_name, sale_price, stock_quantity FROM products WHERE id = %s", (data['product_id'],))
    product = cursor.fetchone()
    
    if not product or product['stock_quantity'] < int(data['quantity']):
        return jsonify({"success": False, "message": "Not enough stock available!"}), 400
        
    order_number = f"ORD-{datetime.now().strftime('%Y%m%d%H%M')}"
    total_amount = float(product['sale_price']) * int(data['quantity'])
    
    cursor.execute("INSERT INTO sales (order_number, customer_name, product_id, quantity, total_amount, status, order_date, processed_by_id) VALUES (%s, %s, %s, %s, %s, %s, NOW(), %s)", 
                   (order_number, data['customer_name'], data['product_id'], data['quantity'], total_amount, data['status'], data['user_id']))
    
    if data['status'] == 'Completed':
        cursor.execute("UPDATE products SET stock_quantity = stock_quantity - %s WHERE id = %s", (data['quantity'], data['product_id']))
        
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"success": True})

@app.route('/api/orders/<int:id>/status', methods=['PUT'])
def update_order_status(id):
    data = request.get_json()
    new_status = data['new_status']
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM sales WHERE id = %s", (id,))
    order = cursor.fetchone()
    old_status = order['status']
    
    if old_status != 'Completed' and new_status == 'Completed':
        cursor.execute("UPDATE products SET stock_quantity = stock_quantity - %s WHERE id = %s", (order['quantity'], order['product_id']))
    elif old_status == 'Completed' and new_status != 'Completed':
        cursor.execute("UPDATE products SET stock_quantity = stock_quantity + %s WHERE id = %s", (order['quantity'], order['product_id']))

    cursor.execute("UPDATE sales SET status = %s WHERE id = %s", (new_status, id))
    db.commit()
    cursor.close()
    db.close()
    return jsonify({"success": True})

@app.route('/api/orders/<int:order_id>', methods=['GET'])
def get_single_order(order_id):
    db = get_db()
    cursor = db.cursor(dictionary=True)
    cursor.execute('''
        SELECT s.*, p.product_name, p.sale_price, u.fullname as processed_by
        FROM sales s LEFT JOIN products p ON s.product_id = p.id LEFT JOIN users u ON s.processed_by_id = u.id
        WHERE s.id = %s
    ''', (order_id,))
    order = cursor.fetchone()
    cursor.close()
    db.close()
    if order:
        return jsonify({'success': True, 'order': order})
    return jsonify({'success': False, 'message': 'Order not found'})

# ==========================================
# 6. VIP CUSTOMERS
# ==========================================
@app.route('/api/customers', methods=['GET'])
def get_customers():
    role = request.args.get('role')
    warehouse_id = request.args.get('warehouse_id')
    db = get_db()
    cursor = db.cursor(dictionary=True)
    
    if role == 'Superadmin':
        cursor.execute("SELECT customer_name, COUNT(id) as total_orders, SUM(total_amount) as total_spent, MAX(order_date) as last_visit FROM sales WHERE status = 'Completed' GROUP BY customer_name ORDER BY total_spent DESC")
    else:
        cursor.execute("SELECT s.customer_name, COUNT(s.id) as total_orders, SUM(s.total_amount) as total_spent, MAX(s.order_date) as last_visit FROM sales s JOIN products p ON s.product_id = p.id WHERE s.status = 'Completed' AND p.warehouse_id = %s GROUP BY s.customer_name ORDER BY total_spent DESC", (warehouse_id,))
        
    customers = cursor.fetchall()
    cursor.close()
    db.close()
    return jsonify({"success": True, "data": customers})

if __name__ == '__main__':
    app.run(debug=True)