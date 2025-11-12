# SQL Scripts – Capstone: Cyclistic by Raven Ringrose

This folder contains the BigQuery SQL scripts used to build and validate the dataset for the **Cyclistic Q1 2025 rider analysis**.  
The goal is to make the data preparation process **transparent and reproducible**.

---

## Files

### `create_trips_clean.sql`
**Purpose:** Build the main analysis table `Cyclistic.trips_clean`.

**Key steps:**
- Normalizes schema differences between **2019_Q1_Cleaned** and **2020_Q2_Cleaned**
  - Renames columns (e.g., `start_time` → `started_at`)
  - Casts station IDs to `STRING`
  - Maps `Subscriber` / `Customer` to `member` / `casual`
- Stacks both quarters using `UNION ALL`
- Calculates `trip_duration_min` with `TIMESTAMP_DIFF`
- Filters out invalid rides (null timestamps, negative or extreme durations)

Result: a single, clean table ready for exploratory analysis and visualization.

---

### `data_validation.sql`
**Purpose:** Run basic checks on `trips_clean` to confirm the data looks reasonable.

**Key steps:**
- Calculates average trip duration by `member_casual`
- Ensures durations are in a realistic range for both rider types

Result: confidence that the cleaned table behaves as expected before moving into BI tools and final storytelling.

---

## How to use these scripts

1. Open BigQuery in the **`singular-elixir-470519-u5`** project.
2. Run `create_trips_clean.sql` to (re)build the `Cyclistic.trips_clean` table.
3. Run `data_validation.sql` to verify the resulting data.
4. Use `trips_clean` as the source for downstream analysis and dashboards (Looker Studio, R, etc.).
