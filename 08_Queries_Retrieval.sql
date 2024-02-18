
-- Question 3: Display the total number of customers based on gender who have placed orders of worth at least Rs.3000

select count(t2.cus_gender) as NumberOfCustomer, t2.Cus_gender from
(select t1.cus_id,t1.cus_gender, t1.ord_amount, t1.cus_name from
(select `order`.*, customer.cus_gender, customer.cus_name  from 
`order` inner join customer where `order`.cus_id=customer.cus_id having
`order`.ord_amount>=3000)
as t1 group by t1.cus_id) as t2 group by t2.cus_gender; 


-- Question 4: Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select product.prod_name, `order`.* from `order`, supplier_pricing, product
where `order`.cus_id=2 and 
`order`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.prod_id=product.prod_id;

-- Question 5: Display the Supplier details of who is supplying more than one product

select supplier.* from supplier where supplier.supp_id in 
	(select supp_id from supplier_pricing group by supp_id
    having count(supp_id)>1)
    group by supplier.supp_id;
    
-- Question 6: Find the least expensive product from each category and print the table 
-- 				with category id, name and price of the product

select category.cat_id, category.cat_name, min(t3.min_price) as Minimum_Price from
category inner join (select product.cat_id, product.prod_name, t2.* from product inner join
(select prod_id, min(supp_pricing) as min_price from 
supplier_pricing group by prod_id)
as t2 where t2.prod_id=product.prod_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

-- Question 7: Display the id and Name of the Product ordered after "2021-10-05"

select product.prod_id, product.prod_name from `order` inner join supplier_pricing on
supplier_pricing.pricing_id=`order`.pricing_id inner join product on
product.prod_id=supplier_pricing.prod_id where `order`.ord_date > "2021-10-05";

-- Quesiton 8: display customer name and gender whose names start or end with character 'A'.

select customer.cus_name, customer.cus_gender from customer where customer.cus_name
like 'A%' or customer.cus_name like '%A';

-- Question 9: create a stored procedure to display supplier id, name rating and 
-- Type_of_supplier. If rating>4 then "Genuine Supplier" if rating>2 "Average Supplier"
-- else "Supplier should not be consider".

USE `ecommerce_db`;
DROP procedure IF EXISTS `Rating_review`;

DELIMITER $$
USE `ecommerce_db`$$
CREATE PROCEDURE `Rating_review` ()
BEGIN
select report.supp_id, report.supp_name, report.Average,
case
	when report.Average = 5 then "Excellent Service"
    when report.Average>4 then "Good Service"
    when report.Average>2 then "Average Service"
    else "Poor service"
end as type_of_service from
	(select final.supp_id, supplier.supp_name, final.Average from
    (select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
    (select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from supplier_pricing inner join 
    (select `order`.pricing_id, rating.ord_id, rating.rat_ratstars from `order` inner join
		rating on rating.ord_id = `order`.ord_id) as test
        on test.pricing_id = supplier_pricing.pricing_id)
        as test2 group by supplier_pricing.supp_id)
        as final inner join supplier where final.supp_id = supplier.supp_id) as report;
        
END$$

DELIMITER ;

call Rating_review();

    
