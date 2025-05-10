-- Average Stock Quantity Per Store
-- Measures inventory availability by location

SELECT 
    store_id, 
    ROUND(AVG(stock_quantity), 2) AS avg_stock
FROM inventory
GROUP BY store_id;
