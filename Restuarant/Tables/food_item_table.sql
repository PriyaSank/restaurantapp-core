/*Table structure for food_item*/

CREATE TABLE `food_item` (                                                                                                                                                       
             `ID` int(11) NOT NULL,                                                                                                                                                         
             `FOOD_NAME` varchar(30) NOT NULL,                                                                                                                                              
             `PRICE` int(11) NOT NULL,                                                                                                                                                      
             PRIMARY KEY (`ID`)                                                                                                                                                             
           )  

/*Table values for food_item*/

INSERT INTO food_item VALUES(1,'Idly',40),(2,'Vada',20),(3,'Puri',40),(4,'Dosa',60),
			    (5,'Pongal',40),(6,'Coffee',25),(7,'Tea',20),
			    (8,'SOuth Indian Meals',100),(9,'North Indian Thali',100),
			    (10,'Vareity rice',80),(11,'Snacks',50),(12,'Fried rice',60),
			    (13,'Chappathi',50),(14,'Chat',40)

