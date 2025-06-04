#!/bin/bash
# Start and enable Tomcat and Apache2 services
sudo systemctl start tomcat9.service
sudo systemctl enable tomcat9.service

sudo systemctl start apache2.service
sudo systemctl enable apache2.service
