SELECT parcel.parcel_id
    , parcel_tracking
    , transporter
    , priority
    , date_purchase
    , date_shipping
    , date_delivery
    , date_cancelled
    , EXTRACT(MONTH FROM date_purchase) AS month_purchase
    , IF(date_cancelled IS NOT NULL, "Cancelled", IF(date_delivery IS NOT NULL, "Delivered", IF(date_shipping IS NOT NULL, "In transit", "In progress"))) AS status
    , DATE_DIFF(date_shipping, date_purchase,DAY) AS expedition_time
    , DATE_DIFF(date_delivery, date_shipping,DAY) AS transport_time
    , DATE_DIFF(date_delivery, date_purchase,DAY) AS delivery_time
    , IF(date_delivery IS NULL, NULL, IF(DATE_DIFF(date_delivery, date_purchase,DAY) > 5, 1, 0)) AS delay
    , SUM(quantity) OVER(PARTITION BY parcel.parcel_id) AS qty
    , COUNT(DISTINCT product.model_name) OVER(PARTITION BY parcel.parcel_id) AS nb_model
FROM {{ ref("stg_raw_circle__parcel")}} parcel
JOIN {{ ref("stg_raw_circle__parcel_product")}} product
    ON parcel.parcel_id = product.parcel_id