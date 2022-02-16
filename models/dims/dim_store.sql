{{ config(materialized='table') }}

select 

    store.store_id,

    addr.district,
    addr.address,
    addr.phone,

    staff.last_name

from 
    {{ ref('stage_store') }} as store

left join 

    {{ ref('stage_address') }} as addr

on store.address_id = addr.address_id

left join 

    {{ ref('stage_staff') }} as staff 

on store.manager_staff_id = staff.staff_id