DELIMITER $$

USE `restuarant`$$

DROP PROCEDURE IF EXISTS `PR_SPLIT_INPUT_V2`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PR_SPLIT_INPUT_V2`(IN _list1 MEDIUMTEXT,IN _list2 MEDIUMTEXT,IN i_order_id INT,IN i_seat_no INT,OUT message VARCHAR(500))
BEGIN
          DECLARE _next1 TEXT DEFAULT NULL ;
          DECLARE _nextlen1 INT DEFAULT NULL;
          DECLARE _value1 TEXT DEFAULT NULL;
          DECLARE _next2 TEXT DEFAULT NULL ;
          DECLARE _nextlen2 INT DEFAULT NULL;
          DECLARE _value2 TEXT DEFAULT NULL;
          SET message='Your order:';
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
                 
                  IF (SELECT COUNT(*) FROM order_food_details WHERE ORDER_ID=i_order_id)<5 THEN
                   CALL PR_TAKE_ORDER_V2(_next1,_next2,i_order_id,i_seat_no,@msg);
                   SET message=CONCAT(message,@msg);
                   ELSE
                   SET message=CONCAT(message,' An order can have only 5 items.Make another order for ',_next1 );
                   END IF;
                 
                   SET _list1 = INSERT(_list1,1,_nextlen1 + 1,'');
                   SET _list2 = INSERT(_list2,1,_nextlen2 + 1,'');
                   
                   
                
                
         END LOOP;       
    END$$

DELIMITER ;