SELECT 
orders_id,
date_date,
ROUND(SUM(revenue),2) AS revenue,
ROUND(SUM(quantity),2) AS quantity,
ROUND(SUM(quantity * purchase_price),2) AS purchase_cost,
ROUND(SUM(revenue - (quantity * purchase_price)),2) AS margin
FROM
    {{ ref('stg_raw__product') }} AS product
LEFT JOIN
    {{ ref('stg_raw__sales') }} AS sales
ON
    product.products_id = sales.product_id
GROUP BY orders_id, date_date
ORDER BY orders_id DESC



