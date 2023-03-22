# Example shows MA
# To change to another state:
# Find "/MA/" replace with "/CO/"
# Manually navigate the Census Website to find specific state.

# Server located at https://www2.census.gov/

# Tabulation Block to Tabulation Block downloads.

# MA
# 1990 - 2000
wget -rnd ftp://ftp2.census.gov/geo/relfiles/t9t2/st25_massachusetts/ -O ./data/MA/census_tract_data/zipped_files/1990_2000.txt

# 2000 - 2010
wget ftp://ftp2.census.gov/geo/docs/maps-data/data/rel/t00t10/TAB2000_TAB2010_ST_25_v2.zip -P ./data/MA/census_tract_data/zipped_files

# 2010 - 2020
wget ftp://ftp2.census.gov/geo/docs/maps-data/data/rel2020/t10t20/TAB2010_TAB2020_ST25.zip -P ./data/MA/census_tract_data/zipped_files
