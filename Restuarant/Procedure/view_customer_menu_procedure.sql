DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `view_items`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_items`()
BEGIN
IF NOT EXISTS(SELECT
      seed_schedule.`ID`
    FROM
      seed_schedule
    WHERE CURTIME() >= seed_schedule.`FROM_TIME`
      AND CURTIME() <= seed_schedule.`TO_TIME`) THEN
      SELECT 'No items available at thi time.Sorry' AS comments;
ELSE
SELECT
  food_item.`FOOD_NAME`,
  food_item.`PRICE`
FROM
  food_item
WHERE ID IN
  (SELECT
    FOOD_ID
  FROM
    schedule_food_map
  WHERE SCHEDULE_ID IN
    (SELECT
      seed_schedule.`ID`
    FROM
      seed_schedule
    WHERE CURTIME() >= seed_schedule.`FROM_TIME`
      AND CURTIME() <= seed_schedule.`TO_TIME`));
      
END IF;      
  END$$

DELIMITER ;