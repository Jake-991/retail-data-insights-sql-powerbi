-- Identify underperforming stores: Revenue < 80% of portfolio average

WITH store_revenue AS (
  SELECT store_id, SUM(quantity * unit_price * (1 - discount)) AS total_revenue
  FROM sales
  GROUP BY store_id
)
SELECT s.store_id, total_revenue,
       CASE 
         WHEN total_revenue < (SELECT AVG(total_revenue) * 0.8 FROM store_revenue)
         THEN 'Underperforming'
         ELSE 'Normal'
       END AS performance
FROM stores s
JOIN store_revenue sr ON s.store_id = sr.store_id;
