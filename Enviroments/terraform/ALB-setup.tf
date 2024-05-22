#Create SG for ALB
resource "aws_security_group" "alb-sg" {
  name        = "${var.alb_server_sg}"
  description = "Allow TCP/80 & TCP/22"
  vpc_id      = aws_vpc.vpc.id  
  ingress {
    description = "Allow traffic from TCP/80"
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
    Name    = "${var.alb_server_sg}"
  }
}

#Create SG for Launch Template
resource "aws_security_group" "lauch-sg" {
  name        = "${var.lauch_template_sg}"
  description = "Allow TCP/80"
  vpc_id      = aws_vpc.vpc.id  
  ingress {
    description = "Allow traffic from TCP/80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = ["${aws_security_group.alb-sg.id}"]
    # cidr_blocks = [aws_vpc.vpc.cidr_block]  
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "${var.lauch_template_sg}"
  }
}

#Create launch Template
resource "aws_launch_template" "launch-template" {
  name_prefix   = "${var.lauch_template_name}"
  image_id = "${aws_ami_from_instance.jump-Server-AMI.id}"
  instance_type = "${var.launch_template_instance_type}"
  vpc_security_group_ids = [aws_security_group.lauch-sg.id]
  iam_instance_profile {
    name = "${aws_iam_instance_profile.ec2_profile.name}"
  }
  tags = {
    Name    = "${var.lauch_template_name}"

  }
}

#Create ALB Target Group
resource "aws_lb_target_group" "target_group" {
  name     = "${var.target_group_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  tags = {

  }
}

#Create ALB
resource "aws_lb" "ALB" {
  name               = "${var.ALB_name}"
  internal           = false
  load_balancer_type = "${var.load_balancer_type}"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = [aws_subnet.public-subnet.id, aws_subnet.public-subnet-b.id]  
  enable_deletion_protection = false
  tags = {
  }
}

#Create ALB Listner
resource "aws_lb_listener" "ALB" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

#Create Auto Scalling Group
resource "aws_autoscaling_group" "autoscaling_group" {
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1
  vpc_zone_identifier       = [aws_subnet.private-subnet.id, aws_subnet.private-subnet-b.id]
  target_group_arns = [aws_lb_target_group.target_group.arn]
  launch_template {
    id      = aws_launch_template.launch-template.id
    version = "$Latest"
  }
}