USE littlelemondb;

DELIMITER //
CREATE procedure GetMaxQuantity()
BEGIN
	SELECT MAX(quantity) AS "Max Quantity in Order"
    FROM orders;
END //
DELIMITER ;

CALL GetMaxQuantity();

PREPARE GetOrderDetail FROM "SELECT order_id, quantity, cost FROM orders WHERE customer_id = ?";

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

DELIMITER //
CREATE procedure CancelOrder(x INT)
BEGIN
	DELETE from orders WHERE order_id = @x;
    
END //
DELIMITER ;

CALL CancelOrder(5)

