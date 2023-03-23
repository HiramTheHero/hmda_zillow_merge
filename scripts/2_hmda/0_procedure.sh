mkdir ./data/hmda_data
mkdir ./data/hmda_data/lar_zipped
mkdir ./data/hmda_data/lar_data
mkdir ./data/hmda_data/panel_zipped
mkdir ./data/hmda_data/panel_data

scripts/2_hmda/1_download.sh
scripts/2_hmda/2_process_files.sh

duckdb ./data/data.duckdb < scripts/2_hmda/3_load_lar.sql
duckdb ./data/data.duckdb < scripts/2_hmda/3.1_subset_lar_to_state.sql

duckdb ./data/data.duckdb < scripts/2_hmda/4_load_panel.sql



