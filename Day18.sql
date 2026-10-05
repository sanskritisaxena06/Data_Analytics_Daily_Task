show databases;
use ecommerce;

-- inner join
SELECT
    s.sales_id,
    p.product_name,
    p.price,
    s.quantity,
    o.order_id,
    o.order_status
FROM Sales s
INNER JOIN Product p
    ON s.product_id = p.product_id
INNER JOIN Orders o
    ON s.order_id = o.order_id;

-- left join

SELECT
    p.product_id,
    p.product_name,
    p.price,
    s.sales_id,
    s.quantity
FROM Product p
LEFT JOIN Sales s
    ON p.product_id = s.product_id;
    
-- right join
SELECT
    s.sales_id,
    s.quantity,
    p.product_id,
    p.product_name,
    p.price
FROM Sales s
RIGHT JOIN Product p
    ON s.product_id = p.product_id;
    
    
-- full outer join
SELECT
    p.product_id,
    p.product_name,
    s.sales_id,
    s.quantity
FROM Product p
LEFT JOIN Sales s
    ON p.product_id = s.product_id
UNION
SELECT
    p.product_id,
    p.product_name,
    s.sales_id,
    s.quantity
FROM Product p
RIGHT JOIN Sales s
    ON p.product_id = s.product_id;
    
-- self join
SELECT
    p1.product_name AS Product1,
    p2.product_name AS Product2,
    p1.stock
FROM Product p1
INNER JOIN Product p2
    ON p1.stock = p2.stock
    AND p1.product_id < p2.product_id;