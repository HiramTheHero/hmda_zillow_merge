create or replace table census_data_1990_2000 as
select 
column0 || column1 || column2 as census_code_1990,
column5 || column6 || column7 as census_code_2000
from 'data/MA/census_tract_data/data_files/1990_2000.csv';

create or replace table census_data_1990_2000 as
select distinct on (census_code_1990, census_code_2000) * from census_data_1990_2000;


create or replace table census_data_2000_2010 as
select
STATE_2000 || COUNTY_2000 || TRACT_2000 as census_code_2000,
STATE_2010 || COUNTY_2010 || TRACT_2010 as census_code_2010
from 'data/MA/census_tract_data/data_files/2000_2010.csv';

create or replace table census_data_2000_2010 as
select distinct on (census_code_2000, census_code_2010) * from census_data_2000_2010;

create or replace table census_crosswalk_1990_2010 as
select
*
from
census_data_1990_2000
join
census_data_2000_2010 using (census_code_2000);

drop table census_data_1990_2000;
drop table census_data_2000_2010;