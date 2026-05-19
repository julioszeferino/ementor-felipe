from pydantic import BaseModel, Field


class IngestionRequest(BaseModel):
    source: str = Field(..., description="Source identifier")


class IngestionResponse(BaseModel):
    source: str
    records: int
    status: str
