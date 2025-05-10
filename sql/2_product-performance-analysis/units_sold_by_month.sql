-- Monthly Units Sold with Ranking
-- Identifies best and worst months by quantity

SELECT 
    DATE_FORMAT(date, "%M") AS month, 
    SUM(quantity) AS quantity,
    RANK() OVER (ORDER BY SUM(quantity) DESC) AS rank
FROM sales
GROUP BY DATE_FORMAT(date, "%M");
