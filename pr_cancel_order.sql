DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `PR_CANCEL_BILL_V4`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_CANCEL_BILL_V4`(IN i_order_id INT,OUT RES VARCHAR(50))
BEGIN
IF FN_VALIDATE_ORDER_ID(i_order_id) THEN
IF FN_CHECK_ORDER_STATUS(i_order_id)='INITIATED' THEN

UPDATE `order_details` SET `STATUS`='CANCELLED' WHERE `ID`=i_order_id;
SET RES='Order cancelled';

ELSE
SET RES=CONCAT('The order is',FN_CHECK_ORDER_STATUS(i_order_id),'.The order cant be cancelled');
END IF;
ELSE
SET RES='Invalid order id.Order id not found';
END IF;
END$$

DELIMITER ;