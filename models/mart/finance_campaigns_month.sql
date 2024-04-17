SELECT campaign_year
    , campaign_month
    , SUM(nb_transactions) AS nb_transactions
    , ROUND(SUM(revenue), 2) AS revenue
    , SUM(quantity) AS quantity
    , ROUND(SAFE_DIVIDE(SUM(revenue), SUM(nb_transactions)),1) AS average_basket
    , ROUND(SUM(margin), 2) AS margin
    , ROUND(SUM(op_margin), 2) AS op_margin
    , ROUND(SUM(ads_cost), 2) AS ads_cost
    , CAST(SUM(impression) AS INT64) AS impression
    , CAST(SUM(click) AS INT64) AS click
    , ROUND(SUM(ad_margin), 2) AS ad_margin
FROM {{ ref('finance_campaigns_day') }}
GROUP BY campaign_year, campaign_month
ORDER BY campaign_year, campaign_month