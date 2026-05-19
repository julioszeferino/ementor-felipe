-- Skeleton SQL for Gold views in Athena.
-- Replace silver_* table names with actual Glue catalog + Iceberg table references.

CREATE OR REPLACE VIEW gold_unified_events AS
SELECT
  source,
  event_time,
  payload
FROM silver_hot_events
UNION ALL
SELECT
  source,
  ingestion_time AS event_time,
  payload
FROM silver_cold_events;
