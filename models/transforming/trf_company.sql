{{ config(materialized='table', schema= 'transforming')}}

    select emp.empid,
	emp.lastname,
	emp.firstname,
	emp.title,
	emp.hiredate,
	mgr.firstname as empname,
	mgr.firstname as managername,
	mgr.title as managerrole,
	off.address as ofcadr,
	off.city officecity,
	off.country as officecountry,
	emp.yearsalary
	from {{ref('stg_employees')}} as emp
	inner join {{ref('stg_employees')}} as mgr
	on emp.reportsto=mgr.empid
	inner join {{ref('stg_offices')}} as off
	on emp.office = off.officeid

    select
d. COMPANYNAME,d.CONTACTNAME,d.CITY,
min(f.ORDERDATE) as firstorderdate,
max(f.orderdate) as recentorderdate,
sum(f.orderid), sum(f.LINESALESAMOUNT)
from
QWT_ANALYTICS.SALESMART.DIM_CUSTOMERS d
inner join QWT_ANALYTICS.SALESMART.FCT_ORDERS f
on d.CUSTOMERID=f.CUSTOMERID
group by d. COMPANYNAME,d.CONTACTNAME,d.CITY