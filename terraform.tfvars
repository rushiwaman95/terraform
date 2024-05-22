region = "ap-south-1"
owner = "Rushikesh"
project = "Terra POC"
enviroment = "Dev"

launch_template_instance_type = "t3a.nano"

#VPC input value
vpc_name = "TerraformVPC"
vpc_cidr_block = "10.0.0.0/16"
cidr_block_igw = "0.0.0.0/0"
public_subnet_1A_cidr_block = "10.0.1.0/24"
public_subnet_1B_cidr_block = "10.0.4.0/24"
private_subnet_1A_cidr_block = "10.0.2.0/24"
private_subnet_1B_cidr_block = "10.0.3.0/24"
enable_dns_support = true
enable_dns_hostnames = true
public_route_table_name = "PublicRouteTable"
private_route_table_name = "PrivateRouteTable"
public_subnet_name = "PublicSubnet"
private_subnet_name = "PriavteSubnet"

#App server input value
webserver-ami = ""
instance_type = "t3a.nano"
app_server_sg = "AppServerSg"
app_server_name = "AppServer"
app_server_key_name = "Accelerator-6"  #change pem file name according. 
app_server_ami_id = "data.aws_ssm_parameter.webserver-ami.value"
associate_public_ip_address = true
app_server_ami_name = "App-Server-AMI"
user_data_file_path = "C:/Users/rushikesh.waman/OneDrive - Flentas Technologies Pvt Ltd/Desktop/terra-POC/Enviroments/DEV/user_data_script/script.sh"
policy_file_path     = "C:/Users/rushikesh.waman/OneDrive - Flentas Technologies Pvt Ltd/Desktop/terra-POC/Enviroments/DEV/user_data_script/iam_policy.json"
policy_name     = "iam_policy"
policy_path     = "/"
assume_role_file_path = "C:/Users/rushikesh.waman/OneDrive - Flentas Technologies Pvt Ltd/Desktop/terra-POC/Enviroments/DEV/user_data_script/trust_policy.json"
assume_role_name = "CloudWatch_SSM_role"

alb_server_sg = "AlbServerSG"
lauch_template_sg = "LaunchSecurityGroup"
lauch_template_name = "Launch-Template"
target_group_name = "ALBTargetGroup"
ALB_name = "terraformALB"
load_balancer_type = "application"

sns_topic_name = "ALB_SNS_topic"
sns_topic_protocol = "email"
email_endpoints = [
  "rushikesh.waman@flentas.com",
  "rahul.bochare@flentas.com"
]

alarm_500XX = "5XX-error" 
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods  = 2
metric_name         = "HTTPCode_ELB_5XX_Count"
namespace           = "AWS/ApplicationELB"
period              = 300
threshold           = 2
statistic           = "Maximum"
treat_missing_data  = "ignore"

alarm_name_4XX                = "alb-400-error"
comparison_operator_4XX       = "GreaterThanOrEqualToThreshold"
evaluation_periods_4XX        = 2
metric_name_4XX               = "HTTPCode_ELB_4XX_Count"
namespace_4XX                 = "AWS/ApplicationELB"
period_4XX                    = 300
threshold_4XX                 = 2
statistic_4XX                 = "Maximum"
alarm_description_4XX         = "Number of 400 errors at ALB above threshold"
alarm_actions_4XX             = ["arn:aws:sns:region:account-id:topicname"]
treat_missing_data_4XX        = "ignore"
