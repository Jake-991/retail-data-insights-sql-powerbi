-- Monthly Revenue Trend
-- Evaluates how sales revenue fluctuates over time

SELECT 
    DATE_FORMAT(s.date, '%Y-%m') AS month,
    ROUND(SUM(s.quantity * s.unit_price * (1 - s.discount)), 2) AS monthly_revenue
FROM sales s
GROUP BY month
ORDER BY month;
