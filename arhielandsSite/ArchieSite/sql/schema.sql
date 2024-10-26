-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS ARCHDB;

-- Use the archdb database
USE ARCHDB;

-- Create roles table
CREATE TABLE ROLES (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ROLE_NAME VARCHAR(50) NOT NULL
);

-- Insert default roles
INSERT INTO ROLES (
    ROLE_NAME
) VALUES (
    'Admin'
);

INSERT INTO ROLES (
    ROLE_NAME
) VALUES (
    'Customer'
);

-- Create users table with role_id as a foreign key
CREATE TABLE USERS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    USERNAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    PASSWORD VARCHAR(255) NOT NULL,
    ROLE_ID INT,
    FOREIGN KEY (ROLE_ID) REFERENCES ROLES(ID)
);

-- Create products table
CREATE TABLE PRODUCTS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    PRICE DECIMAL(10, 2) NOT NULL,
    DESCRIPTION TEXT,
    IMAGE_PATH VARCHAR(255) DEFAULT NULL -- Image path for the product
);

-- Create orders table
CREATE TABLE ORDERS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    USER_ID INT,
    ORDER_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (USER_ID) REFERENCES USERS(ID)
);

-- Create order_items table
CREATE TABLE ORDER_ITEMS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_ID INT,
    PRODUCT_ID INT,
    QUANTITY INT NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(ID)
);

-- Create permissions table
CREATE TABLE PERMISSIONS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PERMISSION_NAME VARCHAR(50) NOT NULL
);

-- Insert default permissions
INSERT INTO PERMISSIONS (
    PERMISSION_NAME
) VALUES (
    'View Products'
);

INSERT INTO PERMISSIONS (
    PERMISSION_NAME
) VALUES (
    'Manage Orders'
);

-- Create role_permissions table
CREATE TABLE ROLE_PERMISSIONS (
    ROLE_ID INT,
    PERMISSION_ID INT,
    FOREIGN KEY (ROLE_ID) REFERENCES ROLES(ID),
    FOREIGN KEY (PERMISSION_ID) REFERENCES PERMISSIONS(ID)
);

-- Add initial permissions to roles
INSERT INTO ROLE_PERMISSIONS (
    ROLE_ID,
    PERMISSION_ID
) VALUES (
    1,
    1
);

-- Admin role can view products
INSERT INTO ROLE_PERMISSIONS (
    ROLE_ID,
    PERMISSION_ID
) VALUES (
    1,
    2
);

-- Admin role can manage orders