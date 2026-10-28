# MART Layer

This schema contains analytics-ready fact and dimension tables built using dbt and dimensional modeling principles.

**Dimension tables**
- `dim_account` — Customer account attributes and hierarchy
- `dim_date` — Calendar attributes for reporting
- `dim_sales_rep` — Sales representative attributes

**Fact tables**
- `fact_opportunity` — Sales pipeline and opportunity measures
- `fact_contract` — Contract values and contract lifecycle measures

Models demonstrate surrogate keys, fact-to-dimension relationships, business metrics, and data quality testing.

All examples use fictional CRM structures and independently developed transformations.
