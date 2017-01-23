DELIMITER $$

USE `restuarant`$$

DROP VIEW IF EXISTS `menu_list`$$

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `menu_list` AS 
SELECT
  `food_item`.`NAME`  AS `FOOD_NAME`,
  `food_item`.`PRICE` AS `PRICE`
FROM `food_item`
WHERE `food_item`.`ID` IN(SELECT
                            `schedule_food_relation`.`FOOD_ID`
                          FROM `schedule_food_relation`
                          WHERE `schedule_food_relation`.`SCHEDULE_ID` IN(SELECT
                                                                            `seed_schedule`.`ID`
                                                                          FROM `seed_schedule`
                                                                          WHERE ((CURTIME() >= `seed_schedule`.`FROM_TIME`)
                                                                                 AND (CURTIME() <= `seed_schedule`.`TO_TIME`))))$$

DELIMITER ;