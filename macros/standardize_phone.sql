
{% macro standardize_phone(phone_column) %}
    CASE
        WHEN LENGTH(REGEXP_REPLACE(COALESCE({{ phone_column }}, ''), '[^0-9]', '')) = 11
             AND LEFT(REGEXP_REPLACE({{ phone_column }}, '[^0-9]', ''), 1) = '1'
            THEN SUBSTR(REGEXP_REPLACE({{ phone_column }}, '[^0-9]', ''), 2, 10)
        WHEN LENGTH(REGEXP_REPLACE(COALESCE({{ phone_column }}, ''), '[^0-9]', '')) = 10
            THEN REGEXP_REPLACE({{ phone_column }}, '[^0-9]', '')
        ELSE NULL
    END
{% endmacro %}
