SELECT date_date
    , COUNT(*) AS nb_transactions
    , ROUND(SUM(revenue), 0) AS revenue
    , ROUND(AVG(revenue), 1) AS average_basket
    , ROUND(SUM(margin), 0) AS margin
    , ROUND(SUM(operational_margin), 0) AS operational_margin
FROM {{ ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC