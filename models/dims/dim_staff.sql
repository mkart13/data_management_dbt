{{ config(materialized='table') }}
/*
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

*/

SELECT
    {{ dbt_utils.surrogate_key(['s.staff_id']) }} AS staff_key,
    s.staff_id,
	s.first_name,
	s.last_name,
	CONCAT (FIRST_NAME,	',',LAST_NAME) AS firstlastname,
	s.email,
	CASE s.ACTIVE
		WHEN 'TRUE'
			THEN 'Yes'
		ELSE 'No'
		END AS active
FROM {{ref('stage_staff')}} s