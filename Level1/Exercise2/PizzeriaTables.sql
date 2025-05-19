DROP DATABASE IF EXISTS Pizzeria;
CREATE DATABASE Pizzeria;
USE Pizzeria;

CREATE TABLE Provinces (
    province_id INT AUTO_INCREMENT PRIMARY KEY,
    province_name VARCHAR(45) NOT NULL
);
CREATE TABLE Localities (
    locality_id INT AUTO_INCREMENT PRIMARY KEY,
    locality_name VARCHAR(45) NOT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES Provinces(province_id)
);
CREATE TABLE Contact_information (
	contact_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(45) NOT NULL,
    street_number INT NOT NULL,
    floor INT NOT NULL,
	door VARCHAR(10) NOT NULL
);
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surNames VARCHAR(50) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    phone VARCHAR(15) NOT NULL,
	
    contact_id INT NOT NULL,
   	FOREIGN KEY (contact_id) REFERENCES Contact_information(contact_id),
	locality_id INT NOT NULL,
    FOREIGN KEY (locality_id) REFERENCES Localities(locality_id)
);
CREATE TABLE Store (
	store_id INT AUTO_INCREMENT PRIMARY KEY,
	zip_code VARCHAR(10) NOT NULL,
  
    contact_id INT UNIQUE NOT NULL, 
    FOREIGN KEY (contact_id) REFERENCES Contact_information(contact_id),
    
	province INT NOT NULL,
	FOREIGN KEY (province) REFERENCES Provinces(province_id)
);
CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
	tax_id_number VARCHAR(9) NOT NULL,
	phone VARCHAR(15) NOT NULL,
    type_work ENUM('cook', 'delivery person') NOT NULL,
    
	store_id INT NOT NULL,
	FOREIGN KEY (store_id) REFERENCES Store(store_id)
);
CREATE TABLE Orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
	sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	delivery ENUM('at home', 'In store') NOT NULL,
	total_price DECIMAL(8,2) NOT NULL,
    
    employee_id INT,  
	FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
   
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    
    store_id INT NOT NULL,
	FOREIGN KEY (store_id) REFERENCES Store(store_id)
	
);
CREATE TABLE Products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name ENUM('Pizza', 'hamburgers', 'drinks') NOT NULL,
	description TEXT,
	Image_url VARCHAR(255),
    price DECIMAL(8,2) NOT NULL    
);
CREATE TABLE Order_Items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1 NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE PizzaCategory (
	category_id INT AUTO_INCREMENT PRIMARY KEY,
	category_name VARCHAR(100) NOT NULL
    );
CREATE TABLE Pizza (
    pizza_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
	FOREIGN KEY (category_id) REFERENCES PizzaCategory(category_id),
	product_id INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);















