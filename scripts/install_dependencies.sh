#!/bin/bash
# Update the package index
sudo apt update -y

# Install Tomcat9 and Apache2
sudo apt install -y tomcat9 apache2

# Enable and start the services
sudo systemctl enable tomcat9
sudo systemctl start tomcat9
sudo systemctl enable apache2
sudo systemctl start apache2

# Configure Apache HTTPD as a reverse proxy for Tomcat
cat << EOF | sudo tee /etc/apache2/sites-available/tomcat_manager.conf
<VirtualHost *:80>
  ServerAdmin root@localhost
  ServerName app.nextwork.com
  DefaultType text/html

  ProxyRequests off
  ProxyPreserveHost On

  ProxyPass / http://localhost:8080/nextwork-web-project/
  ProxyPassReverse / http://localhost:8080/nextwork-web-project/
</VirtualHost>
EOF

# Enable necessary Apache modules and site config
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2ensite tomcat_manager.conf
sudo systemctl reload apache2
