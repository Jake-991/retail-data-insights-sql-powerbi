-- Stores with low revenue per square foot (< $100)

WITH store_revenue AS (
  SELECT store_id, SUM(quantity * unit_price * (1 - discount)) AS revenue
  FROM sales
  GROUP BY store_id
)
SELECT s.store_id, ROUND(sr.revenue / s.store_size_sqft, 2) AS revenue_per_sqft
FROM stores s
JOIN store_revenue sr ON s.store_id = sr.store_id
WHERE sr.revenue / s.store_size_sqft < 100;
