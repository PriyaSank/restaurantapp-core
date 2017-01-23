DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `PR_GET_CUSTOMER_ORDER_V4`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_GET_CUSTOMER_ORDER_V4`(IN i_seat_no INT,IN i_menu_items VARCHAR(200),IN i_menu_count VARCHAR(50),OUT message VARCHAR(500))
BEGIN
DECLARE l_order_id INT;
DECLARE l_order_status VARCHAR(20);
IF (FN_CHECK_ALL_SEAT_FILLED()) THEN
IF (FN_IS_SEAT_AVAILABLE(i_seat_no)) THEN
UPDATE seat_configuration SET `STATUS`=1 WHERE ID=i_seat_no;
INSERT INTO order_details(SEAT_NO) VALUES(i_seat_no);
SELECT ID INTO l_order_id FROM order_details WHERE `SEAT_NO`=i_seat_no AND `STATUS`='INITIATED';
SELECT `STATUS` INTO l_order_status FROM `order_details` WHERE `ID`=l_order_id;
IF (l_order_status='INITIATED') THEN
UPDATE order_details SET STATUS='SERVED' WHERE ID=l_order_id;
CALL PR_SPLIT_INPUT_V2(i_menu_items,i_menu_count,l_order_id,i_seat_no,@msg);
SET message=@msg;
UPDATE seat_configuration SET STATUS=0 WHERE ID=i_seat_no;
ELSE
SET message='The order is cancelled.';
END IF;
IF ((SELECT COUNT(*) FROM `order_food_details` WHERE `ORDER_ID`=l_order_id)=0) THEN
UPDATE order_details SET STATUS='INVALID' WHERE ID=l_order_id;
END IF;
ELSE
SET message='Particular seat not available';
END IF;
ELSE
SET message='All seats filled';
END IF;
END$$

DELIMITER ;