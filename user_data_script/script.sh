#!/bin/bash

# Update all packages
sudo yum update -y

# Install Apache HTTP server and start it
sudo yum -y install httpd
sudo systemctl start httpd

# Enable Apache to start on boot
sudo systemctl enable httpd

# Create a simple HTML file
echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html

# Move the HTML file to the web server's root directory
sudo mv index.html /var/www/html/

# Install Amazon CloudWatch Agent
sudo yum install amazon-cloudwatch-agent -y

# Start the CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a start

# Check the status of the CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status

# Enable the CloudWatch Agent to start on boot
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a enable

# Enable the CloudWatch Agent service
sudo systemctl enable amazon-cloudwatch-agent
