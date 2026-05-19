import pytest

from hot_producer.producer import publish_stub

pytestmark = pytest.mark.unit


def test_publish_stub_returns_event_contract() -> None:
    event = publish_stub()

    assert event["source"] == "hot-layer-producer"
    assert "event_id" in event
    assert "event_time" in event
