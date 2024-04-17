SELECT date_date
    , COUNT(*) AS nb_transactions
    , ROUND(SUM(revenue), 0) AS revenue
    , ROUND(AVG(revenue), 1) AS average_basket
    , ROUND(SUM(margin), 0) AS margin
    , ROUND(SUM(op_margin), 0) AS op_margin
FROM {{ ref("operational_margin")}}
GROUP BY date_date
ORDER BY date_date DESC