-- Revenue Breakdown: Weekdays vs Weekends
-- Understands customer behavior by day type

SELECT 
  CASE 
    WHEN DAYOFWEEK(date) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  ROUND(SUM(quantity * unit_price * (1 - discount)), 2) AS revenue
FROM sales
GROUP BY day_type;
