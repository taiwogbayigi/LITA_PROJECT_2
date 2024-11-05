select * from CustomerData

-- retrieve the total number of customers from each region. 
select Region, count(CustomerID) as TotalCustomers
from CustomerData
group by Region;

-- find the most popular subscription type by the number of customers.  
select top 1 SubscriptionType, count(CustomerID) as TotalCustomers
from CustomerData
group by SubscriptionType
order by TotalCustomers desc;

--find customers who canceled their subscription within 6 months. 
select CustomerID, CustomerName from CustomerData
where datediff(month, SubscriptionStart, SubscriptionEnd) <= 6 AND Canceled = 1;

-- calculate the average subscription duration for all customers. 
select avg(datediff(day, SubscriptionStart, SubscriptionEnd)) as avgerageSubscriptiondays
from CustomerData;

-- find customers with subscriptions longer than 12 months. 
select CustomerID, CustomerName
from CustomerData
where datediff(month, SubscriptionStart, SubscriptionEnd) > 12;

-- calculate total revenue by subscription type. 
select SubscriptionType, sum(Revenue) as TotalRevenue
from CustomerData
group by SubscriptionType;

-- find the top 3 regions by subscription cancellations. 
select top 3 Region, count(CustomerID) as TotalCustomers
from CustomerData
where Canceled = 1
group by Region
order by TotalCustomers desc;

-- find the total number of active and canceled subscriptions.
select 
case when Canceled = 0 then 'Canceled' else 'Active' end Subscriptions_Status,
count(customerID) as TotalCustomers
from CustomerData
group by Canceled