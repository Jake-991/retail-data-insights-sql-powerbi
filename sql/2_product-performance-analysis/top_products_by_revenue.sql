-- Top 10 Products by Total Revenue
-- Highlights the products contributing most to top-line sales

SELECT 
    p.product_name, 
    ROUND(SUM(s.quantity * s.unit_price * (1 - s.discount)), 2) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;
