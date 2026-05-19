from datetime import UTC, datetime
from uuid import uuid4


def build_event() -> dict[str, str]:
    return {
        "event_id": str(uuid4()),
        "event_time": datetime.now(UTC).isoformat(),
        "source": "hot-layer-producer",
        "payload": "implement-me",
    }


def publish_stub() -> dict[str, str]:
    # This function is intentionally a stub for future boto3/SQS integration.
    return build_event()
