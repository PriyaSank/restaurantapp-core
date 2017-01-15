DELIMITER $$

USE `restuarant`$$

DROP FUNCTION IF EXISTS `FIND_SCHEDULE`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FIND_SCHEDULE`(food_id INT) RETURNS INT(11)
BEGIN
DECLARE temp_id INT DEFAULT 0;
SELECT DISTINCT(schedule_food_map.`SCHEDULE_ID`) INTO temp_id
FROM schedule_food_map INNER JOIN seed_schedule
WHERE schedule_food_map.`FOOD_ID`=food_id
AND schedule_food_map.`SCHEDULE_ID` IN(
SELECT seed_schedule.`ID` FROM seed_schedule WHERE
CURTIME()>=seed_schedule.`FROM_TIME` 
AND CURTIME()<=seed_schedule.`TO_TIME`);
IF temp_id IS NULL THEN
SET temp_id=0;
END IF;
RETURN temp_id;
END$$

DELIMITER ;