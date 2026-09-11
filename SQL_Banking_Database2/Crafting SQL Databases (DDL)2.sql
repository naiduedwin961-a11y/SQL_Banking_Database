USE pizza_sales_analysis;
CREATE DATABASE pizza_sales_analysis;

SHOW DATABASES;

CREATE TABLE `order` (
    id INT,
    date DATE
);

DESC `order`;


ALTER TABLE `order`
ADD COLUMN time TIME AFTER date;


ALTER TABLE `order` RENAME TO orders;

DESC `orders`;
ALTER TABLE orders
ADD PRIMARY KEY (id);

