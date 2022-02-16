{{ config(materialized='table') }}

select 
    actor_id as actor_key,
    CONCAT_WS(' ', last_name,  first_name) as full_name
from 
    {{ref('stage_actor')}}
  --  "SAKILA_DW"."DBT_KMADDIPOTI"."STAGE_ACTOR"
