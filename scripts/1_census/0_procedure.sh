
mkdir ./data/MA
mkdir ./data/MA/census_tract_data
mkdir ./data/MA/census_tract_data/zipped_files
mkdir ./data/MA/census_tract_data/data_files

scripts/1_census/1_download.sh
scripts/1_census/2_process_files.sh
duckdb ./data/data.duckdb < scripts/1_census/3_create_crosswalk.sql


