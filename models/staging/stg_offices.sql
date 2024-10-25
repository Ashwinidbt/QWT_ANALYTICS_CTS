{{ config(materialized='table' , schema =env_var('DBT_STAGESCHEMA','STAGING'))}}

with offices as (

select
Office as Officeid,
OfficeAddress as address,
OfficePostalCode as postalcode,
OfficeCity as city,
OfficeStateProvince as stateprovince,
OfficePhone as phone,
OfficeFax as fax,
OfficeCountry as country
 from {{source('qwt_src','offices')}}

)

select *
from offices