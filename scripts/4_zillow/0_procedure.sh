scripts/4_zillow/1_unzip.sh

duckdb ./data/data.duckdb < scripts/4_zillow/2_load_and_merge_zillow.sql
