mkdir data/MA/merged_data

duckdb -s "COPY hmda_zillow_1994_2003 TO 'data/MA/merged_data/hmda_zillow_1994_2003.csv' (HEADER, DELIMITER ',|');" data/data.duckdb
duckdb -s "COPY hmda_zillow_2004_2013 TO 'data/MA/merged_data/hmda_zillow_2004_2013.csv' (HEADER, DELIMITER ',|');" data/data.duckdb
duckdb -s "COPY hmda_zillow_2014_2016 TO 'data/MA/merged_data/hmda_zillow_2014_2016.csv' (HEADER, DELIMITER ',|');" data/data.duckdb
duckdb -s "COPY hmda_zillow_2017 TO 'data/MA/merged_data/hmda_zillow_2017.csv' (HEADER, DELIMITER ',|');" data/data.duckdb
duckdb -s "COPY hmda_zillow_2018_2020 TO 'data/MA/merged_data/hmda_zillow_2018_2020.csv' (HEADER, DELIMITER ',|');" data/data.duckdb
