output "log_group_name" {
  value = aws_cloudwatch_log_group.platform.name
}

output "ingestion_alarm_name" {
  value = aws_cloudwatch_metric_alarm.ingestion_errors.alarm_name
}
