-- Create banking database tables

CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Accounts (
    account_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    account_type VARCHAR(30),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

-- Insert sample customers

INSERT INTO Customers VALUES
(1, 'John', 'Smith', 'john@email.com', 'Charlotte'),
(2, 'Mary', 'Johnson', 'mary@email.com', 'Concord'),
(3, 'David', 'Brown', 'david@email.com', 'Kannapolis');

-- Insert sample accounts

INSERT INTO Accounts VALUES
(101, 1, 'Checking', 2500.00),
(102, 2, 'Savings', 5000.00),
(103, 3, 'Checking', 1800.00);

-- Retrieve customer information

SELECT * FROM Customers;

-- Display customer account balances

SELECT
    Customers.first_name,
    Customers.last_name,
    Accounts.account_type,
    Accounts.balance
FROM Customers
JOIN Accounts
ON Customers.customer_id = Accounts.customer_id;

-- Find accounts with balances above $2,000

SELECT *
FROM Accounts
WHERE balance > 2000;
