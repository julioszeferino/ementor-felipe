variable "project_name" {
  description = "Project identifier used in resource names and tags"
  type        = string
}

variable "environment" {
  description = "Environment name, e.g. dev/stg/prd"
  type        = string
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

variable "raw_bucket_name" {
  description = "S3 bucket for cold RAW layer"
  type        = string
}

variable "loc_bucket_name" {
  description = "S3 bucket for hot LOC layer"
  type        = string
}

variable "silver_bucket_name" {
  description = "S3 bucket for Silver layer in Iceberg format"
  type        = string
}
