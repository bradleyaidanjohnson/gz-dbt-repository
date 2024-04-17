SELECT date_date
    , ROUND(SUM(ads_cost), 2) AS ads_cost
    , SUM(impression) AS impression
    , SUM(click) AS click
FROM {{ ref('ad_union') }}
GROUP BY date_date
ORDER BY date_date