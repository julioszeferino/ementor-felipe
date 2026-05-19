def lambda_handler(event: dict, context: object) -> dict[str, str]:
    _ = context
    # Skeleton handler: parse SQS records and persist LOC/raw event data to S3.
    return {"status": "received", "records": str(len(event.get("Records", [])))}
