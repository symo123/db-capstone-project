use littlelemondb;

INSERT INTO staff (staff_id, firstName, lastName, role, salary) VALUES
    (1,'Mario', 'Gollini','Manager',70000),
    (2,'Adrian', 'Gollini','Assistant Manager', 65000),
    (3,'Giorgos', 'Dioudis','Head Chef', 50000),
    (4,'Fatma', 'Kaya','Assistant Chef',45000),
    (5,'Elena', 'Salvai','Head Waiter', 40000),
    (6,'John', 'Millar','Receptionist', 35000)
;
INSERT INTO orders (order_id, date, quantity, cost) VALUES
	(1, '2023-12-05', 3, 55),
    (2, '2023-12-05', 9, 1000),
    (3, '2023-12-05', 7, 500),
    (4, '2023-12-05', 5, 200)
;
INSERT INTO bookings (booking_id, date, bookings.table, customer_id) VALUES
	(1, '2023-12-01', 1, 2),
    (2, '2023-12-02', 1, 3),
    (3, '2023-12-03', 1, 4),
    (4, '2023-12-04', 1, 5)
;
INSERT INTO customers (customer_id, firstName, lastName, phone, email, street, city, state, zip) VALUES
	(1, 'John', 'Smith', 8675309, 'john@example.com', '123 whereever st', 'Cairo', 'IL', 8000),
    (2, 'Jane', 'Smith', 8675309, 'john@example.com', '123 whereever st', 'Cairo', 'IL', 8000),
    (3, 'Henry', 'Smith', 8675309, 'john@example.com', '123 whereever st', 'Cairo', 'IL', 8000),
    (4, 'Brad', 'Smith', 8675309, 'john@example.com', '123 whereever st', 'Cairo', 'IL', 8000)
;

INSERT INTO menu (menu_id, cuisine, name, description, price, starter, drink, dessert, course) VALUES
	(1, 'Greek', 'goulash', 'description here of the dish', 10, 0, 0, 0, 1),
    (2, 'Italian', 'pizza', 'description here of the dish', 25, 0, 0, 0, 2),
    (3, 'American', 'Burger', 'description here of the dish', 20, 0, 0, 0, 2),
    (4, 'Spanish', 'tapas', 'description here of the dish', 15, 1, 0, 0, NULL)
;

INSERT INTO delivery (delivery_id, status, delivery_date) VALUES
	(1, 'complete', '2023-01-05'),
    (2, 'in_progress', '2024-01-05'),
    (3, 'failed', '2023-12-05'),
    (4, 'not_started', '2024-04-06')
;


