#-------Inspecting the whole data------#
Select * from dbo.Sales_Data
#-------Checking Unique Values from Database------#
select distinct STATUS FROM dbo.Sales_Data
select distinct PRODUCTLINE from dbo.Sales_Data
select distinct COUNTRY from dbo.Sales_Data
select distinct DEALSIZE from dbo.Sales_Data
select distinct TERRITORY from dbo.Sales_Data

#-------Analysis of the data------------#
#-------Grouping Sales by Productline---------#
select PRODUCTLINE, sum(SALES) as Revenue from dbo.Sales_Data 
group by PRODUCTLINE
order by 2 desc

#-------Finding Year generated high sales------#
select YEAR_ID, sum(SALES) as Revenue from dbo.Sales_Data 
group by YEAR_ID
order by 2 desc
#-------Finding out why Year 2005 generated less Revenue-They Operated few months per Year. 12 months of Operations in Year 2004&2003----#

select distinct MONTH_ID from dbo.Sales_Data 
where YEAR_ID = 2005
select distinct MONTH_ID from dbo.Sales_Data 
where YEAR_ID = 2003
select distinct MONTH_ID from dbo.Sales_Data 
where YEAR_ID = 2004

#-------Finding out the best month in 2005, 2004,2003 and total earned during that month-------#
select MONTH_ID, sum(SALES) as Revenue, count(ORDERLINENUMBER) as Frequency from dbo.Sales_Data 
where YEAR_ID = 2005
group by MONTH_ID 
order by 2 desc 

select MONTH_ID, sum(SALES) as Revenue, count(ORDERLINENUMBER) as Frequency from dbo.Sales_Data 
where YEAR_ID = 2003
group by MONTH_ID 
order by 2 desc 

select MONTH_ID, sum(SALES) as Revenue, count(ORDERLINENUMBER) as Frequency from dbo.Sales_Data 
where YEAR_ID = 2004
group by MONTH_ID 
order by 2 desc 

#--------Novermber Seems to be the best month IN 2004&2003 Which Productline was the best?
select MONTH_ID, PRODUCTLINE, sum(SALES) as Revenue, count(ORDERLINENUMBER) as Frequency from dbo.Sales_Data 
where YEAR_ID = 2004 and MONTH_ID = 11
group by MONTH_ID,PRODUCTLINE
order by 4 desc

select MONTH_ID, PRODUCTLINE, sum(SALES) as Revenue, count(ORDERLINENUMBER) as Frequency from dbo.Sales_Data 
where YEAR_ID = 2003 and MONTH_ID = 11
group by MONTH_ID,PRODUCTLINE
order by 4 DESC

#-------Identifying the best customer using RFM(Recency= Last order date, Frequency = Total order, Monetary Value: Money spent)------#

select customername,
sum(sales) as Monetary_value,
avg(sales) as Avgmonetary_value, 
count(ordernumber) as Frequency,
max(orderdate) as Last_order_date,
(select max(orderdate) from dbo.Sales_Data) as max_order_date,
DATEDIFF(DD, max(orderdate), (select max(orderdate) from dbo.Sales_Data) ) as recency
from dbo.Sales_Data
group by customername
Order by recency desc

#-------Identifying prodocuts shipped often together----------------#(2)

select ordernumber from 
    (select ordernumber, count(*) as record# from dbo.Sales_Data
    where status = 'Shipped'
    group by ordernumber) as m
where record# = 3
#--------Inspecting the previous results in (2)-------#
select * from dbo.Sales_Data where ordernumber = 10365


