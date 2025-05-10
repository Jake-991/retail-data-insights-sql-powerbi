-- Stores with both low average stock and low revenue

WITH store_revenue AS (
  SELECT store_id, SUM(quantity * unit_price * (1 - discount)) AS revenue
  FROM sales
  GROUP BY store_id
),
low_performance AS (
  SELECT s.store_id,
         CASE 
           WHEN sr.revenue < (SELECT AVG(revenue) * 0.8 FROM store_revenue)
           THEN 'Low Performance'
           ELSE 'Normal'
         END AS performance
  FROM stores s
  JOIN store_revenue sr ON s.store_id = sr.store_id
),
stock_levels AS (
  SELECT store_id, AVG(stock_quantity) AS avg_stock
  FROM inventory
  GROUP BY store_id
)
SELECT lp.store_id,
       CASE 
         WHEN sl.avg_stock < 30 AND lp.performance = 'Low Performance'
         THEN 'Low Stock & Low Revenue'
         ELSE 'Not Low Risk'
       END AS store_status
FROM low_performance lp
JOIN stock_levels sl ON lp.store_id = sl.store_id;
