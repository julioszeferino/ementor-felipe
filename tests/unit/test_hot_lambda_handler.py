import pytest

from hot_lambda.handler import lambda_handler

pytestmark = pytest.mark.unit


def test_lambda_handler_returns_record_count() -> None:
    event = {"Records": [{"id": 1}, {"id": 2}]}

    result = lambda_handler(event, context=None)

    assert result["status"] == "received"
    assert result["records"] == "2"
