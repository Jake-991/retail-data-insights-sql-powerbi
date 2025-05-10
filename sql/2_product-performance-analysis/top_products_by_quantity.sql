-- Top 10 Products by Quantity Sold
-- Identifies the highest volume sellers, regardless of price or revenue impact

SELECT 
    p.product_name, 
    SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 10;
