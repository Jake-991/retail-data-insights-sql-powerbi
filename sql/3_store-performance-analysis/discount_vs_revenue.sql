-- Are stores heavily discounting but not generating revenue?

WITH store_revenue AS (
  SELECT store_id, SUM(quantity * unit_price * (1 - discount)) AS revenue
  FROM sales
  GROUP BY store_id
),
discount_avg AS (
  SELECT store_id, AVG(discount) AS avg_discount
  FROM sales
  GROUP BY store_id
)
SELECT sr.store_id, avg_discount,
       CASE 
         WHEN avg_discount > 0.20 AND sr.revenue < (SELECT AVG(revenue) * 0.8 FROM store_revenue)
         THEN 'Not Paying Off'
         ELSE 'OK'
       END AS performance
FROM store_revenue sr
JOIN discount_avg da ON sr.store_id = da.store_id;
