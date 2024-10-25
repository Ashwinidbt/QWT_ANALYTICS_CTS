{{config(materialised='view', schema ='reporting')}}
select
d. COMPANYNAME,d.CONTACTNAME,d.CITY,
min(f.ORDERDATE) as firstorderdate,
max(f.orderdate) as recentorderdate,
count(f.orderid) as totalorders, sum(f.LINESALESAMOUNT) as totalsales
from
{{ ref ('dim_customers' )}} d
inner join {{ ref ('fct_orders' )}} f
on d.CUSTOMERID=f.CUSTOMERID
group by d. COMPANYNAME,d.CONTACTNAME,d.CITY
