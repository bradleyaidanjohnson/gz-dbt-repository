WITH agg_orders AS(
    SELECT orders_id
        , date_date
        , ROUND(SUM(revenue), 2) AS revenue
        , SUM(quantity) AS quantity
        , ROUND(SUM(purchase_cost), 2) AS purchase_cost
        , ROUND(SUM(margin), 2) AS margin
    FROM {{ ref("margin_enr")}}
    GROUP BY orders_id, date_date
)
SELECT agg_orders.orders_id
    , date_date
    , revenue
    , quantity
    , ROUND(SAFE_DIVIDE(revenue, quantity), 1) AS average_basket
    , purchase_cost
    , margin
    , shipping_fee
    , logcost
    , ship_cost
    , ROUND((margin + shipping_fee) - (logcost + ship_cost), 2) AS op_margin
FROM agg_orders
JOIN {{ ref("stg_raw__ship")}} ship
ON agg_orders.orders_id = ship.orders_id
ORDER BY orders_id DESC