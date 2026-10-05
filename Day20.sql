USE ecommerce;
-- basic kpi
SELECT
    COUNT(DISTINCT order_id) AS Total_Orders,
    SUM(sales) AS Total_Sales,
    AVG(sales) AS Average_Order_Value,
    SUM(CASE WHEN order_status = 'Completed' THEN 1 ELSE 0 END) AS Completed_Orders,
    SUM(CASE WHEN order_status = 'Pending' THEN 1 ELSE 0 END) AS Pending_Orders,
    SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Orders
FROM Orders;

-- product kpi 
SELECT
    COUNT(*) AS Total_Products,
    SUM(stock) AS Total_Stock,
    AVG(price) AS Average_Product_Price,
    MAX(price) AS Highest_Product_Price,
    MIN(price) AS Lowest_Product_Price
FROM Product;

-- sales kpi 
SELECT
    COUNT(*) AS Total_Sales_Transactions,
    SUM(quantity) AS Total_Quantity_Sold,
    AVG(quantity) AS Average_Quantity_Per_Sale
FROM Sales;

-- order kpi
SELECT
    order_status,
    COUNT(*) AS Number_Of_Orders,
    SUM(sales) AS Total_Sales
FROM Orders
GROUP BY order_status;

-- return kpi
SELECT
    COUNT(*) AS Total_Returns,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Orders),
        2
    ) AS Return_Rate_Percentage
FROM Returns;

-- product wise sales kpi
SELECT
    p.product_name,
    SUM(s.quantity) AS Quantity_Sold,
    SUM(o.sales) AS Total_Sales
FROM Sales s
INNER JOIN Product p
    ON s.product_id = p.product_id
INNER JOIN Orders o
    ON s.order_id = o.order_id
GROUP BY p.product_id, p.product_name
ORDER BY Total_Sales DESC;

