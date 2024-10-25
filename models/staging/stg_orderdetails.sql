{{ config(materialized = 'incremental', unique_key = ['orderid','lineno'], schema =env_var('DBT_STAGESCHEMA','STAGING'))}}
with Orders as
(
    select * from {{source('qwt_src','orders')}}
)
,
Order_Details as
(
    select * from  {{source('qwt_src','orderdetails')}}
)
,
final as
(
    select
    OD.* ,o.orderdate
    from Orders O inner join Order_Details OD on O.orderid=OD.orderid
)
select * from final
 {% if is_incremental() %}
 where orderdate > (select max(orderdate) from  {{source('qwt_src','orders')}})
{% endif %}