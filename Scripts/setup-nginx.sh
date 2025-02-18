#!/bin/bash
# This script installs Nginx, starts the service, and sets up a test page.

sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

# Create a simple webpage
echo "<h1>Welcome to My High-Availability Web Application with Nginx!</h1>" | sudo tee /var/www/html/index.html
