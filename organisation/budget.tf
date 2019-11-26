resource "aws_budgets_budget" "budget" {
  name              = "monthly-budget"
  budget_type       = "COST"
  limit_amount      = var.billing_alarm_threshold
  limit_unit        = var.billing_alarm_currency
  time_period_start = "2019-01-01_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.admin_email]
  }
}
