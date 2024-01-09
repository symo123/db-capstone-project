USE littlelemondb;

DELIMITER //
CREATE PROCEDURE AddBooking(booking INT, customer INT, d DATE, t INT)
BEGIN
	DECLARE booked int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
    START TRANSACTION;
    INSERT INTO bookings (booking_id, customer_id, date, bookings.table) VALUES (booking, customer, d, t);
    SET booked = (SELECT COUNT(booking_id) FROM bookings WHERE date = d and bookings.table = t);
    IF (booked = 1) THEN
		SELECT CONCAT("Table ", t, " is free, booking confirmed");
		COMMIT;
	else
		SELECT CONCAT("Table ", t, " is already booked, canceling booking")
		ROLLBACK;
	END IF;
		
END //
DELIMITER ;

CALL AddBooking(9, 7, "2022-12-16", 5);

DELIMITER //
create procedure UpdateBooking(booking INT, d DATE)
BEGIN
	DECLARE booked int;
    DECALRE old_table int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
    START TRANSACTION;
    UPDATE bookings SET old_table = (SELECT bookings.table FROM bookings WHERE bookings.date = d AND booking_id = booking);
    SET bookings.date = d WHERE booking_id = booking; 
    SET booked = (SELECT COUNT(booking_id) FROM bookings WHERE date = d and bookings.table = old_table);
    IF (booked = 1) THEN
		SELECT CONCAT("Table ", t, " is free, booking confirmed") AS "Confrimation";
		COMMIT;
	else
		SELECT CONCAT("Table ", t, " is already booked, canceling booking") AS "Confirmation";
		ROLLBACK;
	END IF;
END
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17")

DELIMITER //
CREATE PROCEDURE CancelBooking(booking INT)
BEGIN
	DECLARE booked int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
    START TRANSACTION;
    DELETE FROM bookings WHERE booking_id = booking;
    SET booked = (SELECT COUNT(booking_id) FROM bookings WHERE booking_id = booking);
    IF (booked > 0) THEN
		SELECT "Booking not removed";
		ROLLBACK;
	else
		SELECT "Booking Canceled";
		COMMIT;
	END IF;
		
END //
DELIMITER ;

CALL CancelBooking(9)