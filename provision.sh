#!/bin/bash

sudo yum install httpd -y
sudo systemctl start httpd 
sudo echo "sudo systemctl start httpd" >> /home/ec2-user/.bashrc

sudo yum install mariadb mariadb-server -y
sudo systemctl start mariadb
sudo echo "sudo systemctl start mariadb" >> /home/ec2-user/.bashrc

sudo yum install php* -y
sudo yum install wget -y

sudo wget https://wordpress.org/latest.zip -P /$USER/
sudo yum install unzip -y
sudo unzip /$USER/latest.zip -d /var/www/html/
sudo cp -rf /var/www/html/wordpress/* /var/www/html/
sudo rm -rf /var/www/html/wordpress
sudo rm -rf /$USER/latest.zip

sudo yum install firewalld -y
sudo systemctl start firewalld

sudo echo "sudo systemctl start firewalld" >> /home/ec2-user/.bashrc
sudo firewall-cmd --add-port=80/tcp
sudo firewall-cmd --add-port=80/tcp --permanent





