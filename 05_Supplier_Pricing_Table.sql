create table if not exists supplier_pricing(
	pricing_id int auto_increment,
    prod_id int, 
    supp_id int,
    supp_pricing int default(0),
    primary key(pricing_id),
    foreign key(prod_id) references product(prod_id),
    foreign key(supp_id) references supplier(supp_id)
);

alter table supplier_pricing auto_increment=0;

insert into supplier_pricing(prod_id, supp_id, supp_pricing)
values 
	((select prod_id from product where prod_name="ROG LAPTOP"),
    (select supp_id from supplier where supp_name="Mittal Ltd."),
    30000);
    
delete from supplier_pricing;
select * from supplier_pricing;


    
insert into supplier_pricing(prod_id, supp_id, supp_pricing)
values ((SELECT prod_id FROM product WHERE prod_name='GTA V'),2,1500),
		(3,5,30000),
        (5,1,3000),
        (2,3,2500),
        (4,1,1000),
        (12,2,780),
        (12,4,789),
        (3,1,31000),
        (1,5,1450),
        (4,2,999),
        (7,3,549),
        (7,4,529),
        (6,2,105),
        (6,1,99),
        (2,5,2999),
        (5,2,2999);
        
select * from supplier_pricing;
	
