{{ config(materialized='table') }}

select 
    staff.staff_id as staff_key,
    staff.store_id as store_key,
    CONCAT_WS(' ', staff.last_name,  staff.first_name) as full_name,
    staff.username as staff_username,
    addr.address as store_address

from 
    {{ref('stage_staff')}} as staff

left join
    {{ref('stage_address')}} as addr

on staff.address_id = addr.address_id