with 

source as (

    select * from {{ source('raw_circle', 'parcel_product') }}

),

renamed as (

    select
        parcel_id,
        model_mame AS model_name,
        quantity

    from source

)

select * from renamed
