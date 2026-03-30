# Database Directory

## Overview
This directory contains the database initialization files for the **Celesté & Co. Inventory System**.

## Contents
- **`celeste_inventory.sql`**: The primary SQL dump needed to create and configure the MySQL database.

## How it Works
The SQL script defines the relational schema mapping out the system's primary tables:
- `users`: Tracks administrators and zone supervisors mapping them to access roles.
- `warehouses`: Details the regional distribution centers.
- `products`: Tracks inventory logic, item SKU codes, margins, and active stocks.
- `sales`: Stores order and POS transactional sequences.
- `activity_logs`: Logs user events to enforce an audit trail.

Loading this file into your MySQL database server sets up the necessary data architecture for the backend API to operate effectively.
