# 🛍️ Retail Data Insights with SQL & Power BI

A business-focused analytics project using SQL for data transformation and insight generation, with Power BI for visual storytelling. This project simulates a real-world scenario where a retailer wants to understand product performance, store efficiency, and operational challenges across sales, inventory, and returns.

---
## Table of Contents
- [📌 Project Objective](#-project-objective)
- [🛠 Tools & Skills Used](#-tools--skills-used)
- [📂 SQL Files](#-sql-files)
- [🧾 Example SQL Logic](#-example-sql-logic)
- [🗃️ Data Sources](#-data-sources)
- [🧠 Key Business Questions](#-key-business-questions)
- [🔄 ETL & Modeling Approach](#-etl--modeling-approach)
- [📊 Dashboard Highlights](#-dashboard-highlights)
- [📊 Power BI Visualizations](#-power-bi-visualizations)
- [🔍 Key Takeaways](#-key-takeaways)
- [📬 Contact](#-contact)

## 📌 Project Objective

To help business stakeholders make informed decisions by analyzing:
- Which products drive the most revenue and profit
- Which stores are underperforming or inefficient
- How returns and inventory affect business operations
- What time-based patterns affect sales trends

---

## 🛠 Tools & Skills Used

- **SQL (MySQL Workbench)** – Joins, CTEs, aggregation, CASE logic
- **Power BI** – Dashboards, KPI cards, DAX measures, visual design
- **DAX** – Custom measures for profit, return rate, revenue per square foot
- **Excel** – Preload data review
- **Data Modeling** – Schema design and table relationships
### 📂 SQL Files  
Explore detailed queries for each phase:
- [Product Analysis](./sql/2_product-performance-analysis/)
- [Store Performance](./sql/3_store-performance-analysis/)
- [Advanced Insights](./sql/4_advanced-insights/)
## 🧾 Example SQL Logic

This project was SQL-driven. Here's an example query to flag underperforming stores based on revenue:

```sql
WITH store_revenue AS (
  SELECT store_id,
         SUM(quantity * unit_price * (1 - discount)) AS total_revenue
  FROM sales
  GROUP BY store_id
)
SELECT store_id,
       CASE 
           WHEN total_revenue < (SELECT AVG(total_revenue) * 0.7 FROM store_revenue)
           THEN 'Underperforming'
           ELSE 'Normal'
       END AS status
FROM store_revenue;
```
---

## 🗃️ Data Sources

This project uses five synthetic CSV datasets:
- `sales.csv` – Transaction-level records
- `products.csv` – Product cost and category info
- `stores.csv` – Store size, region, open date
- `inventory.csv` – Stock levels and restock dates
- `returns.csv` – Quantity and reasons for product returns

---

## 🧠 Key Business Questions

### 📦 Product Performance
- What are the top-selling and most profitable products?
- Which products have high return rates (potential quality issues)?
- Which products underperform in both revenue and volume?

### 🏬 Store Performance
- Which stores generate the most revenue?
- Are any stores underperforming based on revenue vs. average?
- Which stores have high return rates or low stock levels?

### 📅 Time Trend Analysis
- How does revenue fluctuate over time?
- Which months drive the most sales?
- Are weekends stronger than weekdays?

---

## 🔄 ETL & Modeling Approach

- Imported all CSVs into SQL and used joins/CTEs to perform calculations.
- Modeled clean, joined tables in Power BI using relationships on `product_id` and `store_id`.
- Created dynamic DAX measures for profit, return rate, average stock, and revenue efficiency.
- Used conditional formatting and card visuals to highlight business risks and opportunities.

---

## 📊 Dashboard Highlights

### ✅ Product Page
- Top 10 products by revenue and quantity
- High return rate flag
- Profit margin comparison

### ✅ Store Page
- Revenue vs. benchmark
- Revenue per square foot
- Underperforming store identification logic

### ✅ Time Trend Page
- Monthly revenue trends
- Peak vs. low performance periods
- Regional performance comparison over time

---

## 📊 Power BI Visualizations

### Product Performance Overview
![Product Overview](images/product_overview.png)

### Store Performance Overview
![Store Overview](images/store_overview.png)

### Time-Based Revenue Trends
![Trend Analysis](images/trend_analysis.png)

---

## 🔍 Key Takeaways

- SQL was used as the primary engine for cleaning, transformation, and logic.
- Power BI enabled flexible presentation of actionable insights.
- Data modeling and DAX were used to simulate stakeholder KPIs.
- The project demonstrates readiness for junior-level business/data analyst roles with real-world expectations.
---
## Conclusion

This project provided valuable insights into product performance, store efficiency, and operational challenges. By leveraging SQL for data analysis and Power BI for visualization, we identified key areas for improvement and strategic opportunities for the retail business.
---

## 📬 Contact

Created by **[Jake Ma]** — [[LinkedIn Profile](https://www.linkedin.com/in/jake-ma-0a4278282/)]  
Let’s connect if you’re hiring or want to discuss practical data storytelling.
