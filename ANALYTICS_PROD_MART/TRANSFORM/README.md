# TRANSFORM Layer

This schema contains intermediate dbt models that transform cleaned Salesforce CRM data into reusable business entities.

Transformations include:

- Data deduplication using `ROW_NUMBER()` and `QUALIFY`
- Multi-table joins and common table expressions (CTEs)
- Business key standardization
- Account hierarchy modeling
- Opportunity and contract enrichment
- Revenue calculations and business logic

**Data Flow:** Salesforce → Stitch → Snowflake RAW → dbt INGEST → dbt TRANSFORM → MART

All models are independently developed using illustrative business rules and synthetic source definitions.
