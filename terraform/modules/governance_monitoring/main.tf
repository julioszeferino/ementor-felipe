resource "aws_lakeformation_data_lake_settings" "default" {
  admins = []
}

resource "aws_cloudwatch_log_group" "platform" {
  name              = "/aws/${var.project_name}/${var.environment}/data-platform"
  retention_in_days = 30
}

resource "aws_cloudwatch_metric_alarm" "ingestion_errors" {
  alarm_name          = "${var.project_name}-${var.environment}-ingestion-errors"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "High-level ingestion errors alarm placeholder"
}
