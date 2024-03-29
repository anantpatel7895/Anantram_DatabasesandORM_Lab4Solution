create table if not exists `order`(
	ord_id int auto_increment,
    ord_amount int not null,
    ord_date Date not null,
    cus_id int,
    pricing_id int,
    primary key(ord_id),
    foreign key(cus_id) references customer(cus_id),
    foreign key(pricing_id) references supplier_pricing(pricing_id)
);

INSERT INTO `order`(ORD_ID,ORD_AMOUNT,ORD_DATE, CUS_ID, PRICING_ID)
values
	(101,1500,"2021-10-06",(SELECT CUS_ID FROM CUSTOMER WHERE CUS_PHONE='9785463215'),1),
    (102,1000,"2021-10-12",3,5),
    (103,30000,"2021-09-16",5,2),
	(104,1500,"2021-10-05",1,1),
    (105,3000,"2021-08-16",4,3),
    (106,3000,"2021-08-16",4,3),
    (107,789,"2021-09-01",3,7),
    (108,780,"2021-09-07",5,6),
    (109,780,"2021-09-07",5,6),
    (110,2500,"2021-09-10",2,4),
    (111,1000,"2021-09-15",4,5),
    (112,789,"2021-09-16",4,7),
    (113,31000,"2021-09-16",1,8),
	(114,1000,"2021-09-16",3,5),
	(115,3000,"2021-09-16",5,3),
	(116,99,"2021-09-17",2,14);	
    
select * from `order`;
