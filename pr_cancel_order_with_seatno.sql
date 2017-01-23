DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `PR_CANCEL_BILL_V5`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_CANCEL_BILL_V5`(IN i_seat_no INT,OUT RES VARCHAR(50))
BEGIN
DECLARE l_order_id INT DEFAULT 0;
SET RES='The order for the seat is:';
IF EXISTS(SELECT * FROM `seat_configuration` WHERE `ID`=i_seat_no) THEN
SELECT `ID` INTO l_order_id FROM `order_details` WHERE `SEAT_NO`= i_seat_no AND `STATUS`='INITIATED';
IF l_order_id IS NOT NULL THEN
UPDATE `order_details` SET `STATUS`='CANCELLED' WHERE `ID`=l_order_id;
SET RES=CONCAT(RES,'Order cancelled');
ELSE
SET RES=CONCAT(RES,'Order cannot be cancelled for this seat.The order is',`FN_CHECK_ORDER_STATUS`(l_order_id));
END IF;
ELSE
SET RES=CONCAT(RES,'Invalid seat no.Seat no not found');
END IF;
END$$

DELIMITER ;