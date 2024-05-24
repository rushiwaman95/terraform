#Create IAM policy
resource "aws_iam_policy" "iam_policy" {
  name        = var.policy_name
  path        = var.policy_path
  description = "IAM policy for CloudWatch and SSM access to EC2"

  # Use the file function to read the policy from an external JSON file
  policy = file(var.policy_file_path)
}

#Create a role that can be assumed by an Amazon EC2 instance
resource "aws_iam_role" "ec2_role" {
    name = var.assume_role_name
    assume_role_policy = file(var.assume_role_file_path)
}

#Attach the role to the policy file
resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.iam_policy.arn
}

#Create an instance profile
resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.assume_role_name
  role = aws_iam_role.ec2_role.name
}