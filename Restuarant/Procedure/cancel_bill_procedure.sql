DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `cancel_bill`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_bill`(IN seat_id INT)
BEGIN
DECLARE ord_id INT;
SELECT id INTO ord_id FROM order_status WHERE seat_no=seat_id AND STATUS='Not paid';
IF ord_id IS NOT NULL THEN
UPDATE transaction_details SET BILL_STATUS='Cancelled' WHERE order_id=ord_id;
UPDATE seat_configuration SET SEAT_STATUS=0 WHERE ID=seat_id;
UPDATE order_status SET STATUS='Cancelled' WHERE id=ord_id;
SELECT 'Order cancelled' AS comments;
ELSE
SELECT 'Select a valid seat' AS comments;
END IF;
END$$

DELIMITER ;