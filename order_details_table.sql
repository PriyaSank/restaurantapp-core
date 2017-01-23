/*Table structure for order_details*/

CREATE TABLE `order_details` (                                                                                                                                                                                                      
                 `ID` int(11) NOT NULL AUTO_INCREMENT,                                                                                                                                                                                             
                 `SEAT_NO` int(11) DEFAULT NULL,                                                                                                                                                                                                   
                 `STATUS` varchar(30) DEFAULT 'INITIATED',                                                                                                                                                                                         
                 PRIMARY KEY (`ID`)                                                                                                                                                                                                                
               )

