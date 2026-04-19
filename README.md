# Celeste Inventory System

## 📌 Project Overview
The **Celeste Inventory System** is a robust, web-based full-stack inventory and point-of-sale (POS) management application. Built using Python (Flask) and a MySQL database backend, it allows organizations to manage products, warehouses (zones), sales orders, and personnel across multiple locations effectively. 

## ✨ Key Features
* **Role-Based Access Control (RBAC):** 
  * **Superadmin:** Has global access to all facilities, overall statistics, all products, and the ability to manage users (Supervisors) and warehouses.
  * **Supervisor / Sub-Admin:** Restricted to their specific assigned warehouse/zone. Can manage local stock and process outgoing orders for their location only.
* **Multi-Warehouse Management:** Easily scale your operations by assigning stock and personnel strictly to specific zones or branches. 
* **Dynamic Analytics Dashboard:** Provides real-time insights such as total global/local sales, stock on hand, product costs, active users, and activity logs. Integrated with visual data formats like line and doughnut charts.
* **Smart Orders & Point-of-Sale (POS):** Track sales with customizable statuses (Pending, Completed, Cancelled). When an order is marked as "Completed", the system automatically calculates revenue and smartly deducts the exact product quantity from the assigned warehouse's inventory. Cancellations will safely restore the stock.
* **Comprehensive Audit Trail:** The system heavily utilizes an activity logging mechanism to securely record user actions behind the scenes, such as adding products, removing warehouses, updating order statuses, or changing user roles—creating a secure paper trail of accountability.
* **Secure Authentication:** Accounts are protected using secure, modern password hashing standards generated via Werkzeug security wrappers.
* **The VIP Customers:** feature allows the system to identify loyal or high-spending customers and provide them with special privileges such as discounts, priority service, and exclusive promotions. It helps businesses retain valuable customers and enhance customer satisfaction.
* **The E-Receipt:** feature automatically generates and stores digital receipts for transactions, allowing customers and administrators to view, download, or send receipts electronically for record keeping and verification.

## 🛠️ Technology Stack
* **Backend:** Python 3, Flask
* **Database:** MySQL relational database (`mysql-connector-python`)
* **Frontend:** HTML5, CSS3, JavaScript, Jinja2 Templating
* **Security:** Werkzeug password-hashing

## Teen Tech Group
* **Leader:** Mark Joseph Guirren
* **Member:** Arwayne Xyryle Manzano
* **Member:** Dave Alonzo Padre
* **Member:** Kenneth Moises
* **Member:** Lyndolf Raphael Rodriguez 

## 🚀 Getting Started (Local Development)
1. Ensure you have Python 3.x and a local MySQL server (like XAMPP, WAMP, or standalone MySQL) installed.
2. In your MySQL database, create a database named `celeste_inventory` and import your initial SQL schema.
3. Install the required Python packages (e.g., `pip install flask mysql-connector-python werkzeug`).
4. Run `python backend/app.py` or navigate to the backend directory and launch the app using Flask.
5. Access the app on your local development server (usually `http://127.0.0.1:5000/`) and log in.
