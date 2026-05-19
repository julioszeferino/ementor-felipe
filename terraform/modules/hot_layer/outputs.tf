output "hot_ec2_instance_id" {
  value = aws_instance.hot_producer.id
}

output "hot_sqs_queue_url" {
  value = aws_sqs_queue.events_queue.url
}

output "hot_lambda_name" {
  value = aws_lambda_function.loc_writer.function_name
}
