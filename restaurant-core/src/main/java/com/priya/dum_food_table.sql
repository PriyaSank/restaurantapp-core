/*Table structure for dum_food*/ 

CREATE TABLE `dum_food` (                                                                                                                                                                                                                                                   
            `ID` int(11) NOT NULL AUTO_INCREMENT,                                                                                                                                                                                                                                     
            `FOOD_NAME` varchar(30) NOT NULL,                                                                                                                                                                                                                                         
            `QUANTITY` int(11) NOT NULL,                                                                                                                                                                                                                                              
            `COMMENTS` varchar(100) DEFAULT NULL,                                                                                                                                                                                                                                     
            `COST` varchar(50) DEFAULT '0',                                                                                                                                                                                                                                           
            PRIMARY KEY (`ID`)                                                                                                                                                                                                                                                        
          )