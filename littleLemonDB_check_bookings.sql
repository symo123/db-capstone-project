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

