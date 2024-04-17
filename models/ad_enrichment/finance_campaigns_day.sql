SELECT campaigns.date_date
    , EXTRACT(YEAR FROM campaigns.date_date) AS campaign_year
    , EXTRACT(MONTH FROM campaigns.date_date) AS campaign_month
    , nb_transactions
    , revenue
    , quantity
    , average_basket
    , margin
    , op_margin
    , ads_cost
    , impression
    , click
    , ROUND(op_margin - ads_cost, 2) AS ad_margin
FROM {{ ref('finance_days_b') }} finance
JOIN {{ ref('int_campaigns_day') }} campaigns
ON finance.date_date = campaigns.date_date