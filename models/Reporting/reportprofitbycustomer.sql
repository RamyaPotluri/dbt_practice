select CUSTOMERID,CUSTOMERNAME,segment,COUNTRY,
sum(orderprofits) as profit
from {{ ref('stg_orders') }}
group by  CUSTOMERID,segment,COUNTRY,CUSTOMERNAME