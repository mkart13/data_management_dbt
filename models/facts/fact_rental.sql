{{ config(materialized='table')}}

SELECT
    r.rental_id,
    c.customer_key,
    st.staff_key,
    1 as rental_quantity

FROM
    {{ref('stage_rental')}} r
    LEFT JOIN {{ref('dim_customer')}} c on r.customer_id = c.customer_id
    LEFT JOIN {{ref('dim_staff')}} st on r.staff_id = st.staff_id