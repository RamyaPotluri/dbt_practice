{{
    config(
        materialized='table'
    )
}}

select o.ORDERID ,
	o.ORDERDATE ,
	o.SHIPDATE,
	o.SHIPMODE,
     o.ORDERSELLINGPRICE-o.ORDERCOSTPRICE as orderprofits,
     c.CUSTOMERNAME,
     c.segment,
     c.COUNTRY,
     p.PRODUCTNAME,
     p.CATEGORY,
     p.subCATEGORY,
     o.PRODUCTID,
     o.CUSTOMERID
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customers') }} as c
on o.CUSTOMERID=c.CUSTOMERID
left join {{ ref('raw_product') }} as p 
on o.PRODUCTID=p.PRODUCTID