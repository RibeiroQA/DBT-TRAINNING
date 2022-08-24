select
-- from raw orders
{{ dbt_utils.surrogate_key(['o.orderid', 'c.cusotmerid', 'p.procuctid']) }} as sk_orders,
o.orderid, 
o.orderdate, 
o.shipdate,
o.shipmode,
o.ordersellingprice - ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,

--from raw customer
c.cusotmerid,
c.cusotmername, 
c.segment,
c.country, 

--from raw prodructs

p.category,
p.procuctid,
p.procuctname,
p.subcategory,
{{ markup('ordersellingprice', 'ordercostprice') }} as markup,
d.delivery_team


from {{ref('raw_orders')}} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.cusotmerid
left join {{ ref('raw_product') }} as p
on o.productid = p.procuctid

left join {{ ref('delivery_team') }} as d
on o.shipmode = d.shipmode



