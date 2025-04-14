# 🚌 Bus Ticket Booking System (MySQL)

This project is part of the **ARTTIFAI Tech Internship - MySQL Task 5**.  
It is a backend database system for managing bus schedules, ticket bookings, and payments using **MySQL**.

---

## 📌 Project Objectives

- Manage bus information, route details, and seating capacity
- Enable customers to book tickets with automated seat tracking
- Prevent overbooking with proper seat availability management
- Record payments for bookings
- Generate reports for travel data, revenue, and customer activity

---

## 🧾 Database Structure

The system includes the following tables:

- **Buses** – Bus ID, number, type, total seats
- **Routes** – Source, destination, departure/arrival time, fare
- **Customers** – Customer contact details
- **TicketBookings** – Booking info including status and seats
- **Payments** – Payment details for each booking

---

## ⚙️ How to Run This Project

### 🖥️ MySQL Workbench (Recommended)
1. Open `BusTicketBookingSystem.sql` in MySQL Workbench
2. Select all and click the ⚡ **Execute** button
3. All tables and sample data will be created

### 🌐 phpMyAdmin (via XAMPP)
1. Install [XAMPP](https://www.apachefriends.org/index.html)
2. Start Apache and MySQL, then go to `http://localhost/phpmyadmin`
3. Create a database (e.g., `BusBookingDB`)
4. Import or paste the SQL from `BusTicketBookingSystem.sql`

---

## 📊 Sample Output (Matches the PDF)

### 🚌 Buses Table
| BusID | BusNumber   | BusType        | TotalSeats |
|-------|-------------|----------------|------------|
| 1     | MH12AB1234  | AC Sleeper     | 40         |
| 2     | KA10XY5678  | Non-AC Seater  | 50         |

### 📍 Routes Table
| RouteID | Source | Destination | DepartureTime | ArrivalTime | Fare |
|---------|--------|-------------|----------------|--------------|------|
| 101     | Mumbai | Pune        | 08:00 AM       | 11:00 AM     | 500  |
| 102     | Delhi  | Jaipur      | 09:00 AM       | 01:00 PM     | 700  |

### 👤 Customers Table
| CustomerID | Name          | PhoneNumber   | Email            |
|------------|---------------|---------------|------------------|
| 1          | Rahul Sharma  | 9876543210    | rahul@gmail.com  |
| 2          | Pooja Nair    | 9123456789    | pooja@gmail.com  |

### 🎫 Ticket Bookings Table
| BookingID | CustomerID | BusID | RouteID | SeatsBooked | TotalFare | Status     |
|-----------|------------|--------|----------|--------------|-------------|------------|
| 5001      | 1          | 1      | 101      | 2            | 1000        | Confirmed  |
| 5002      | 2          | 2      | 102      | 1            | 700         | Pending    |

### 💳 Payments Table
| PaymentID | BookingID | PaymentMethod | AmountPaid | PaymentStatus |
|-----------|-----------|----------------|------------|----------------|
| 1001      | 5001      | Credit Card    | 1000       | Completed      |
| 1002      | 5002      | UPI            | 700        | Pending        |

---

## 🔍 Sample Report Queries

```sql
-- View all available buses
SELECT * FROM Buses;

-- View customer booking history
SELECT * FROM TicketBookings;

-- View payment details
SELECT * FROM Payments;

-- Join customer & booking info
SELECT c.Name, b.SeatsBooked, b.TotalFare, b.Status
FROM Customers c
JOIN TicketBookings b ON c.CustomerID = b.CustomerID;
