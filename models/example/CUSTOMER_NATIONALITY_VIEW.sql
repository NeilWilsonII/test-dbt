select N_NAME as country, NATIONKEY_COUNT as country_count
from {{ref('CUSTOMER_NATIONALITY_COUNT')}}