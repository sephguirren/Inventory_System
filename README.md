# Celeste Inventory System

<!-- Optional: Add badges here, e.g., build status, license, python version -->
![Python](https://img.shields.io/badge/Python-3.x-blue?style=flat-square&logo=python)
![Flask](https://img.shields.io/badge/Flask-Backend-black?style=flat-square&logo=flask)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue?style=flat-square&logo=mysql)

> A robust, web-based full-stack inventory and point-of-sale (POS) management application.

## Description

The Celeste Inventory System allows organizations to effectively manage products, warehouses (zones), sales orders, and personnel across multiple locations. Built with a Python/Flask backend and a MySQL database, it features dynamic analytics, multi-warehouse scaling, and automated inventory deductions tied directly to an intelligent POS system.

## 🌟 Key Features

*   **Role-Based Access Control (RBAC):** Superadmin global access and restricted, zone-specific Supervisor control.
*   **Multi-Warehouse Management:** Assign stock and personnel to specific branches or zones.
*   **Smart POS & Auto-Inventory:** Automatically calculates revenue and deducts precise product quantities upon order completion.
*   **Dynamic Analytics Dashboard:** Real-time insights (global/local sales, stock on hand) visualized via line and doughnut charts.
*   **Comprehensive Audit Trail:** Secure, behind-the-scenes activity logging to maintain accountability.
*   **VIP Customers & E-Receipts:** Identify loyal customers for special privileges and automatically generate digital transaction receipts.

## 🛠 Tech Stack

*   **Backend:** Python 3, Flask
*   **Database:** MySQL (`mysql-connector-python`)
*   **Frontend:** HTML5, CSS3, JavaScript, Jinja2 Templating
*   **Security:** Werkzeug password-hashing

## 🚀 Installation & Setup

### Prerequisites
*   Python 3.x
*   Local MySQL server (e.g., XAMPP, WAMP, or standalone)

### Development Setup

```bash
# 1. Clone the repository
git clone [https://github.com/sephguirren/Inventory_System.git](https://github.com/sephguirren/Inventory_System.git)
cd celeste-inventory

# 2. Database Setup
# Create a database named `celeste_inventory` in MySQL and import your initial SQL schema.

# 3. Install dependencies
pip install flask mysql-connector-python werkzeug

# 4. Run the application
python backend/app.py
```

## 💻 Usage Example

Once the local development server is running, access the app at `http://127.0.0.1:5000/`. Superadmins can view global statistics and manage all users/warehouses, while Supervisors can log in to handle local stock and process outgoing POS orders for their specific branch.

## 🤝 Contributing

1.  Fork it (https://github.com/sephguirren/Inventory_System/fork)
2.  Create your feature branch (`git checkout -b feature/fooBar`)
3.  Commit your changes (`git commit -am 'Add some fooBar'`)
4.  Push to the branch (`git push origin feature/fooBar`)
5.  Create a new Pull Request
