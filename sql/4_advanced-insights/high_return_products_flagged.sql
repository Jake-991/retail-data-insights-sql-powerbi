-- Products with High Return Rate (Quality Flag >10%)

WITH sold AS (
  SELECT product_id, SUM(quantity) AS sold_qty
  FROM sales
  GROUP BY product_id
),
returned AS (
  SELECT product_id, SUM(quantity) AS return_qty
  FROM returns
  GROUP BY product_id
)
SELECT 
  s.product_id,
  p.product_name,
  COALESCE(r.return_qty, 0) AS total_returned,
  s.sold_qty,
  ROUND(COALESCE(r.return_qty, 0) / NULLIF(s.sold_qty, 0), 4) AS return_rate,
  CASE 
    WHEN COALESCE(r.return_qty, 0) / NULLIF(s.sold_qty, 0) > 0.10 THEN '⚠️ Review'
    ELSE '✅ Normal'
  END AS quality_flag
FROM sold s
LEFT JOIN returned r ON s.product_id = r.product_id
JOIN products p ON s.product_id = p.product_id
ORDER BY return_rate DESC;
