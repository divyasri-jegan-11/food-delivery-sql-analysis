-- Block 4: Customer Experience & Revenue Impact
-- Purpose: Measure customer satisfaction using ratings and
-- quantify the financial impact of cancellations.

-- Average Ratings
SELECT
  COUNT(order_id) AS total_ratings,
  ROUND(AVG(rating), 2) AS avg_rating
FROM fact_ratings;

-- Average Ratings by City
SELECT
  r.city,
  COUNT(fr.order_id) AS total_orders,
  ROUND(AVG(fr.rating), 2) AS avg_rating
FROM fact_ratings fr
JOIN fact_orders o
  ON fr.order_id = o.order_id
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
GROUP BY r.city
ORDER BY avg_rating ASC;

-- Delivery Time Bucket
SELECT
  CASE
    WHEN d.actual_delivery_time_mins <= 30 THEN '0–30 mins'
    WHEN d.actual_delivery_time_mins <= 45 THEN '31–45 mins'
    WHEN d.actual_delivery_time_mins <= 60 THEN '46–60 mins'
    ELSE '60+ mins'
  END AS delivery_time_bucket,
  COUNT(fr.order_id) AS total_orders,
  ROUND(AVG(fr.rating), 2) AS avg_rating
FROM fact_ratings fr
JOIN fact_delivery_performance d
  ON fr.order_id = d.order_id
GROUP BY delivery_time_bucket
ORDER BY delivery_time_bucket;

-- Estimated Revenue Loss
SELECT
  COUNT(order_id) * (
    SELECT AVG(total_amount)
    FROM fact_orders
    WHERE LOWER(is_cancelled) IN ('n','no','false','0')
  ) AS estimated_revenue_lost
FROM fact_orders
WHERE LOWER(is_cancelled) IN ('y','yes','true','1');

-- Estimated Revenue Loss by City
SELECT
  r.city,
  COUNT(o.order_id) AS cancelled_orders,
  ROUND(
    COUNT(o.order_id) * (
      SELECT AVG(total_amount)
      FROM fact_orders
      WHERE LOWER(is_cancelled) IN ('n','no','false','0')
    ),
    2
  ) AS estimated_revenue_lost
FROM fact_orders o
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
WHERE LOWER(o.is_cancelled) IN ('y','yes','true','1')
GROUP BY r.city
ORDER BY estimated_revenue_lost DESC;

