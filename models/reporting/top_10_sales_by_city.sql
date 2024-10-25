{{config(materialized = 'view' , schema = 'reporting')}}
select sum(LINESALESAMOUNT)   as sales  ,avg(fo.margin) as margin
from
{{ref('fct_orders')}} as fo inner join {{ref ('dim_customers')}} as dc
on fo.CUSTOMERID=dc.CUSTOMERID
and CITY ='{{var('v_city','Berlin')}}'
group by orderid
order by sales desc
limit 10