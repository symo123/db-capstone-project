USE littlelemondb;

INSERT INTO bookings (booking_id, date, bookings.table, customer_id) VALUES
	(1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1)
;

SELECT * from bookings;

DROP PROCEDURE CheckBooking;

DELIMITER //
CREATE PROCEDURE CheckBooking(d DATE, t INT)
BEGIN
	SELECT
		CASE
			WHEN booking_id > 0 THEN CONCAT("Table ", t, " is already booked")
            ELSE CONCAT("Table ", t, " is free")
        END AS "Booking Status"
    FROM
		(SELECT booking_id FROM bookings WHERE bookings.date = DATE(d) AND bookings.table = t) a;
    
END //
DELIMITER ;

call CheckBooking("2022-11-12", 3);

DROP procedure AddValidBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking(d DATE, t INT)
BEGIN
	DECLARE booked int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
    START TRANSACTION;
    INSERT INTO bookings (date, bookings.table) VALUES (d, t);
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

call AddValidBooking("2022-12-17", 6);


