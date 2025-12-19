select 
Parcel_id as parcel_id,
Parcel_tracking as parcel_tracking,
Transporter as transporter,
Priority as priority,
PARSE_DATE('%B %d, %Y', Date_purCHase) as date_purchase,
PARSE_DATE('%B %d, %Y', Date_sHIpping) as date_shipping,
PARSE_DATE('%B %d, %Y', DATE_delivery) as date_delivery,
PARSE_DATE('%B %d, %Y', DaTeCANcelled) as date_cancelled
from `raw_data_circle.raw_cc_parcel`