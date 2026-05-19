resource "aws_instance" "hot_producer" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "${var.project_name}-${var.environment}-hot-producer"
  }
}

resource "aws_sqs_queue" "events_queue" {
  name = "${var.project_name}-${var.environment}-hot-events"
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.project_name}-${var.environment}-hot-lambda-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_lambda_function" "loc_writer" {
  function_name = "${var.project_name}-${var.environment}-hot-loc-writer"
  role          = aws_iam_role.lambda_exec.arn
  runtime       = "python3.11"
  handler       = "handler.lambda_handler"
  s3_bucket     = "replace-with-artifacts-bucket"
  s3_key        = "lambda/hot-loc-writer.zip"
}

resource "aws_lambda_event_source_mapping" "sqs_to_lambda" {
  event_source_arn = aws_sqs_queue.events_queue.arn
  function_name    = aws_lambda_function.loc_writer.arn
}

resource "aws_glue_job" "hot_loc_to_silver_microbatch" {
  name     = "${var.project_name}-${var.environment}-hot-loc-to-silver"
  role_arn = aws_iam_role.lambda_exec.arn

  command {
    name            = "glueetl"
    script_location = "s3://replace-with-artifacts/hot/loc_to_silver.py"
    python_version  = "3"
  }
}
