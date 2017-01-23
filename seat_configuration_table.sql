/*Table structure for seat_configuration*/

CREATE TABLE `seat_configuration` (                                                                                                                               
                      `ID` int(11) NOT NULL,                                                                                                                                          
                      `SEAT_STATUS` tinyint(1) DEFAULT '0',                                                                                                                           
                      PRIMARY KEY (`ID`)                                                                                                                                              
                    ) 

/*Table values for seat_configuration*/

INSERT INTO seat_configuration VALUES(1,0),(2,0),(3,0),(4,0),(5,0),
				     (6,0),(7,0),(8,0),(9,0),(10,0)