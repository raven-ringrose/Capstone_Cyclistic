-- Calculate average trip duration by user type
SELECT
  member_casual,
  ROUND(AVG(trip_duration_min), 1) AS avg_trip_duration_min
FROM
  `singular-elixir-470519-u5.Cyclistic.trips_clean`
GROUP BY
  member_casual;
