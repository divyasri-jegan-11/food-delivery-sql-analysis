--Block 2
--Purpose: Understand Average Order Value

-- Overall AOV
SELECT
  SUM(total_amount) AS total_revenue,
  COUNT(order_id) AS total_orders,
  ROUND(SUM(total_amount) * 1.0 / COUNT(order_id), 2) AS calculated_aov
FROM fact_orders
WHERE is_cancelled = 'N';

-- AOV by City
SELECT
  r.city,
  SUM(total_amount) AS total_revenue,
  COUNT(o.order_id) AS total_orders,
  ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM fact_orders o
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
WHERE is_cancelled = 'N'
GROUP BY r.city
ORDER BY avg_order_value DESC;

-- AOV by Restaurant
SELECT
  r.restaurant_name,
  r.city,
  SUM(total_amount) AS total_revenue,
  COUNT(o.order_id) AS total_orders,
  ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM fact_orders o
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
WHERE is_cancelled = 'N'
GROUP BY r.restaurant_name, r.city
HAVING COUNT(o.order_id) >= 20
ORDER BY avg_order_value DESC;

-- AOV by Cuisine
SELECT
  r.cuisine_type,
  SUM(total_amount) AS total_revenue,
  COUNT(o.order_id) AS total_orders,
  ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM fact_orders o
JOIN dim_restaurant r
  ON o.restaurant_id = r.restaurant_id
WHERE is_cancelled = 'N'
GROUP BY r.cuisine_type
ORDER BY avg_order_value DESC;

-- Order value bucket
SELECT
  CASE
    WHEN total_amount < 200 THEN '< 200'
    WHEN total_amount BETWEEN 200 AND 400 THEN '200–400'
    WHEN total_amount BETWEEN 401 AND 600 THEN '401–600'
    ELSE '600+'
  END AS order_value_bucket,
  COUNT(order_id) AS orders
FROM fact_orders
WHERE is_cancelled = 'N'
GROUP BY order_value_bucket
ORDER BY orders DESC;
