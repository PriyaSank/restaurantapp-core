DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `take_order_v1`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `take_order_v1`(IN ord_id INT,IN schedul_id INT,IN foood_id INT,IN foood_count INT,IN i1 INT,IN seat_id INT)
BEGIN
DECLARE diff1 INT DEFAULT 0;
DECLARE diff2 INT DEFAULT 0;
DECLARE count_diff INT DEFAULT 0;
DECLARE food_price INT;
SELECT FOOD_COUNT INTO diff1 FROM schedule_food_map WHERE FOOD_ID=foood_id AND SCHEDULE_ID=schedul_id;
SELECT SUM(FOOD_COUNT) INTO diff2 FROM transaction_details WHERE DATE_OF_ORDER=CURDATE() AND SCHEDULE_ID=schedul_id AND FOOD_ID=foood_id AND BILL_STATUS='Paid';
IF diff2 IS NULL THEN 
SET diff2=0;
END IF;
SET count_diff=diff1-diff2;
IF count_diff-foood_count>=0 THEN
SELECT PRICE INTO food_price FROM food_item WHERE ID=foood_id;
INSERT INTO `transaction_details`(ORDER_ID,DATE_OF_ORDER,TIME_OF_ORDER,SCHEDULE_ID,FOOD_ID,FOOD_COUNT,COST) VALUES(ord_id,CURDATE(),CURTIME(),schedul_id,foood_id,foood_count,foood_count*food_price);
UPDATE dum_food SET COMMENTS='Success' WHERE ID=i1;
UPDATE dum_food SET COST=food_price*foood_count WHERE ID=i1;
UPDATE seat_configuration SET SEAT_STATUS=1 WHERE ID=seat_id;
ELSE
UPDATE dum_food SET COMMENTS='Quantity insufficient' WHERE ID=i1;
END IF;
END$$

DELIMITER ;