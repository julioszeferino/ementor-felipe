import pytest
from fastapi.testclient import TestClient

from cold_api.app.main import app

client = TestClient(app)
pytestmark = pytest.mark.unit


def test_health_endpoint() -> None:
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "ok"}
