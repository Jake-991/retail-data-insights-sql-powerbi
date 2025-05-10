-- Compare Revenue Between Older and Newer Stores

WITH store_age AS (
  SELECT 
    store_id,
    CASE 
      WHEN open_date <= CURDATE() - INTERVAL 5 YEAR THEN 'Old'
      ELSE 'New'
    END AS age_group
  FROM stores
),
store_revenue AS (
  SELECT store_id, SUM(quantity * unit_price * (1 - discount)) AS revenue
  FROM sales
  GROUP BY store_id
)
SELECT 
    age_group,
    COUNT(*) AS num_stores,
    ROUND(AVG(revenue), 2) AS avg_revenue,
    ROUND(SUM(revenue), 2) AS total_revenue
FROM store_age sa
JOIN store_revenue sr ON sa.store_id = sr.store_id
GROUP BY age_group;
