select
-- from raw orders
o.orderid, 
o.orderdate, 
o.shipdate,
o.shipmode,
o.ordersellingprice - ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,

--from raw customer
c.cusotmername, 
c.segment,
c.country, 

--from raw prodructs

p.category,
p.procuctname,
p.subcategory


from {{ref('raw_orders')}} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.cusotmerid
left join {{ ref('raw_product') }} as p
on o.productid = p.procuctid




