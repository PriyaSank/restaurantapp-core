DELIMITER $$

USE `restuarant`$$

DROP FUNCTION IF EXISTS `FN_GET_SCHEDULE_ID`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_SCHEDULE_ID`(i_food_id INT) RETURNS INT(11)
BEGIN
RETURN IFNULL(
(SELECT DISTINCT(`SCHEDULE_ID`)
FROM schedule_food_relation
WHERE `FOOD_ID`=i_food_id
AND `SCHEDULE_ID` IN(
SELECT seed_schedule.`ID` FROM seed_schedule WHERE
CURTIME()>=seed_schedule.`FROM_TIME` 
AND CURTIME()<=seed_schedule.`TO_TIME`)),0);
END$$

DELIMITER ;