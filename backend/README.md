# Backend Directory

## Overview
This directory contains the server-side logic of the **Celesté & Co. Inventory System**.

## Contents
- **`app.py`**: A Python application built using the Flask micro-framework. It acts as the core API endpoint for the entire system.

## How it Works
The Flask application provides a RESTful API with distinct routes mapped to system features like authentication, dashboards, product management, warehouses, orders, and VIP customers. It connects to the MySQL database using `mysql-connector` to parse SQL queries dynamically based on parameters and access roles (e.g., differentiating between `Superadmin` and `Supervisor` views).
