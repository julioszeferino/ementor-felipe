# data_lake module

This module owns S3 buckets for RAW, LOC, and Silver layers.

## TODOs for implementation
- Add bucket policies for producer/consumer principals.
- Add lifecycle policies (retention by layer).
- Add Glue catalog tables and Iceberg metadata management.
- Add KMS CMK and key policies if AES256 is not sufficient.
