SELECT
    date_date,
    orders_id,
    product.products_id,
    quantity,
    purchase_price,
    revenue,    
    (quantity * purchase_price) AS purchase_cost,
    ROUND((revenue - (quantity * purchase_price)),2) AS margin
FROM
    {{ ref('stg_raw__product') }} AS product
LEFT JOIN
    {{ ref('stg_raw__sales') }} AS sales
ON
    product.products_id = sales.product_id



