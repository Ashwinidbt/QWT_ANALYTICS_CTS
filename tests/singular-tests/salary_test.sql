select
empid,
YEARSALARY
from
{{ref('stg_employees')}}
group by empid,YEARSALARY
having not( YEARSALARY < 180001)