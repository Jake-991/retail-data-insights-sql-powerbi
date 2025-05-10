-- Profit Margin Per Product (Revenue - Cost)

SELECT 
    p.product_name,
    ROUND(SUM(s.quantity * s.unit_price * (1 - s.discount)) - SUM(s.quantity * p.cost), 2) AS profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY profit DESC;
