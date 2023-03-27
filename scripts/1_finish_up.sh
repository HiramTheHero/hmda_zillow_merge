mkdir ./data
duckdb -c "" ./data/data.duckdb

echo "Doing Zillow Procedure"
scripts/4_zillow/0_procedure.sh
echo "Census Procedure - DONE"

echo "Merging Zillow and HMDA Data"
scripts/5_hmda_zillow/0_procedure.sh
echo "Zillow and HMDA Merge - DONE"

echo "Exporting Data"
scripts/6_data_export/0_procedure.sh
echo "Exporting Data - DONE"

echo "Merging Procedure Finished - Congradulations!"
echo "Merged Items are located within: data/MA/merged_data"