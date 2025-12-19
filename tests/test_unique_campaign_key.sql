select campaign_key, date, paid_source, count(*) as cnt
from {{ ref('int_campaigns') }}
group by campaign_key, date, paid_source
having count(*) > 1
