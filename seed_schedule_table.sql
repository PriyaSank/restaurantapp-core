/* Table structure for seed_schedule*/

CREATE TABLE `seed_schedule` (                                                                                                                                                                                             
                 `ID` int(11) NOT NULL,                                                                                                                                                                                                   
                 `SCHEDULE_ID` varchar(30) NOT NULL,                                                                                                                                                                                      
                 `FROM_TIME` time DEFAULT NOT NULL,                                                                                                                                                                                           
                 `TO_TIME` time DEFAULT NOT NULL,                                                                                                                                                                                             
                 PRIMARY KEY (`ID`)                                                                                                                                                                                                       
               ) 
                                                                                                                                                                                  
/*Values for seed_schedule*/

INSERT INTO seed_schedule VALUES(1,'Breakfast','08:00:00','11:00:00'),
				(2,'Lunch','11:15:00','03:00:00'),
				(3,'Refreshment','03:15:00','23:00:00'),
				(4,'Dinner','19:00:00','23:00:00')
