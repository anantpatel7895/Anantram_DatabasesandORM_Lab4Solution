create table if not exists Customer (
	cus_id int auto_increment,
    cus_name varchar(20) not null,
    cus_phone varchar(10) null,
    cus_city varchar(30) not null,
    cus_gender char,
    primary key(cus_id)
);

insert into customer(cus_name, cus_phone, cus_city, cus_gender)
values 
	("AAKASH",'9999999999',"DELHI",'M'),
    ("AMAN",'9785463215',"NOIDA",'M'),
    ("NEHA",'9999999999',"MUMBAI",'F'),
    ("MEGHA",'9994562399',"KOLKATA",'F'),
    ("PULKIT",'7895999999',"LUCKNOW",'M');
    
select * from customer;