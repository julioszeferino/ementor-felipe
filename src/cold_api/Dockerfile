FROM python:3.11-slim

WORKDIR /app

# Run the API as a non-root user to satisfy container security best practices.
RUN useradd --create-home --shell /usr/sbin/nologin appuser

COPY requirements-dev.txt /tmp/requirements-dev.txt
RUN pip install --no-cache-dir -r /tmp/requirements-dev.txt

COPY src/cold_api /app
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
