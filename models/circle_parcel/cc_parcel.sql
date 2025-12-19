WITH nb_products_parcel AS (
    SELECT
        parcel_id,
        SUM(quantity) AS qty,
        COUNT(DISTINCT model_name) AS nb_models
    FROM {{ref("stg_cc_parcel_product")}}
    GROUP BY parcel_id 
)

SELECT 
    p.parcel_id,
    p.parcel_tracking,
    p.transporter,
    p.priority,
    p.date_purchase,
    p.date_shipping,
    p.date_delivery,
    p.date_cancelled,
    EXTRACT(MONTH FROM p.date_purchase) AS month_purchase,
    CASE 
        WHEN p.date_cancelled IS NOT NULL THEN 'Cancelled'
        WHEN p.date_shipping IS NULL THEN 'In Progress'
        WHEN p.date_delivery IS NULL THEN 'In Transit'
        WHEN p.date_delivery IS NOT NULL THEN 'Delivered'
        ELSE NULL
    END AS status,
    DATE_DIFF(p.date_shipping, p.date_purchase, DAY) AS expedition_time,
    DATE_DIFF(p.date_delivery, p.date_shipping, DAY) AS transport_time, 
    DATE_DIFF(p.date_delivery, p.date_purchase, DAY) AS delivery_time,
    IF(p.date_delivery IS NULL, NULL, IF(DATE_DIFF(p.date_delivery, p.date_purchase, DAY) > 5, 1, 0)) AS delay,
    nb.qty AS quantity,
    nb.nb_models
FROM {{ref("stg_cc_parcel")}} p
LEFT JOIN nb_products_parcel nb
USING (parcel_id)