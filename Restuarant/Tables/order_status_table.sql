/*Table structure for order_status*/

CREATE TABLE `order_status` (                                                                                                                                                                                                     
                `id` int(11) NOT NULL AUTO_INCREMENT,                                                                                                                                                                                           
                `seat_no` int(11) DEFAULT NULL,                                                                                                                                                                                                 
                `status` varchar(100) DEFAULT 'Not paid',                                                                                                                                                                                       
                PRIMARY KEY (`id`)                                                                                                                                                                                                              
              )