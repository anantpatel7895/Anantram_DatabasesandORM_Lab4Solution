
create table if not exists rating(
	rat_id int not null auto_increment,
    ord_id int not null,
    rat_ratstars int not null,
    primary key(rat_id),
    foreign key(ord_id) references `order`(ord_id)
);



INSERT INTO rating(ORD_ID,RAT_RATSTARS)
VALUES
	(101,4),
	(102,3),
	(103,1),
	(104,2),
	(105,4),
	(106,3),
	(107,4),
	(108,4),
	(109,3),
	(110,5),
	(111,3),
	(112,4),
	(113,2),
	(114,1),
	(115,1),
	(116,0);s
    
select * from rating;

call call_rating();
