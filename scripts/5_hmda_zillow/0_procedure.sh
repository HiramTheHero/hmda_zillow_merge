duckdb ./data/data.duckdb < scripts/5_hmda_zillow/1.1_preprocessing_lendername_zillow.sql
duckdb ./data/data.duckdb < scripts/5_hmda_zillow/1.2_preprocessing_lendername_hmda_1994_2013.sql
duckdb ./data/data.duckdb < scripts/5_hmda_zillow/1.3_preprocessing_lendername_hmda_2014_2020.sql
duckdb ./data/data.duckdb < scripts/5_hmda_zillow/2_zillow_hmda_merge.sql
