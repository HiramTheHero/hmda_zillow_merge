mkdir ./data
duckdb -c "" ./data/data.duckdb

echo "Doing Census Procedure"
scripts/1_census/0_procedure.sh
echo "Census Procedure - DONE"

echo "Doing HMDA Procedure"
scripts/2_hmda/0_procedure.sh
echo "HMDA Procedure - DONE"

echo "Merging Census and HMDA Data"
scripts/3_census_hmda/0_procedure.sh
echo "Census and HMDA Merge - DONE"

echo "BEFORE DOING ZILLOW PROCEDURE, MAKE SURE TO FOLLOW INSTRUCTIONS IN: scripts/4_zillow/1_unzip.sh"