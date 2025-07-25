# sql-project
# 🧮 Zepto Sales Analysis – SQL Mini Project

## 📌 Overview
This mini project demonstrates the use of SQL for analyzing a sales dataset from Zepto. It includes queries to explore category-level performance, product pricing trends, stock analysis, and product movement classification (Fast/Slow-Moving).

## 📁 Dataset
- **File**: `zepto_v2.csv`
- **Format**: CSV
- **Imported into Table**: `analysis`
- **Columns**:
  - `Category`
  - `name`
  - `mrp`
  - `discountPercent`
  - `availableQuantity`
  - `discountedSellingPrice`
  - `weightInGms`
  - `outOfStock`
  - `quantity`

## ⚙️ Tools Used
- MySQL Workbench
- SQL

## 🔍 Key Analyses Performed
- **Average discount % by category**
- **Total sales value by category**
- **Top revenue-generating products**
- **Fast vs Slow-Moving product classification**
- **Average selling price by category and product**
- **Top 10 products by profit margin**
- **Restock suggestions based on availability**

## 🧠 Sample Query
```sql
SELECT 
    category,
    ROUND(AVG(discountedsellingprice), 2) AS avg_selling_price
FROM analysis
GROUP BY category
ORDER BY avg_selling_price DESC;
