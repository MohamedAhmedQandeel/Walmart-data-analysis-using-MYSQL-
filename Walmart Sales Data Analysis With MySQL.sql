CREATE DATABASE IF NOT EXISTS Walmart_sales ; #creating the database 
use walmart_sales;
alter table walmartsalesdata 
change COLUMN `gross income` gross_income float;
-- Adding time of the day 
SELECT time , 
CASE 
    WHEN time between "00.00.00" AND "12.00.00" THEN "Morning"
    WHEN time between "12.00.00" AND "16.00.00" THEN "Afternoon"
    ELSE "evining"
    END 
    FROM walmartsalesdata ;
    ALTER TABLE walmartsalesdata add column time_of_the_day VARCHAR(20) ;
    UPDATE walmartsalesdata 
    SET time_of_the_day = (
    CASE 
    WHEN time between "00.00.00" AND "12.00.00" THEN "Morning"
    WHEN time between "12.00.00" AND "16.00.00" THEN "Afternoon"
    ELSE "evining"
    END 
    );
    ALTER TABLE walmartsalesdata
    CHANGE `Product line` product_line VARCHAR(255);
    
    -- adding day name column 
    
    SELECT date , dayname(date)
    From walmartsalesdata ;
    
    alter table walmartsalesdata  
    ADD column day_name varchar(20);
    
    update walmartsalesdata 
    set day_name = dayname(date) ;
    
    -- showing data after adding the day_name
    SELECT * 
    FROM walmartsalesdata ;
    -- adding column month 
    SELECT DATE, monthname(date) 
    FROM walmartsalesdata;
    ALTER TABLE walmartsalesdata 
    ADD COLUMN month_name varchar(20);
    
    UPDATE walmartsalesdata 
    SET month_name = monthname(date);
    
    # answring how many unique cites in our data 
    SELECT count(DISTINCT city)
    FROM walmartsalesdata ;#the answer is 3 
    
    # showing name of cites in our data 
    SELECT DISTINCT city 
    FROM walmartsalesdata ; 
    
    #how many product line does our data have 
    SELECT DISTINCT product_line
    FROM walmartsalesdata ; 
    
    #how many d product line in our store
    SELECT count(DISTINCT product_line) 
    FROM walmartsalesdata ; 
    
    #showing what is the most comomn payment method 
    SELECT payment ,count(payment)
    FROM walmartsalesdata 
    GROUP BY payment ; # elctronic wallet is the most common method 
    
    # what is the most selling product_line 
    SELECT product_line , count(product_line) 
    FROM walmartsalesdata 
    Group by Product_line 
    order by count(product_line) DESC ; # fashion accessories is the most common product line 
    
    # showing the months with most revenue 
    
    SELECT month_name , sum(gross_income)
    FROM walmartsalesdata 
    GROUP BY month_name ; # january is the most selling month 
    
    # what month have the most cogs 
    
    SELECT month_name , sum(cogs)
    FROM walmartsalesdata
    GROUP  BY month_name ;
    #what product line have the most income 
    
    SELECT product_line ,sum(gross_income) as rev
    FROM walmartsalesdata 
    GROUP BY product_line 
    ORDER BY rev DESC;
    
    #What city have the most revenue ?
    
    SELECT city , SUM(gross_income) as rev
    FROM walmartsalesdata 
    GROUP BY city 
    ORDER BY REV DESC;