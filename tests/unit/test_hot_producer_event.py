import pytest

from hot_producer.producer import build_event

pytestmark = pytest.mark.unit


def test_build_event_contract() -> None:
    event = build_event()

    assert "event_id" in event
    assert "event_time" in event
    assert event["source"] == "hot-layer-producer"
