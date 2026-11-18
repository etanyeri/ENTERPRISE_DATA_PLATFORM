# Data Engineering Standards

## Status
**Recommended engineering policy for this portfolio project.** Some standards are demonstrated by repository files; others are future enhancements and should not be represented as deployed controls.

## 1. Layering and ownership
- **Ingest:** preserve source meaning and identifiers; document extraction assumptions.
- **Transform:** standardize types, nulls, dates, deduplication rules, and business calculations.
- **Mart:** publish facts/dimensions with explicit grain and business definitions.
- Reuse shared logic through dbt macros only when doing so improves clarity.

## 2. SQL conventions
- Use explicit column selections in curated models rather than unrestricted `SELECT *`.
- Name CTEs for their business purpose; keep transformations readable.
- Qualify ambiguous columns and make join predicates explicit.
- Explain non-obvious calculations, filtering rules, and deduplication precedence.
- Avoid mixing source cleanup with final metric calculations when separation is practical.

## 3. Modeling contracts
Each curated model should document:
1. Business purpose and owner (if applicable).
2. One-sentence row grain.
3. Candidate/primary key and null handling.
4. Join keys and expected cardinality.
5. Measures and aggregation behavior.
6. Late-arriving or missing reference handling.

## 4. Change review checklist
- Does the model preserve its declared grain?
- Could a join multiply rows or amounts?
- Are existing consumers or dbt `ref()` calls affected?
- Are schema tests and business reconciliation checks updated?
- Can the change be rolled back or reproduced?

## 5. Performance and incremental processing
Where applicable, evaluate incremental materialization, unique keys, update/merge behavior, pruning, and Snowflake query cost. Record the decision and a measured benchmark rather than claiming a performance gain without evidence.

## 6. Security
Define Snowflake privileges through least-privilege roles, avoid secrets in version control, and review Terraform plans before applying. The presence of `snowflake_roles.tf` demonstrates infrastructure definitions, not proof that grants were deployed.

## 7. CI/CD — proposed
For a future pull-request workflow: parse/compile dbt, run applicable tests against a safe target, check formatting, and require review before merge. Document the actual workflow only after it exists.

## 8. Documentation maintenance
Update model descriptions, ERDs, and quality checks whenever business grain, join logic, or metrics change.
