select
    procuctid,
    procuctname,
    category,
    subcategory,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    procuctid,
    procuctname,
    category,
    subcategory