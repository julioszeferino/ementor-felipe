import pytest
from fastapi.testclient import TestClient

from cold_api.app.main import app

client = TestClient(app)
pytestmark = pytest.mark.integration


def test_ingest_contract() -> None:
    payload = {"source": "eventbridge-job"}

    response = client.post("/ingest", json=payload)

    assert response.status_code == 200
    assert response.json()["status"] == "accepted"
    assert response.json()["source"] == "eventbridge-job"
