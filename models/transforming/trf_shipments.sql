{{config(materialized='table',schema='transforming')}}

select
sh.orderid,
sh.shipmentdate,
sh.status,
sp.companyname as companyname
from
{{ref('shipments_snapshot')}} sh inner join
{{ref('shippers')}} as sp on
sh.shipperid=sp.shipperid
where sh.dbt_valid_to is null