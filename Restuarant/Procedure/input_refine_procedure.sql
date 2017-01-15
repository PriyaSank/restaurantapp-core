DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `split_input`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `split_input`(IN _list1 MEDIUMTEXT,IN _list2 MEDIUMTEXT,OUT dum_count INT)
BEGIN
          DECLARE _next1 TEXT DEFAULT NULL ;
          DECLARE _nextlen1 INT DEFAULT NULL;
          DECLARE _value1 TEXT DEFAULT NULL;
          DECLARE _next2 TEXT DEFAULT NULL ;
          DECLARE _nextlen2 INT DEFAULT NULL;
          DECLARE _value2 TEXT DEFAULT NULL;
         iterator :
         LOOP    
            IF LENGTH(TRIM(_list1)) = 0 OR _list1 IS NULL OR LENGTH(TRIM(_list2)) = 0 OR _list2 IS NULL THEN
              LEAVE iterator;
              END IF;
  
   
                 SET _next1 = SUBSTRING_INDEX(_list1,',',1);
                 SET _nextlen1 = LENGTH(_next1);
                 SET _value1 = TRIM(_next1);
                 
                 SET _next2 = SUBSTRING_INDEX(_list2,',',1);
                 SET _nextlen2 = LENGTH(_next2);
                 SET _value2 = TRIM(_next2);
                 
                 INSERT INTO dum_food(FOOD_NAME,QUANTITY) VALUES(_next1,_next2);
                 
                   SET _list1 = INSERT(_list1,1,_nextlen1 + 1,'');
                   SET _list2 = INSERT(_list2,1,_nextlen2 + 1,'');
                   
                 SELECT COUNT(*) INTO dum_count FROM dum_food;
                
         END LOOP;       
    END$$

DELIMITER ;