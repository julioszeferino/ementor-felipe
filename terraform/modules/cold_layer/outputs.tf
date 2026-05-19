output "cold_ec2_instance_id" {
  value = aws_instance.cold_api.id
}

output "cold_eventbridge_rule_arn" {
  value = aws_cloudwatch_event_rule.batch_scheduler.arn
}

output "cold_glue_job_name" {
  value = aws_glue_job.cold_raw_to_silver.name
}
