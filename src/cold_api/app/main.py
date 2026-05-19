from fastapi import FastAPI

from .schemas import IngestionRequest, IngestionResponse

app = FastAPI(title="Cold Layer API Skeleton", version="0.1.0")


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/ingest", response_model=IngestionResponse)
def ingest(request: IngestionRequest) -> IngestionResponse:
    # Skeleton contract: actual extraction/RAW write logic will be implemented later.
    return IngestionResponse(source=request.source, records=0, status="accepted")
