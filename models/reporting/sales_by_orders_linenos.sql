select
orderid,
sum(case when lineno = 1 then linesalesamount end ) as lineno1_sales,
sum(case when lineno = 2 then linesalesamount end ) as lineno2_sales,
sum(case when lineno = 3 then linesalesamount end ) as lineno3_sales,
sum(linesalesamount) as total_sales
from {{ ref ('fct_orders' )}}
group by 1