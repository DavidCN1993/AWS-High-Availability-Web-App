#!/bin/bash
# This script installs MySQL and configures a simple database

sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql

# Create a simple database
sudo mysql -e "CREATE DATABASE webappdb;"
sudo mysql -e "CREATE USER 'webappuser'@'%' IDENTIFIED BY 'yourpassword';"
sudo mysql -e "GRANT ALL PRIVILEGES ON webappdb.* TO 'webappuser'@'%';"
