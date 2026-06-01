-- Create Database
CREATE DATABASE IF NOT EXISTS SmartWashDB;
USE SmartWashDB;

-- 1. Admins Table
CREATE TABLE IF NOT EXISTS Admins (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL
);

-- Insert default admin (Use INSERT IGNORE to prevent duplicate errors if it already exists)
INSERT IGNORE INTO Admins (Username, Password) VALUES ('admin', 'admin123');

-- 2. Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    VehicleNumber VARCHAR(20) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Services Table
CREATE TABLE IF NOT EXISTS Services (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    Duration INT NOT NULL, -- Duration in minutes
    Description TEXT
);

-- Insert sample services
INSERT IGNORE INTO Services (ServiceName, Price, Duration, Description) VALUES
('Basic Exterior Wash', 15.00, 20, 'Exterior foam wash, tire cleaning, and window wiping.'),
('Premium Full Service', 35.00, 45, 'Exterior foam wash, interior vacuum, dashboard polish, and wax.'),
('Interior Detailing', 50.00, 60, 'Deep vacuuming, seat shampooing, odor removal, and console detailing.'),
('Ceramic Coating', 150.00, 120, 'Long-lasting ceramic coating for superior shine and protection.');

-- 4. Bookings Table
CREATE TABLE IF NOT EXISTS Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    ServiceID INT NOT NULL,
    BookingDate DATE NOT NULL,
    BookingTime VARCHAR(20) NOT NULL,
    VehicleType VARCHAR(50) NOT NULL,
    Status VARCHAR(20) NOT NULL DEFAULT 'Pending', -- Pending, Approved, Completed, Rejected
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
