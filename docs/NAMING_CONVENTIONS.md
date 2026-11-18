# Naming Conventions

## Purpose
Consistent naming makes models easier to discover, review, and maintain. The conventions below are **proposed standards**; current model names are preserved to avoid breaking existing `ref()` dependencies.

## dbt model names

| Layer | Recommended pattern | Example |
| --- | --- | --- |
| Source | Source system and entity | `salesforce_raw.account` (dbt source reference) |
| Staging | `stg_<source>_<entity>` | `stg_salesforce_account` |
| Intermediate | `int_<business_process>` | `int_subscription_revenue` |
| Existing transform layer | `tf_<entity>` | `tf_subscription_arr` |
| Fact | `fct_<business_process>` | `fct_subscription_arr` |
| Dimension | `dim_<entity>` | `dim_account` |
| Snapshot | `snp_<entity>` | `snp_account_history` |
| Macro | `snake_case` verb phrase | `generate_surrogate_key` |

### Current repository names
The repository currently uses `factArr` and `factOpportunity`, alongside `dim_account`, `dim_subscription`, and `dim_opportunity`. These are valid existing names; `fct_` is a **future convention**, not a required immediate migration. Rename only with an inventory of `ref()` usages and downstream consumers.

## Columns
- Prefer descriptive names with stable meaning.
- Use `_ID` for source-system business identifiers, e.g. `SUBSCRIPTION_ID`.
- Use `_KEY` or `_SK` for warehouse surrogate identifiers, and document which is used.
- Use `_DATE` for dates and `_AT` or `_TIMESTAMP` for timestamps, with time-zone semantics documented.
- Encode monetary currency in measure names, e.g. `ARR_USD`, `ARR_LOCAL`.
- Keep existing case conventions where the source/warehouse already standardizes them.

## Keys and grain
- A fact's candidate key must match its declared grain.
- A dimension's lookup key must be unique for the exact join predicate.
- Never assume a hashed surrogate key makes nonunique source rows unique.
- Use a documented unknown-member convention and test it.

## Change management
Before renaming a model or column, review downstream `ref()` calls, tests, exposures, dashboards, grants, and consumer queries. Prefer a planned migration over cosmetic renaming.
