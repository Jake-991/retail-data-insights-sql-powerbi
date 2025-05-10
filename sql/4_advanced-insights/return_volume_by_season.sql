-- Seasonal Return Volume

SELECT 
  CASE 
    WHEN MONTH(return_date) IN (12, 1, 2) THEN 'Winter'
    WHEN MONTH(return_date) IN (3, 4, 5) THEN 'Spring'
    WHEN MONTH(return_date) IN (6, 7, 8) THEN 'Summer'
    ELSE 'Fall'
  END AS season,
  COUNT(product_id) AS return_count
FROM returns
GROUP BY season;
