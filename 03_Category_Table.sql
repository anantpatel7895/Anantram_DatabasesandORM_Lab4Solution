create table if not exists category(
	cat_id int auto_increment,
    cat_name varchar(20),
    primary key(cat_id)
);

insert into category(cat_name)
values 
	("Books"),
    ("Games"),
    ("Groceries"),
    ("Electronic"),
    ("Clothes");
    
select * from category;
	