DELIMITER $$

USE `restuarant`$$

DROP FUNCTION IF EXISTS `FN_VALIDATE_ORDER_ID`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FN_VALIDATE_ORDER_ID`(i_order_id INT) RETURNS TINYINT(1)
BEGIN
RETURN EXISTS(SELECT * FROM `order_details` WHERE `ID`=i_order_id);
END$$

DELIMITER ;