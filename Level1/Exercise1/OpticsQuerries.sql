-- List the total invoices for a customer in a given period
SELECT COUNT(*) AS total_facturas
FROM Sale
WHERE customer_id = 1
AND sale_date BETWEEN '2025-05-15' AND '2025-05-15';

-- List the different models of glasses that an employee has sold during a year
SELECT DISTINCT g.brand AS modelo_gafas
FROM Sale s
JOIN Glasses g ON s.glasses_id = g.id
WHERE s.employee_id = 1
AND YEAR(s.sale_date) = 2025;

-- List the different suppliers that have supplied glasses that have been successfully sold by the optician
SELECT DISTINCT sp.name AS proveedor
FROM Sale s
JOIN Glasses g ON s.glasses_id = g.id
JOIN Supplier sp ON g.supplier_id = sp.id;

