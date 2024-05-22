variable "region" {
  description = "AWS region"
  type        = string
}

variable "enviroment" {
  description = "Enviroment tag for AWS resource"
  type        = string
}

variable "owner" {
  description = "Owner tag for AWS resource"
  type        = string
}

variable "project" {
    description = "Project name"
    type = string
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
}

variable "launch_template_instance_type" {
    description = "EC2 instance type for launch template"
    type = string
}

variable "cidr_block_igw" {
  description = "CIDR block of IGW"
  type = string
}

variable "enable_dns_support" {
  description = "enable_dns_support"
  type = bool
}

variable "enable_dns_hostnames" {
  description = "enable_dns_hostnames"
  type = bool
}

variable "vpc_name" {
    description = "VPC Name for Dev env"
    type = string
}

variable "public_route_table_name" {
    description = "Public-RouteTable Name for Dev env"
    type = string
}

variable "private_route_table_name" {
    description = "Private-RouteTable Name for Dev env"
    type = string
}

variable "public_subnet_name" {
    description = "Public subnet Name for Dev env"
    type = string
}

variable "private_subnet_name" {
    description = "Private subnet Name for Dev env"
    type = string
}

variable "vpc_cidr_block" {
    description = "VPC CIDR block"
    type = string
}

variable "public_subnet_1A_cidr_block" {
    description = "Public subnet 1A CIDR block"
    type = string
}

variable "public_subnet_1B_cidr_block" {
    description = "Public subnet 1B CIDR block"
    type = string
}

variable "private_subnet_1A_cidr_block" {
    description = "Private subnet 1A CIDR block"
    type = string
}

variable "private_subnet_1B_cidr_block" {
    description = "Private subnet 1B CIDR block"
    type = string
}

variable "app_server_sg" {
    description = "Security Group for app Server"
    type = string
}

variable "app_server_name" {
    description = "Name for app Server"
    type = string
}

variable "app_server_key_name" {
    description = "Name for app Server key file"
    type = string
}

variable "app_server_ami_id" {
    description = "AMI id for app server"
    type = string
}

variable "associate_public_ip_address" {
  description = "Enable public ip"
  type = bool
}

variable "app_server_ami_name" {
    description = "Name for app Server AMI"
    type = string
}

variable "webserver-ami" {
  description = "Get latest AMI ID of ec2 instance"
}

variable "user_data_file_path" {
  description = "Path to the user data script file"
  type        = string
}

variable "policy_file_path" {
  description = "Path to the IAM policy JSON file"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
}

variable "policy_path" {
  description = "Path of the IAM policy"
  type        = string
}


variable "assume_role_file_path" {
  description = "Path to the IAM policy JSON file"
  type        = string
}

variable "assume_role_name" {
  description = "Name of the IAM policy"
  type        = string
}

#ALB input
variable "alb_server_sg" {
  description = "Name of the Security group for ALB "
  type        = string
}

variable "lauch_template_sg" {
  description = "Name of the Security group for Launch Template "
  type        = string
}

variable "lauch_template_name" {
  description = "Name of the Launch Template "
  type        = string
}

variable "target_group_name" {
  description = "Name of the Target Group "
  type        = string
}

variable "ALB_name" {
  description = "Name of the Application Load balancer "
  type        = string
}

variable "load_balancer_type" {
  description = "load_balancer_type "
  type        = string
}

variable "sns_topic_name" {
  description = "SNS topic name "
  type        = string
}

variable "sns_topic_protocol" {
  description = "SNS topic protocol "
  type        = string
}

variable "number_of_subscriptions" {
  description = "The number of email subscriptions to create"
  type        = number
  default     = 1
}

variable "email_endpoints" {
  description = "List of email endpoints for SNS subscriptions"
  type        = list(string)
}

variable "alarm_500XX" {
  type = string
  description = "This alarm for 5XX error"
}

variable "comparison_operator" {
  description = "The arithmetic operation to use when comparing the specified statistic and threshold."
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}

variable "metric_name" {
  description = "The name of the metric associated with the alarm."
  type        = string
}

variable "namespace" {
  description = "The namespace of the metric associated with the alarm."
  type        = string
}

variable "period" {
  description = "The period, in seconds, over which the specified statistic is applied."
  type        = number
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric."
  type        = string
}

variable "treat_missing_data" {
  description = "How treat messing data"
  type = string
}

variable "alarm_name_4XX" {
  description = "The name for the CloudWatch alarm"
  type        = string
}

variable "comparison_operator_4XX" {
  description = "The comparison operator to use for the alarm"
  type        = string
}

variable "evaluation_periods_4XX" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "metric_name_4XX" {
  description = "The name for the metric associated with the alarm"
  type        = string
}

variable "namespace_4XX" {
  description = "The namespace of the metric"
  type        = string
}

variable "period_4XX" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
}

variable "threshold_4XX" {
  description = "The value against which the specified statistic is compared"
  type        = number
}

variable "statistic_4XX" {
  description = "The statistic to apply to the alarm's associated metric"
  type        = string
}

variable "alarm_description_4XX" {
  description = "The description for the alarm"
  type        = string
}

variable "alarm_actions_4XX" {
  description = "The list of actions to execute when this alarm transitions into an alarm state"
  type        = list(string)
}

variable "treat_missing_data_4XX" {
  description = "How to treat missing data points for the alarm"
  type        = string
}
