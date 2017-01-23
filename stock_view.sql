DELIMITER $$

USE `restuarant`$$

DROP VIEW IF EXISTS `view_stock1`$$

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_stock1` AS 
SELECT
  `seed_schedule`.`NAME` AS `SCHEDULE_NAME`,
  `food_item`.`NAME`     AS `FOOD_NAME`,
  (`schedule_food_relation`.`FOOD_COUNT` - IFNULL((SELECT SUM(`order_food_details`.`FOOD_COUNT`) FROM `order_food_details` WHERE ((CAST(`order_food_details`.`ORDER_TIMESTAMP` AS DATE) = CURDATE()) AND (`order_food_details`.`FOOD_ID` = `schedule_food_relation`.`FOOD_ID`) AND (CAST(`order_food_details`.`ORDER_TIMESTAMP` AS TIME) BETWEEN `seed_schedule`.`FROM_TIME` AND `seed_schedule`.`TO_TIME`) AND (`order_food_details`.`ORDER_STATUS` = 'ORDER SUCCESS'))),0)) AS `STOCK_USED`
FROM ((`schedule_food_relation`
    LEFT JOIN `seed_schedule`
      ON ((`seed_schedule`.`ID` = `schedule_food_relation`.`SCHEDULE_ID`)))
   LEFT JOIN `food_item`
     ON ((`food_item`.`ID` = `schedule_food_relation`.`FOOD_ID`)))$$

DELIMITER ;