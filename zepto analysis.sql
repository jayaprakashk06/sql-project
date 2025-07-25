create database zepto;
use zepto;
drop table analysis;
create table analysis(
Category varchar(100),
name varchar(100),
mrp int,
discountPercent int,
availableQuantity int,
discountedSellingPrice int,
weightInGms int,
outOfStock varchar(100),
quantity int
);
select* from analysis;
select distinct category from zepto.analysis;
select category,round(avg(discountpercent),2)  as avg_discount
from analysis
group by Category;

select category,sum(discountedsellingprice*availableQuantity) as total_sales
from analysis
group by category;

select category,sum(availableQuantity) as total_quantity
from analysis
group by category;

SELECT name, ROUND(AVG(discountedsellingprice), 2) AS avg_price
FROM analysis
GROUP BY name
ORDER BY avg_price DESC;

select category,sum(discountedsellingprice*availableQuantity) as total_sales
from analysis
group by category
order by total_sales;

select*from analysis;

SELECT category,ROUND(SUM(discountedsellingprice * availableQuantity) * 100 / 
         (SELECT SUM(discountedsellingprice * availableQuantity) FROM analysis), 2) AS percent_share
FROM analysis
GROUP BY category
ORDER BY percent_share DESC;

SELECT name, ROUND(SUM(discountedsellingprice * availableQuantity), 2) AS revenue
FROM analysis
GROUP BY name
ORDER BY revenue DESC
LIMIT 10;

SELECT category,
    ROUND(AVG((mrp - discountedsellingprice) / mrp * 100), 2) AS avg_discount_percent
FROM analysis
WHERE mrp > 0
group by category;

SELECT 
    name,
    availableQuantity,
    ROUND(discountedsellingprice * availableQuantity, 2) AS total_revenue,
    CASE 
        WHEN availableQuantity > 100 AND (discountedsellingprice * availableQuantity) < 10000 THEN 'Slow-Moving'
        WHEN availableQuantity < 50 AND (discountedsellingprice * availableQuantity) > 10000 THEN 'Fast-Moving'
        ELSE 'Moderate'
    END AS product_type

FROM analysis
ORDER BY product_type;

SELECT 
    product_type,
    COUNT(*) AS product_count
FROM (
    SELECT 
        name,
        availableQuantity,
        discountedsellingprice,
        (discountedsellingprice * availableQuantity) AS total_revenue,
        CASE 
            WHEN availableQuantity > 100 AND (discountedsellingprice * availableQuantity) < 10000 THEN 'Slow-Moving'
            WHEN availableQuantity < 50 AND (discountedsellingprice * availableQuantity) > 10000 THEN 'Fast-Moving'
            ELSE 'Moderate'
        END AS product_type
    FROM analysis
) AS categorized_products
GROUP BY product_type;

SELECT 
    name,
    mrp,
    discountedsellingprice,
    ROUND(((mrp - discountedsellingprice) / mrp) * 100, 2) AS margin_percentage
FROM analysis
WHERE mrp > 0
ORDER BY margin_percentage DESC
LIMIT 10;

select*from analysis;

select category,round(avg(discountedsellingprice),2) as avg_selling_price
from analysis
group by category
order by avg_selling_price desc;

SELECT 
    name,
    availableQuantity
FROM analysis
WHERE availableQuantity < 10
ORDER BY availableQuantity ASC;







