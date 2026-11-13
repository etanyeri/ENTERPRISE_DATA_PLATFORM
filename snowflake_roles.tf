provider "snowflake" {
  account  = "snowflake_account"
  username = "snowflake_user"
  password = "snowflake_password"
  role     = "ACCOUNTADMIN"  
  region   = "us-west-2"
}

# Create roles for each schema
resource "snowflake_role" "fetch_raw_role" {
  name = "FETCH_RAW_ROLE"
}

resource "snowflake_role" "fetch_ingest_role" {
  name = "FETCH_INGEST_ROLE"
}

resource "snowflake_role" "fetch_mart_role" {
  name = "FETCH_MART_ROLE"
}



# Create a SALES_TEAM role
resource "snowflake_role" "sales_team_role" {
  name = "SALES_TEAM"
}


# Grant MART SCHEMA roles to the SALES_TEAM role

resource "snowflake_role_grant" "grant_fetch_mart_role_to_sales_team" {
  role_name = snowflake_role.sales_team_role.name
  granted_role = snowflake_role.fetch_mart_role.name
}



# Grant usage and full access on the schemas to the respective roles
resource "snowflake_schema_grant" "fetch_raw_grant" {
  schema_name = snowflake_schema.fetch_raw_schema.name
  role_name   = snowflake_role.fetch_raw_role.name
  privilege   = "USAGE"
}

resource "snowflake_schema_grant" "fetch_ingest_grant" {
  schema_name = snowflake_schema.fetch_ingest_schema.name
  role_name   = snowflake_role.fetch_ingest_role.name
  privilege   = "USAGE"
}

resource "snowflake_schema_grant" "fetch_mart_grant" {
  schema_name = snowflake_schema.fetch_mart_schema.name
  role_name   = snowflake_role.fetch_mart_role.name
  privilege   = "USAGE"
}


# Create schemas

resource "snowflake_schema" "fetch_mart_schema" {
  name      = "FETCH_MART_SCHEMA"
  database  = "FETCH_PROD_ANALYTICS"  
  schema    = "FETCH_MART_SCHEMA"
}
