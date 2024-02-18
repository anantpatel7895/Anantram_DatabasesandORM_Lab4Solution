
create table if not exists Supplier (
	supp_id int primary key auto_increment,
    supp_name varchar(50) not null,
    supp_city varchar(50),
    supp_phone varchar(50) not null
);

insert into supplier(supp_name, supp_city, supp_phone)
 values 
	("Rajesh Retails","Delhi",'1234567890'),
    ("Appario Ltd.","Mumbai",'2589631470'),
    ("Knome products","Banglore",'9785462315'),
    ("Bansal Retails","Kochi",'8975463285'),
    ("Mittal Ltd.","Lucknow",'7898456532');
    
select * from supplier;

delete from supplier;

select * from supplier;

update supplier set supp_id=2 where supp_name="Appario Ltd.";
update supplier set supp_id=5 where supp_name="Mittal Ltd.";

