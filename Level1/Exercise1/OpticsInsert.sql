INSERT INTO contact_information (street, street_number, floor, door, city, zip_code, province_state)
VALUES 
('Main Street', 100, 2, 'A', 'New York', '10001', 'New York'),
('Second Avenue', 200, 1, 'B', 'Los Angeles', '90001', 'California');

INSERT INTO Supplier (name, phone, fax, nif, contact)
VALUES 
('VisionPro', '667896566', '123-456-789', 'A12345678', 1),
('OptiMax', '667896567', '987-654-321', 'B98765432', 2);


INSERT INTO Glasses (brand, left_lens_degree, right_lens_degree, frame_type, frame_color, left_lens_color, right_lens_color, price, supplier_id)
VALUES
('Ray-Ban', 1.50, 1.25, 'METAL', 'Black', 'Green', 'Green', 199.99, 1),
('Oakley', 0.75, 0.50, 'PLASTIC', 'Blue', 'Blue', 'Blue', 149.99, 2),
('Gucci', 2.00, 1.75, 'RIMLESS', 'Silver', 'Clear', 'Clear', 299.99, 1);

INSERT INTO Customer (name, phone, email, registration_date, recommended_by_id, contact)
VALUES
('Anna Serra', '667896578', 'anna@example.com', CURDATE(), NULL, 1),  
('Marc Riera', '667896532', 'marc@example.com', CURDATE(), 1, 2); 

INSERT INTO Employee (name)
VALUES
('Alvaro Mendoza'), 
('David Fernandez');


INSERT INTO Sale (glasses_id, customer_id, employee_id, sale_date)
VALUES
(1, 2, 1, CURDATE()),  
(2, 1, 2, CURDATE()); 


