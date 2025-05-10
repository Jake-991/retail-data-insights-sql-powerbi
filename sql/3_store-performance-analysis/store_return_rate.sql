-- Stores with return rate > 5%

WITH sold AS (
    SELECT store_id, SUM(quantity) AS sold_qty
    FROM sales
    GROUP BY store_id
),
returned AS (
    SELECT store_id, SUM(quantity) AS return_qty
    FROM returns
    GROUP BY store_id
)
SELECT s.store_id,
       CASE 
         WHEN r.return_qty / s.sold_qty > 0.05 THEN 'Dissatisfied'
         ELSE 'Good'
       END AS satisfaction
FROM sold s
JOIN returned r ON s.store_id = r.store_id;
