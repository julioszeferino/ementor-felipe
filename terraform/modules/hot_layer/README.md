# hot_layer module

Covers the hot path:
- EC2 producer (Python + boto3)
- SQS ingestion queue
- Lambda consumer writing LOC to S3
- Glue micro-batch LOC to Silver (Iceberg)
- Athena gold views (to be added)

## TODOs for implementation
- Replace AMI and add networking/IAM hardening.
- Package lambda artifact in CI and update `filename`.
- Add DLQ, redrive policy, retries, and idempotency controls.
- Add Glue catalog registrations and Athena views.
