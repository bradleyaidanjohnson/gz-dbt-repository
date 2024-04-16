SELECT date_date
    , orders_id
    , sales.products_id
    , revenue
    , quantity
    , purchase_price
    , ROUND(quantity * purchase_price, 2) AS purchase_cost
    , ROUND(revenue - (quantity * purchase_price), 2) AS margin
FROM {{ ref("stg_raw__sales")}} AS sales
JOIN {{ ref("stg_raw__product")}} AS products
    ON sales.products_id = products.products_id