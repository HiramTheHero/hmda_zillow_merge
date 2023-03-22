# Example shows MA
# To change to another state:
# Find "/MA/" replace with "/CO/"


# Server located at https://www2.census.gov/

# Unzip all downloaded zip files.
unzip -d ./data/MA/census_tract_data/data_files './data/MA/census_tract_data/zipped_files/*.zip'

# Move unzipped Files to new location.
#
mv ./data/MA/census_tract_data/zipped_files/*.txt ./data/MA/census_tract_data/data_files
cp ./data/MA/census_tract_data/data_files/1990_2000.txt ./data/MA/census_tract_data/data_files/1990_2000.csv 
cp ./data/MA/census_tract_data/data_files/1990_2000.txt ./data/MA/census_tract_data/zipped_files/1990_2000.txt
rm ./data/MA/census_tract_data/data_files/1990_2000.txt

# Rename Files
mv ./data/MA/census_tract_data/data_files/TAB2000_TAB2010_ST_25_v2.txt ./data/MA/census_tract_data/data_files/2000_2010.csv
mv ./data/MA/census_tract_data/data_files/tab2010_tab2020_st25_ma.txt ./data/MA/census_tract_data/data_files/2010_2020.csv


