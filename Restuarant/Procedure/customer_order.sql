DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `order_v4`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `order_v4`(IN seat_id INT,IN food_items VARCHAR(200),IN food_count_val VARCHAR(100))
BEGIN
DECLARE i INT DEFAULT 1;
DECLARE foood_id INT DEFAULT 0;
DECLARE schedul_id INT DEFAULT 0;
DECLARE ord_id INT;
DECLARE foood_name VARCHAR(20);
DECLARE foood_count INT; 
DECLARE countt INT;
DECLARE seat_set_flag INT DEFAULT 1;
DECLARE seat_flag INT DEFAULT 1;
DECLARE seat_max_count INT DEFAULT 0;
SELECT COUNT(SEAT_STATUS)INTO seat_max_count FROM seat_configuration WHERE SEAT_STATUS=1;
IF seat_max_count<=10 THEN
SELECT SEAT_STATUS INTO seat_flag FROM seat_configuration WHERE ID=seat_id;
IF seat_flag=0 THEN
INSERT INTO order_status SET seat_no=seat_id;
SELECT id INTO ord_id FROM order_status WHERE seat_no=seat_id AND STATUS='Not paid';
CALL split_input(food_items,food_count_val,@count);
SET countt=@count;
IF countt<=5 THEN
WHILE i<=countt DO
SELECT FOOD_NAME INTO foood_name FROM dum_food WHERE ID=i;
SELECT QUANTITY INTO foood_count FROM dum_food WHERE ID=i; 
SELECT FIND_FOOD(foood_name) INTO foood_id;
IF foood_id!=0 THEN
SELECT FIND_SCHEDULE(foood_id) INTO schedul_id;
IF schedul_id!=0 THEN
CALL take_order_v1(ord_id,schedul_id,foood_id,foood_count,i,seat_id);
ELSE
UPDATE dum_food SET COMMENTS='Item not available at this tym' WHERE ID=i;
END IF;
ELSE
UPDATE dum_food SET COMMENTS='Item not available in the restaurant' WHERE ID=i;
END IF;  
SET i=i+1;
END WHILE;
SELECT COUNT(COMMENTS) INTO seat_set_flag FROM dum_food WHERE COMMENTS='Success';
IF seat_set_flag=0 THEN
UPDATE seat_configuration SET SEAT_STATUS=0 WHERE ID=seat_id;
UPDATE order_status SET STATUS='Improper order' WHERE id=ord_id;
END IF;
ELSE
SELECT 'Order can have only maximum of 5 items' AS comments;
END IF;
ELSE 
SELECT 'Particular seat not available' AS comments;
END IF;
ELSE
SELECT 'All seats filles' AS comments;
END IF;
SELECT * FROM dum_food;
TRUNCATE TABLE `dum_food`;
END$$

DELIMITER ;