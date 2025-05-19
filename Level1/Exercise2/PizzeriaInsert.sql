INSERT INTO Provinces (province_name) VALUES ('Tarragona'), ('Barcelona');
INSERT INTO Localities (locality_name, province_id) VALUES 
('Amposta', 1),
('Reus', 1),
('Sabadell', 2);
INSERT INTO Contact_information (street, street_number, floor, door) VALUES
('Main St', 12, 2, 'A'),
('High St', 34, 1, 'B'),
('Elm St', 56, 0, 'C'),
('Sunset Blvd', 78, 3, 'D'),
('Ocean Ave', 90, 1, 'E');
INSERT INTO Customers (name, surNames, zip_code, phone, contact_id, locality_id) VALUES
('Juan', 'Pérez', '43870', '600123123', 1, 1),
('Laura', 'García', '43201', '601234567', 3, 2);
INSERT INTO Store (zip_code, contact_id, province) VALUES
('43870', 5, 1),
('43201', 2, 1);
INSERT INTO Products (product_name, description, Image_url, price) VALUES
('Pizza', 'Delicious Margherita pizza', 'images/margherita.jpg', 8.50),
('hamburgers', 'Classic beef burger', 'images/burger.jpg', 7.20),
('drinks', 'Cola 330ml', 'images/cola.jpg', 1.50);
INSERT INTO PizzaCategory (category_name) VALUES 
('Vegetarianas'), 
('Carnívoras');
INSERT INTO Pizza (category_id, product_id) VALUES
(1, 1);
INSERT INTO Employee (first_name, last_name, tax_id_number, phone, type_work, store_id) VALUES
('Carlos', 'Sánchez', '12345678A', '602345678', 'cook', 1),
('Marta', 'López', '87654321B', '603456789', 'delivery person', 2);
INSERT INTO Orders (delivery, total_price, employee_id, customer_id, store_id) VALUES
('at home', 10.00, 1, 1, 1),
('In store', 8.50, 1, 2, 2);
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 2),
(2, 2, 1);


