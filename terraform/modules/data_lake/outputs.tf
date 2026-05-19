output "raw_bucket_name" {
  value = aws_s3_bucket.raw.bucket
}

output "loc_bucket_name" {
  value = aws_s3_bucket.loc.bucket
}

output "silver_bucket_name" {
  value = aws_s3_bucket.silver.bucket
}

output "raw_bucket_arn" {
  value = aws_s3_bucket.raw.arn
}

output "loc_bucket_arn" {
  value = aws_s3_bucket.loc.arn
}

output "silver_bucket_arn" {
  value = aws_s3_bucket.silver.arn
}
