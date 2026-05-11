FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --root-user-action=ignore -r requirements.txt && \
    useradd -m appuser && \
    chown -R appuser /app

COPY scripts/ ./scripts/

CMD ["python", "scripts/ingestion/load_csv_to_postgres.py"]

