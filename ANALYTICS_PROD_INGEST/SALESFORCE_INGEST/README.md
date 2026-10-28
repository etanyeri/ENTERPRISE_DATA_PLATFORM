# Salesforce Ingestion Schema

This schema represents the ingestion layer for
Salesforce-style CRM data within the enterprise
analytics platform.

## Source Tables
- ACCOUNT
- CONTACT
- OPPORTUNITY
- USER
- CONTRACT

## Purpose
- Load records from synthetic Salesforce source data.
- Track ingestion timestamps and source metadata.
- Support incremental ingestion and change tracking.
- Prepare source data for downstream dbt transformations.

All data is synthetic. No proprietary company
data or credentials are included.
