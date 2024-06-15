### Exploratory Data Analysis Using MySQL Workbench

* Show all customer records
  SELECT * FROM customers;

* Show total number of customers
  SELECT count(*) FROM customers;`

* Show all markets available
  SELECT * FROM sales.markets;

* Show unique currencies in which sales transactions happened
  SELECT distinct currency from sales.transactions;

* Show transactions happened in USD currency
  SELECT * from sales.transactions where currency='USD';

* Show numbe of transactions for Chennai market (market code of chennai is Mark001)
  SELECT count(*) from sales.transactions where market_code='Mark001';

* Show distrinct product codes that were sold in chennai
  SELECT distinct product_code FROM transactions where market_code='Mark001';


* Show all market names and number of transactions under them
  SELECT market_code, count(*) from sales.transactions group by market_code;

* Show sales amount for sales happened in year 2020
  SELECT SUM(t.sales_amount) from sales.transactions t INNER JOIN
  sales.date d ON t.order_date = d.date 
  where d.year=2020;

* Show sales amount for Chennai market for sales happened in year 2020
  SELECT SUM(t.sales_amount) from sales.transactions t INNER JOIN
  sales.date d ON t.order_date = d.date 
  where d.year=2020 AND t.market_code='Mark001';

* Show total revenue in year 2020 in Chennai
  SELECT SUM(transactions.sales_amount) FROM transactions 
  WHERE transactions.order_date.year=2020 AND transactions.market_code="Mark001";`

* Show product code and their total sales amount and order by sales amount in descending order
  SELECT product_code, sum(sales_amount) s FROM sales.transactions 
  WHERE market_code = 'Mark001'
  group by product_code
  order by s DESC;
