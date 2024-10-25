{{ config(materialized='table' , schema =env_var('DBT_STAGESCHEMA','STAGING'))}}

with shipments as (

select 
OrderID ,
LineNo ,
ShipperID ,
CustomerID ,
ProductID ,
EmployeeID ,
split_part(ShipmentDate,' ',1) as ShipmentDate ,
Status 
 from {{source('qwt_src','shipments')}}

)

select *
from shipments