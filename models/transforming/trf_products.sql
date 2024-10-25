{{ config(materialized='table' ,schema='transforming')}}

select 
p.productid,
p.productname,
c.categoryname,
s.companyname,
s.contactname,
s.city,
p.QUANTITYPERUNIT,
p.unitcost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
IFF(p.unitsinstock-p.unitsonorder>0 ,'available','not available') as productavailability
 from {{ref('stg_products')}} as p
 inner join {{ref('trf_suppliers')}} as  s
 on p.supplierid=s.supplierid
 inner join {{ref('categories')}} as c
 on c.categoryid= p.categoryid