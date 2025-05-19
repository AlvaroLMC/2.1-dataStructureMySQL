DROP DATABASE IF EXISTS BottleBottomOptics;
CREATE DATABASE BottleBottomOptics;
USE BottleBottomOptics;

CREATE TABLE contact_information (
	idcontact INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(45),
    street_number INT,
    floor INT,
	door VARCHAR(10),
    city VARCHAR(45),
    zip_code VARCHAR(10),
    province_state VARCHAR(45)
);

CREATE TABLE Supplier (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(45),
    fax VARCHAR(20),
    nif VARCHAR(20),
	contact INT,
    FOREIGN KEY (contact) REFERENCES contact_information(idcontact)
);

CREATE TABLE Glasses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    left_lens_degree DECIMAL(4,2),
    right_lens_degree DECIMAL(4,2),
    frame_type ENUM('RIMLESS', 'PLASTIC', 'METAL') NOT NULL,
    frame_color VARCHAR(30),
    left_lens_color VARCHAR(30),
    right_lens_color VARCHAR(30),
    price DECIMAL(8,2),
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Supplier(id)
);

CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(45),
    email VARCHAR(100),
    registration_date DATE,
    recommended_by_id INT,
    contact INT,
    INDEX (contact),
    FOREIGN KEY (recommended_by_id) REFERENCES Customer(id),
	FOREIGN KEY (contact) REFERENCES contact_information(idcontact)
);

CREATE TABLE Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Sale (
	id INT AUTO_INCREMENT PRIMARY KEY,
    glasses_id INT,
    customer_id INT,
    employee_id INT,
    sale_date DATE,
    FOREIGN KEY (glasses_id) REFERENCES Glasses(id),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

ALTER TABLE Sale ADD CONSTRAINT unique_sale UNIQUE (glasses_id, customer_id, employee_id, sale_date);

