SELECT SUM(oi.quantity) AS total_drinks_sold
FROM Order_Items oi
JOIN Orders o ON oi.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Localities l ON c.locality_id = l.locality_id
JOIN Products p ON oi.product_id = p.product_id
WHERE p.product_name = 'drinks'
AND l.locality_name = 'Amposta';
  
SELECT e.first_name, e.last_name, COUNT(o.order_id) AS total_pedidos  
FROM Employee e  
JOIN Orders o ON o.employee_id = e.employee_id  
WHERE e.employee_id = 1  
GROUP BY e.first_name, e.last_name;