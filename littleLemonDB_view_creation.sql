USE littlelemondb;

CREATE VIEW OrderView AS
SELECT
	order_id,
    quantity,
    cost
FROM orders
WHERE
	'quantity' > 2
;

SELECT * FROM OrderView;

SELECT
	orders.customer_id,
    concat(firstName, ' ', lastName) as fullName,
    order_id,
    cost,
    menu.name as menuName,
    course,
    starter
FROM orders
JOIN customers on customers.customer_id = orders.customer_id
JOIN menu on menu.menu_id = orders.menu_id
;


SELECT
	name
FROM menu
WHERE menu_id = ANY(SELECT menu_id FROM orders WHERE quantity > 2)
;

