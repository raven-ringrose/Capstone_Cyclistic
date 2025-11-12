-- -----------------------------------------------------------------------------
-- Create Clean Combined Trips Table (2019 Q1 + 2020 Q2)
-- Author: Christine “Raven” Ringrose
-- Description:
--   Normalizes schema differences between 2019 and 2020 Cyclistic data,
--   stacks both tables, and computes trip duration in minutes.
--   Filters out invalid or impossible rides.
-- -----------------------------------------------------------------------------

CREATE OR REPLACE TABLE `singular-elixir-470519-u5.Cyclistic.trips_clean` AS
WITH

-- 1) Normalize 2019 format to match 2020 format
norm_2019 AS (
  SELECT
    start_time AS started_at,      -- already TIMESTAMP in 2019 table
    end_time   AS ended_at,
    CAST(from_station_id AS STRING) AS start_station_id,
    from_station_name AS start_station_name,
    CAST(to_station_id AS STRING)   AS end_station_id,
    to_station_name AS end_station_name,
    CASE
      WHEN usertype = 'Subscriber' THEN 'member'
      ELSE 'casual'
    END AS member_casual
  FROM `singular-elixir-470519-u5.Cyclistic.2019_Q1_Cleaned`
  WHERE start_time IS NOT NULL
    AND end_time   IS NOT NULL
),

-- 2) Normalize 2020 table (already close to final schema)
norm_2020 AS (
  SELECT
    started_at,
    ended_at,
    CAST(start_station_id AS STRING) AS start_station_id,
    start_station_name,
    CAST(end_station_id   AS STRING) AS end_station_id,
    end_station_name,
    member_casual
  FROM `singular-elixir-470519-u5.Cyclistic.2020_Q2_Cleaned`
  WHERE started_at IS NOT NULL
    AND ended_at   IS NOT NULL
),

-- 3) Combine all cleaned trips
all_trips AS (
  SELECT * FROM norm_2019
  UNION ALL
  SELECT * FROM norm_2020
)

-- 4) Add trip duration and remove invalid rides
SELECT
  *,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS trip_duration_min
FROM all_trips
WHERE ended_at > started_at
  AND TIMESTAMP_DIFF(ended_at, started_at, MINUTE) BETWEEN 1 AND 1440;
