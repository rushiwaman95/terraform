#Get Linux AMI ID using SSM Parameter endpoint in ap-south-1
data "aws_ssm_parameter" "webserver-ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Create SG for allowing TCP/80 & TCP/22
resource "aws_security_group" "sg" {
  name        = var.app_server_sg
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description = "Allow SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "allow traffic from TCP/80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
    tags = {
    Name    = var.app_server_sg
  }
}

#Create Public Web Server
resource "aws_instance" "webserver" {
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = var.instance_type
  key_name                    = var.app_server_key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.public-subnet.id
  user_data                   = file(var.user_data_file_path)
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name 

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo yum update -y",
  #     "sudo yum -y install httpd && sudo systemctl start httpd",
  #     "sudo systemctl enable httpd",
  #     "echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html",
  #     "sudo mv index.html /var/www/html/"
  #   ]
    
  #   connection {
  #     type        = "ssh"
  #     user        = "ec2-user"
  #     private_key = file("C:/Users/rushikesh.waman/Downloads/Accelerator-6.pem")
  #     host        = self.public_ip
  #   }
  # }
  
  tags = {
    Name    = var.app_server_name
  }
}

#Import Instance ID
data "aws_instance" "webserver" {
  instance_id = aws_instance.webserver.id
}

#create AMI 
resource "aws_ami_from_instance" "jump-Server-AMI" {
  name               = var.app_server_ami_name
  source_instance_id = data.aws_instance.webserver.id
  tags = {
    Name    = var.app_server_ami_name
  }
}
