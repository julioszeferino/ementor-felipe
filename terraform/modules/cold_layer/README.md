# cold_layer module

Covers the cold path:
- EC2 with Dockerized FastAPI (to be finalized)
- EventBridge scheduler for periodic API requests
- Glue job from RAW to Silver (Iceberg)
- Athena gold views (to be added)

## TODOs for implementation
- Replace AMI placeholder and add VPC, subnet, SG, IAM instance profile.
- Add EC2 user data to run Docker and FastAPI container.
- Add EventBridge target and permissions for API trigger workflow.
- Add Glue Data Catalog + Athena SQL for Gold views.
