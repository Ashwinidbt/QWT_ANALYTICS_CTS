select
orderid,
avg(margin) as margin
from
{{ref('fct_orders')}}
group by orderid
having not (margin >=0)