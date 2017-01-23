DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `PR_TAKE_ORDER_V2`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_TAKE_ORDER_V2`(IN i_food_name VARCHAR(20),IN i_food_count INT,IN i_order_id INT,IN i_seat_no INT,OUT message VARCHAR(100))
BEGIN
DECLARE l_food_id INT;
DECLARE l_food_price INT;
DECLARE l_schedule_id INT;
DECLARE l_food_cost INT;
IF (SELECT FN_VALIDATE_FOOD_ITEM(i_food_name)) THEN
SET l_food_id=(SELECT FN_GET_FOOD_ID(i_food_name));
SET l_schedule_id=(SELECT FN_GET_SCHEDULE_ID(l_food_id));
IF l_schedule_id!=0 THEN
IF (SELECT FN_CHECK_FOOD_AVAILABLE(l_food_id,l_schedule_id,i_food_count)) THEN
SELECT PRICE INTO l_food_price FROM food_item WHERE ID=l_food_id;
INSERT INTO order_food_details(`ORDER_ID`,`FOOD_ID`,`FOOD_COUNT`)VALUES(i_order_id,l_food_id,i_food_count);

SET message=CONCAT(i_food_name,' Item is Orderded Successfully.The price of the item is ',l_food_price*i_food_count);
ELSE
SET message=CONCAT(i_food_name,' not available due to less stock.Sorry  ');
END IF;
ELSE
SET message=CONCAT(i_food_name,' is food is not avilable now  ');
END IF;
ELSE
SET message=CONCAT(i_food_name,' is not available.Select a valid food available  ');
END IF;
END$$

DELIMITER ;