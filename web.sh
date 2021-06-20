#!/bin/bash
apt install apache2 -y
myip=$(curl checkip.amazonaws.com)
echo "<h2>WebServer with my IP: $myip</h2><br>Build by Terraform!" > /var/www/html/index.html
sudo service apache2 start
chkconfig apache2 on
