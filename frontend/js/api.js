/* =========================================
   CELESTÉ & CO. - CENTRAL API & AUTH MANAGER
========================================= */

const API_BASE_URL = 'http://127.0.0.1:5000/api';

const Auth = {
    // 1. Get the current logged-in user's data from memory
    getUser: function() {
        const userStr = localStorage.getItem('celeste_user');
        return userStr ? JSON.parse(userStr) : null;
    },
    
    // 2. The Bouncer: Kick them to the login screen if they aren't authenticated
    requireLogin: function() {
        if (!this.getUser()) {
            window.location.replace('login.html');
        }
    },
    
    // 3. The Logout feature: Destroy the memory and redirect
    logout: function() {
        localStorage.removeItem('celeste_user');
        window.location.replace('login.html');
    }
};

// Global function so we can attach it easily to a Logout button in the HTML
function performLogout(event) {
    if (event) event.preventDefault();
    Auth.logout();
}