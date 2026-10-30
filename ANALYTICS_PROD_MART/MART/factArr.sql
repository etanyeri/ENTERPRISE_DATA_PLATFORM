
SELECT
      TF.REPORT_DATE
    , {{ dbt_utils.generate_surrogate_key(['TF.REPORT_DATE', 'TF.SUBSCRIPTION_ID']) }} AS ARR_KEY
    , COALESCE(ACC.ACCOUNT_SK, {{ dbt_utils.generate_surrogate_key(["'-1'"]) }}) AS ACCOUNT_KEY
    , COALESCE(PRD.PRODUCT_KEY, {{ dbt_utils.generate_surrogate_key(["'-1'"]) }}) AS PRODUCT_KEY
    , COALESCE(SUB.SUBSCRIPTION_KEY, {{ dbt_utils.generate_surrogate_key(["'-1'"]) }}) AS SUBSCRIPTION_KEY
    , COALESCE(CON.CONTRACT_KEY, {{ dbt_utils.generate_surrogate_key(["'-1'"]) }}) AS CONTRACT_KEY
    , COALESCE(OPP.OPPORTUNITY_KEY, {{ dbt_utils.generate_surrogate_key(["'-1'"]) }}) AS OPPORTUNITY_KEY
    , TF.ACCOUNT_ID
    , TF.SUBSCRIPTION_ID
    , TF.PRODUCT_ID
    , TF.CONTRACT_ID
    , TF.OPPORTUNITY_ID
    , TF.SOURCE
    , TF.ARR_USD::NUMBER(18,2) AS ARR_USD
    , TF.ARR_LOCAL::NUMBER(18,2) AS ARR_LOCAL
    , ROUND(TF.ARR_USD / 12, 2) AS MRR_USD
    , ROUND(TF.ARR_LOCAL / 12, 2) AS MRR_LOCAL
    , TF.LOCAL_CURRENCY
    , CURRENT_TIMESTAMP() AS UPDATED_AT
FROM {{ ref('tf_subscription_arr') }} AS TF
LEFT OUTER JOIN {{ ref('dim_account') }} AS ACC ON TF.ACCOUNT_ID = ACC.ACCOUNT_ID
LEFT OUTER JOIN {{ ref('dim_product') }} AS PRD ON TF.PRODUCT_ID = PRD.PRODUCT_ID
LEFT OUTER JOIN {{ ref('dim_subscription') }} AS SUB ON TF.SUBSCRIPTION_ID = SUB.SUBSCRIPTION_ID
LEFT OUTER JOIN {{ ref('dim_contract') }} AS CON ON TF.CONTRACT_ID = CON.CONTRACT_ID
LEFT OUTER JOIN {{ ref('dim_opportunity') }} AS OPP ON TF.OPPORTUNITY_ID = OPP.OPPORTUNITY_ID
WHERE TF.REPORT_DATE >= '2025-01-01'
