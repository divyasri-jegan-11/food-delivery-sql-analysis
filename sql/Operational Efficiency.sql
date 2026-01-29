-- Block 3: Operational Efficiency
-- Purpose: Evaluate reliability of order fulfillment by analysing
-- cancellations and delivery SLA performance.

-- Cancellation Rate
SELECT
  COUNT(order_id) AS total_orders,
  SUM(CASE WHEN is_cancelled = 'Y' THEN 1 ELSE 0 END) AS cancelled_orders,
  ROUND(
    SUM(CASE WHEN is_cancelled = 'Y' THEN 1 ELSE 0 END) * 100.0
    / COUNT(order_id),
    2
  ) AS cancellation_rate_pct
FROM fact_orders;


-- Cancellation Rate by City
SELECT
  r.city,
  COUNT(o.order_id) AS total_orders,
  SUM(CASE WHEN o.is_cancelled = 'Y' THEN 1 ELSE 0 END) AS cancelled_orders,
  ROUND(
    SUM(CASE WHEN o.is_cancelled = 'Y' THEN 1 ELSE 0 END) * 100.0
    / COUNT(o.order_id),
    2
  ) AS cancellation_rate_pct
FROM fact_orders o
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY cancellation_rate_pct DESC;

-- Average delivery time
SELECT
  ROUND(AVG(actual_delivery_time_mins), 2) AS avg_delivery_time_mins
FROM fact_delivery_performance;

-- SLA Breach rate
SELECT
  COUNT(order_id) AS total_deliveries,
  SUM(
    CASE
      WHEN actual_delivery_time_mins > expected_delivery_time_mins THEN 1
      ELSE 0
    END
  ) AS sla_breaches,
  ROUND(
    SUM(
      CASE
        WHEN actual_delivery_time_mins > expected_delivery_time_mins THEN 1
        ELSE 0
      END
    ) * 100.0 / COUNT(order_id),
    2
  ) AS sla_breach_pct
FROM fact_delivery_performance;

-- SLA Breach rate by City
SELECT
  r.city,
  COUNT(d.order_id) AS total_orders,
  SUM(
    CASE
      WHEN d.actual_delivery_time_mins > d.expected_delivery_time_mins THEN 1
      ELSE 0
    END
  ) AS sla_breaches,
  ROUND(
    SUM(
      CASE
        WHEN d.actual_delivery_time_mins > d.expected_delivery_time_mins THEN 1
        ELSE 0
      END
    ) * 100.0 / COUNT(d.order_id),
    2
  ) AS sla_breach_pct
FROM fact_delivery_performance d
JOIN fact_orders o
  ON d.order_id = o.order_id
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY sla_breach_pct DESC;
