{{ config(materialized='table' ,schema='transforming')}}

select
o.orderid as orderid,
o.orderdate as orderdate,
year(o.orderdate) as orderyear,
month(o.orderdate) as ordermonth,
o.customerid as customerid ,
o.employeeid as employeeid,
o.shipperid as shipperid,
lineno ,
od.productid as productid,
od.quantity as quantity,
od.unitprice as unitprice,
od.discount as discount,
o.freight as freight,
(od.UnitPrice * od.Quantity) * (1-od.Discount) as linesalesamount,
p.UnitCost * od.Quantity as costofgoodssold,
((od.UnitPrice * od.Quantity) * (1-od.Discount)) - (p.UnitCost * od.Quantity) as margin
from 
{{ref('stg_orders')}}  o
inner join {{ref('stg_orderdetails')}}  od 
on o.orderid=od.orderid
innerjoin {{ref('stg_products')}}  p on od.productid=p.productid 