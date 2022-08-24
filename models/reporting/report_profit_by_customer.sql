SELECT
    cusotmerid,
    segment,
    country,
    sum(orderprofit) as profit
FROM {{ ref('stg_orders') }}
GROUP BY
    cusotmerid,
    segment,
    country
