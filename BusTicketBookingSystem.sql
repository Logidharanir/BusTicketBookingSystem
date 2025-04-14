
-- Bus Ticket Booking System SQL Script

-- Bus Table
CREATE TABLE Buses (
    BusID INT PRIMARY KEY,
    BusNumber VARCHAR(20),
    BusType VARCHAR(50),
    TotalSeats INT
);

-- Routes Table
CREATE TABLE Routes (
    RouteID INT PRIMARY KEY,
    Source VARCHAR(100),
    Destination VARCHAR(100),
    DepartureTime VARCHAR(20),
    ArrivalTime VARCHAR(20),
    Fare DECIMAL(10, 2)
);

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- TicketBookings Table
CREATE TABLE TicketBookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    BusID INT,
    RouteID INT,
    SeatsBooked INT,
    TotalFare DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BusID) REFERENCES Buses(BusID),
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentMethod VARCHAR(50),
    AmountPaid DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (BookingID) REFERENCES TicketBookings(BookingID)
);

-- Sample Bus Data
INSERT INTO Buses (BusID, BusNumber, BusType, TotalSeats) VALUES
(1, 'MH12AB1234', 'AC Sleeper', 40),
(2, 'KA10XY5678', 'Non-AC Seater', 50);

-- Sample Route Data
INSERT INTO Routes (RouteID, Source, Destination, DepartureTime, ArrivalTime, Fare) VALUES
(101, 'Mumbai', 'Pune', '08:00 AM', '11:00 AM', 500),
(102, 'Delhi', 'Jaipur', '09:00 AM', '01:00 PM', 700);

-- Sample Customer Data
INSERT INTO Customers (Name, PhoneNumber, Email) VALUES
('Rahul Sharma', '9876543210', 'rahul@gmail.com'),
('Pooja Nair', '9123456789', 'pooja@gmail.com');

-- Sample Ticket Bookings
INSERT INTO TicketBookings (CustomerID, BusID, RouteID, SeatsBooked, TotalFare, Status) VALUES
(1, 1, 101, 2, 1000, 'Confirmed'),
(2, 2, 102, 1, 700, 'Pending');

-- Sample Payments
INSERT INTO Payments (BookingID, PaymentMethod, AmountPaid, PaymentStatus) VALUES
(5001, 'Credit Card', 1000, 'Completed'),
(5002, 'UPI', 700, 'Pending');

-- Optional Reports (run separately)
-- SELECT * FROM Buses;
-- SELECT * FROM Routes;
-- SELECT * FROM Customers;
-- SELECT * FROM TicketBookings;
-- SELECT * FROM Payments;
