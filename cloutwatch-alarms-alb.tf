#create SNS topic
resource "aws_sns_topic" "sns_topic" {
  name = var.sns_topic_name
}

#create Email Suscription
resource "aws_sns_topic_subscription" "email_subscriptions" {
  for_each = toset(var.email_endpoints)
  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = var.sns_topic_protocol
  endpoint  = each.key
}


resource "aws_cloudwatch_metric_alarm" "alb_500_errors"{
  alarm_name          = var.alarm_500XX
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  threshold           = var.threshold
  statistic           = var.statistic
  alarm_description         = "Number of 500 errors at ALB above threshold"
  alarm_actions             = [aws_sns_topic.sns_topic.arn]
  treat_missing_data        = var.treat_missing_data
  insufficient_data_actions = []
  dimensions = {
    LoadBalancer = aws_lb.ALB.arn_suffix
  }
}

resource "aws_cloudwatch_metric_alarm" "alb_400_errors"{
  alarm_name                = var.alarm_name_4XX
  comparison_operator       = var.comparison_operator_4XX
  evaluation_periods        = var.evaluation_periods_4XX
  metric_name               = var.metric_name_4XX
  namespace                 = var.namespace_4XX
  period                    = var.period_4XX
  threshold                 = var.threshold_4XX
  statistic                 = var.statistic_4XX
  alarm_description         = var.alarm_description_4XX
  treat_missing_data        = var.treat_missing_data_4XX
  alarm_actions             = [aws_sns_topic.sns_topic.arn]
  insufficient_data_actions = []
    dimensions = {
    LoadBalancer = aws_lb.ALB.arn_suffix
  }
}