resource "aws_iam_role" "cold_ec2_role" {
  name = "${var.project_name}-${var.environment}-cold-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_instance" "cold_api" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t3.micro"

  tags = {
    Name = "${var.project_name}-${var.environment}-cold-api"
  }
}

resource "aws_cloudwatch_event_rule" "batch_scheduler" {
  name                = "${var.project_name}-${var.environment}-cold-batch-scheduler"
  description         = "Triggers cold ingestion workflow"
  schedule_expression = "rate(15 minutes)"
}

# Glue and Athena resources are intentionally placeholders in this skeleton.
resource "aws_glue_job" "cold_raw_to_silver" {
  name     = "${var.project_name}-${var.environment}-cold-raw-to-silver"
  role_arn = aws_iam_role.cold_ec2_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://replace-with-artifacts/cold/raw_to_silver.py"
    python_version  = "3"
  }
}
