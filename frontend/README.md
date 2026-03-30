# Frontend Directory

## Overview
This directory contains the client-side user interface of the **Celesté & Co. Inventory System**.

## Contents
It consists of multiple `.html` files tailored for specific administrative access, as well as subfolders for modularizing the website components:
- **Core HTML pages**: Files like `login.html`, `dashboard.html`, `products.html` serving the primary interface.
- **Supervisor HTML pages**: Files such as `supervisor_dashboard.html` configured for regional, view-restricted logic.
- **`css/`**: Contains cascading style sheets like `style.css` for visual identity and layout structure.
- **`img/`**: Stores static images like `login.jpg`.
- **`js/`**: Contains client-side JavaScript (`api.js`) for handling API calls and dynamic logic.

## How it Works
The frontend is built using standard HTML/CSS. It operates dynamically by relying on vanilla JavaScript to dispatch asynchronous requests (Fetch/AJAX) to the Python Flask backend server. This allows the web app to query the current inventory databases, authenticate users securely, and update the DOM in real time without refreshing the main components.
