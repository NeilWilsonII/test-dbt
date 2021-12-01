{{ config(materialized='table', transient=false) }}
with nation_count as (
    SELECT count(C_NATIONKEY) as NATIONKEY_COUNT, C_NATIONKEY as N_NATIONKEY
    FROM {{ source('raw', 'CUSTOMER') }}
    GROUP BY C_NATIONKEY
)

select NATION.N_NAME, NATION.N_COMMENT, nation_count.NATIONKEY_COUNT
from {{ source('raw', 'NATION') }} as NATION
inner join nation_count
using(N_NATIONKEY)