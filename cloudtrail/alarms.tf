module "alarm_baseline" {
  source = "git::git@github.com:nozaq/terraform-aws-secure-baseline.git//modules/alarm-baseline?ref=0.16.1"

  alarm_namespace           = "CloudWatchAlarm"
  cloudtrail_log_group_name = "cloudtrail-multi-region"
  sns_topic_name            = "CloudWatchAlarms"
  tags                      = {}
}
