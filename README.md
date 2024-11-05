# LITA_PROJECT_2
Project 2: Customer Segmentation for a Subscription Service

## OVERVIEW
This project focused on analyzing customer data for a subscription-based service to identify trends, behavior patterns, and key metrics related to customer subscriptions, renewals, and cancellations. 
The primary goal was to understand customer segments and provide a comprehensive analysis that could guide business strategies. 
The final deliverable was an interactive Power BI dashboard to visualize key insights and allow for deeper exploration of the data.

## KEY TOOLS
- Microsift Excel for Data Exploration & Reporting
- Microsoft SQL Server for Querying & Data Extraction
- Microsoft Power BI for Data Visualization

## Excel Analysis
- Data Exploration: Used Pivot Tables to analyze customer data and uncover patterns in subscription types, durations, and regional trends.
- Metrics Calculation: Calculated the average subscription duration across customers and identified the most popular subscription types based on customer count.
- Reports: Created additional reports to explore customer behavior, focusing on renewals, cancellations, and subscription longevity.
  
<img width="737" alt="p2excel" src="https://github.com/user-attachments/assets/ffa7e3e1-a93b-42b8-81da-a98ba15f9498">

### Deliverables

Pivot Tables summarizing customer data by region, subscription type, and cancellation status.

<img width="424" alt="p2excel2" src="https://github.com/user-attachments/assets/2d9e89eb-80fe-4d28-adbb-723100a66669">


Key metric including average subscription duration.

<img width="207" alt="p2excel3" src="https://github.com/user-attachments/assets/f1901e69-9272-45af-89dd-ddec47de3a98">


Excel-based reports to track trends in renewals and cancellations.



## SQL Data Analysis

Data Loading: Loaded the sales dataset into SQL Server to perform more complex queries.

### Deliverables
- Retrieve the total number of customers from each region. 
```SQL
select Region, count(CustomerID) as TotalCustomers
from CustomerData
group by Region
```

- Find the most popular subscription type by the number of customers.  
```SQL 
select top 1 SubscriptionType, count(CustomerID) as TotalCustomers
from CustomerData
group by SubscriptionType
order by TotalCustomers desc
```

- Find customers who canceled their subscription within 6 months. 
```SQL 
select CustomerID, CustomerName from CustomerData
where datediff(month, SubscriptionStart, SubscriptionEnd) <= 6 AND Canceled = 1
```

- Calculate the average subscription duration for all customers. 
```SQL 
select avg(datediff(day, SubscriptionStart, SubscriptionEnd)) as avgerageSubscriptiondays
from CustomerData
```

- Find customers with subscriptions longer than 12 months. 
```SQL 
select CustomerID, CustomerName
from CustomerData
where datediff(month, SubscriptionStart, SubscriptionEnd) > 12
```

- Calculate total revenue by subscription type. 
```SQL 
select SubscriptionType, sum(Revenue) as TotalRevenue
from CustomerData
group by SubscriptionType
```

- Find the top 3 regions by subscription cancellations. 
```SQL 
select top 3 Region, count(CustomerID) as TotalCustomers
from CustomerData
where Canceled = 1
group by Region
order by TotalCustomers desc
```

- Find the total number of active and canceled subscriptions.
```SQL 
select 
case when Canceled = 0 then 'Canceled' else 'Active' end Subscriptions_Status,
count(customerID) as TotalCustomers
from CustomerData
group by Canceled
```

## Power BI Dashboard
Dashboard Creation: Designed an interactive Power BI dashboard to visualize the key insights derived from the Excel and SQL analysis.

### Visualization Elements
1. Sales overview, including total revenue, regional breakdown, and monthly sales trends.
2. Top-performing products, showcasing products with the highest sales.
3. Regional sales performance, allowing for in-depth comparison between different regions.

### Deliverables

<img width="728" alt="p1pbix" src="https://github.com/user-attachments/assets/b0740f89-bc53-4800-bfdd-8b7928a867b4">
   
## Key Takeaways 
1. Data Exploration: Gained hands-on experience in exploring and preparing retail sales data for analysis.
2. SQL & Data Querying: Developed and optimized SQL queries for extracting critical business insights from large datasets.
3. Data Visualization: Built an interactive Power BI dashboard to present and share findings with stakeholders in a visually compelling manner.
   
This project demonstrates my ability to perform end-to-end data analysis, from raw data exploration to advanced SQL querying and creating interactive dashboards to drive business decisions. The insights generated through this analysis can help a retail store optimize its sales strategies and improve overall performance.
