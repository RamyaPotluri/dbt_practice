select PRODUCTID,PRODUCTNAME,CATEGORY,subCATEGORY,
sum(orderprofits) as profit
from {{ ref('stg_orders') }}
group by PRODUCTID,PRODUCTNAME,CATEGORY,subCATEGORY