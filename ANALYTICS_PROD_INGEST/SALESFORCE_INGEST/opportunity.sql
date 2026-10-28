
SELECT
      o.ID AS OPPORTUNITY_ID
    , o.ACCOUNT_ID
    , NULLIF(TRIM(o.NAME), '') AS OPPORTUNITY_NAME
    , o.OWNER_ID
    , NULLIF(TRIM(o.STAGE_NAME), '') AS STAGE_NAME
    , NULLIF(TRIM(o.TYPE), '') AS OPPORTUNITY_TYPE
    , o.AMOUNT
    , o.PROBABILITY
    , o.EXPECTED_REVENUE
    , o.CLOSE_DATE
    , o.IS_CLOSED
    , o.IS_WON
    , o.CREATED_DATE
    , o.LAST_MODIFIED_DATE
    , o.IS_DELETED
FROM {{ source('salesforce_raw', 'opportunity') }} AS o
  
