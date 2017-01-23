DELIMITER $$

USE `restuarant`$$

DROP FUNCTION IF EXISTS `FN_GET_FOOD_ID`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_FOOD_ID`(i_food_name VARCHAR(30)) RETURNS INT(11)
BEGIN
RETURN (SELECT ID FROM food_item WHERE NAME=i_food_name);
END$$

DELIMITER ;