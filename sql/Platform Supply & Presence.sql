--Block 1
--Restaurant Count by City 

SELECT
  city,
  COUNT(DISTINCT restaurant_id) AS total_restaurants
FROM dim_restaurant
WHERE LOWER(is_active) IN ('yes','true','1','y')
GROUP BY city
ORDER BY total_restaurants DESC;

-- Restaurant Count by cuisine_type
SELECT
  cuisine_type,
  COUNT(DISTINCT restaurant_id) AS restaurant_count
FROM dim_restaurant
WHERE LOWER(is_active) IN ('yes','true','1','y')
GROUP BY cuisine_type
ORDER BY restaurant_count DESC;

--Delivery_partners
SELECT
  city,
  COUNT(DISTINCT delivery_partner_id) AS total_delivery_partners
FROM dim_delivery_partner_
WHERE LOWER(is_active) IN ('yes','true','1','y')
GROUP BY city
ORDER BY total_delivery_partners DESC;

--Restaurants Vs Delivery_partners
SELECT
  r.city,
  COUNT(DISTINCT r.restaurant_id) AS restaurants,
  COUNT(DISTINCT d.delivery_partner_id) AS delivery_partners
FROM dim_restaurant r
LEFT JOIN dim_delivery_partner_ d
  ON r.city = d.city
  AND LOWER(TRIM(d.is_active)) IN ('yes','true','1','y')
WHERE LOWER(TRIM(r.is_active)) IN ('yes','true','1','y')
GROUP BY r.city;
