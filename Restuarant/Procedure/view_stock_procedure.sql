DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `view_stock`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `view_stock`()
BEGIN
SELECT
seed_schedule.`SCHEDULE_ID` AS SCHEDULE_NAME,
  food_item.`FOOD_NAME`,
  schedule_food_map.`FOOD_COUNT` -
   IFNULL((SELECT
      SUM(FOOD_COUNT)
       FROM transaction_details WHERE DATE_OF_ORDER = CURDATE()
      AND SCHEDULE_ID = schedule_food_map.`SCHEDULE_ID`
      AND FOOD_ID = schedule_food_map.`FOOD_ID` AND BILL_STATUS='Paid'),0)
     AS STOCK_LEFT
  FROM
    schedule_food_map inner join (food_item inner join seed_schedule)
    where food_item.`ID`=schedule_food_map.`FOOD_ID` and
    seed_schedule.`ID`=schedule_food_map.`SCHEDULE_ID`;
    end$$

DELIMITER ;