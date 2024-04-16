SELECT orders.orders_id
    , date_date
    , revenue
    , quantity
    , purchase_cost
    , margin
    , shipping_fee
    , logcost
    , ship_cost
    , ROUND((margin + shipping_fee) - (logcost + ship_cost), 2) AS operational_margin
FROM {{ ref("int_orders_margin")}} orders
JOIN {{ ref("stg_raw__ship")}} ship
ON orders.orders_id = ship.orders_id
ORDER BY orders.orders_id DESC