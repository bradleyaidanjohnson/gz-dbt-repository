select date_date
    , orders_id
    , sales.product_id
    , revenue
    , quantity
    , purchase_price
    , ROUND(quantity * purchase_price, 2) AS purchase_cost
    , ROUND(revenue - (quantity * purchase_price), 2) AS margin
    , {{margin_percent('revenue', 'quantity * purchase_price')}} AS margin_percent
FROM {{ ref("stg_raw__sales")}} sales
JOIN {{ ref("stg_raw__product")}} product
ON sales.product_id = product.products_id