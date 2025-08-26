create database financeAnalytics;
use financeAnalytics;

create table customer(
customerid int primary key,
name varchar(100),
email varchar(100),
signupdate Date,
city varchar(50),
isactive Boolean
);

create table accounts(
accountid int primary key,
customerid int,
balance decimal(10,2),
accounttype varchar(20),
createdon date,
foreign key(customerid) references customer(customerid)
);

create table transactions (
transactionid int primary key,
accountid int,
transactiondate date,
transactiontype varchar(20), -- credit or debit
amount decimal(10,2),
merchant varchar(100),
isfraud boolean,
foreign key(accountid) references accounts(accountid)
);

-- customer
insert into customer values
(1, 'alice', 'alice@gmail.com', '2022-01-01', 'new york', 1),
(2, 'bob', 'bob@gmail.com', '2022-05-15', 'chicago', 1),
(3, 'charlie', 'charlie@gmail.com', '2022-07-20', 'san franciso', 0);

-- account
insert into accounts values
(101, 1, 1500.00, 'personal', '2022-01-02'),
(102, 2, 2200.00, 'business', '2022-05-20'),
(103, 3, 500.00, 'personal', '2022-07-21');

-- transaction
insert into transactions values
(1001, 101, '2022-01-05', 'credit', 2000.00, 'bank transfer', 0),
(1002, 101, '2022-01-06', 'debit', 500.00, 'amazon', 0),
(1003, 102, '2022-05-25', 'debit', 1000.00, 'uber', 0),
(1004, 103, '2022-08-01', 'debit', 450.00, 'aliexpress', 1);

select * from customer;
select* from accounts;
select * from transactions;

-- total number of active customer
select count(*) as activecustomers
from customer
where isactive = 1;

-- total transaction and amount per month

select
date_format(transactiondate, '%y-%m') as Month,
count(*) as totaltransactions,
sum(amount) as totalamount
from transactions
group by month
order by month;

-- customer wise total debit and credit

select  
	c.name,
    sum(case when t.transactiontype = 'credit' then t.amount else 0 end) as TotalCredit,
    sum(case when t.transactiontype = 'debit' then t.amount else 0 end) as TotalDebit
from customer c
join accounts a on c.customerId = a.customerId
join transactions t on a.accountId = t.accountId
group by c.name;

-- TOP 3 MERCHANTS by transaction volume
select merchant, count(*) as transactions, sum(amount) as totalSpent
from transactions 
group by merchant
order by totalSpent desc
limit 3;

-- detecting fraud rate by city
select 
	c.city,
    count(t.transactionid) as TotalTransactions,
    sum(case when t.isfraud = 1 then 1 else 0 end) as FraudTransactions,
    round(100 * sum(case when t.isfraud = 1 then 1 else 0 end) / count(t.transactionid),2) as FraudRatePct
from transactions t 
join accounts a on t.accountId = a.accountId
join customer c on a.customerId = c.customerId
group by c.city;

-- average debit per customer

select 
	c.name,avg(t.amount) as AvgDebit
from customer c
join accounts a on c.customerId = a.customerId
join transactions t on a.accountId = t.accountId
where t.transactiontype = 'debit'
group by c.name;

-- customers with no transactions 
select c.name
from customer c 
left join accounts a on c.customerId = a.customerId
left join transactions t on a.accountId = t.accountId
where t.transactionid is null;
