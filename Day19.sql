show databases;
drop database temple;
use ecommerce;

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status
HAVING COUNT(*) > 2;

use sanskriti;
show tables;
truncate table students;