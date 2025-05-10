-- Products Restocked More Than Once in the Last Year

SELECT 
    store_id, 
    product_id, 
    COUNT(restock_date) AS restock_count
FROM inventory
WHERE restock_date BETWEEN CURDATE() - INTERVAL 1 YEAR AND CURDATE()
GROUP BY store_id, product_id
HAVING restock_count > 1
ORDER BY store_id;
