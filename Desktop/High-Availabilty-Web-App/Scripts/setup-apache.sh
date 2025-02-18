#!/bin/bash
# This script installs Apache on the EC2 instance and starts the service

sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

echo "<h1>Welcome to My High-Availability Web Application!</h1>" | sudo tee /var/www/html/index.html
