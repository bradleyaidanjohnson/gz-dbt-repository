{{ config(
    materialized='table',
    partition_by={
      "field": "date_purchase",
      "data_type": "date",
      "granularity": "day"
    }
)}}

SELECT parcel.parcel_id
    , model_name
    , parcel_tracking
    , transporter
    , priority
    , date_purchase
    , date_shipping
    , date_delivery
    , date_cancelled
    , month_purchase
    , status
    , expedition_time
    , transport_time
    , delivery_time
    , delay
    , qty
FROM {{ ref("cc_parcel")}} parcel
JOIN {{ ref("stg_raw_circle__parcel_product")}} product
    ON parcel.parcel_id = product.parcel_id