resource "aws_sns_topic" "consolidated_billing_alarm" {
  name = "consolidated-billing-alarm"

  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${self.arn} --protocol email --notification-endpoint ${var.admin_email}"
  }
}

resource "aws_cloudwatch_metric_alarm" "consolidated_billing_alarm" {
  alarm_name          = "consolidated-billing-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "28800"
  statistic           = "Maximum"
  threshold           = var.billing_alarm_threshold
  alarm_description   = "Consolidated billing alarm >= ${var.billing_alarm_threshold} ${var.billing_alarm_currency}"
  alarm_actions       = [aws_sns_topic.consolidated_billing_alarm.arn]

  dimensions = {
    Currency = var.billing_alarm_currency
  }
}
