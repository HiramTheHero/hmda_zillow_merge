-- LAR Data Headers Can be Found in the Following Places:
-- 1994 to 2003: https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/233.1-24ADL.pdf
-- 2004 to 2013: https://s3.amazonaws.com/NARAprodstorage/lz/electronic-records/rg-082/hmda/ULAR0708/Public_LARs_-_2004_Forward.final.6.14.2007_layout.pdf
-- 2014 - 2016: https://www.ffiec.gov/hmdarawdata/FORMATS/2015HMDALARRecordFormat.pdf
-- 2017: https://github.com/cfpb/hmda-platform/blob/master/docs/v1/2017_Modified_LAR_Header.csv
-- 2018 - 2019: https://ffiec.cfpb.gov/documentation/2019/modified-lar-header/
-- 2020: https://ffiec.cfpb.gov/documentation/2020/modified-lar-header/

-- LAR Data Dictionaries can be found:
-- https://www.ffiec.gov/hmda/forms.htm
-- 2018 onward - https://ffiec.cfpb.gov/documentation/2019/lar-data-fields/

/*
Needed Columns for Merge:
lei_or_respondent_id,
activity_year,
state_code || county_code || census_tract_number as census_tract,
loan_amount_000s
*/

-- This is where you select your LAR variables.

create or replace table lar_1994_2003 as
select 
cast(array_slice(line, 1,4) as int) as activity_year,
array_slice(line, 5,14) as lei_or_respondent_id,
array_slice(line, 16,16) as loan_type,
array_slice(line, 24,24) as action_taken,
try_cast(replace(array_slice(line, 19,23), ' ', '') as int) * 1000 as loan_amount,
replace(array_slice(line, 29,30) || array_slice(line, 31,33) || replace(array_slice(line, 34,40), '.',''), ' ','' ) as census_tract,
from
(select column0 as line from read_csv([
    'data/hmda_data/lar_data/lar_1994.txt',
    'data/hmda_data/lar_data/lar_1995.txt',
    'data/hmda_data/lar_data/lar_1996.txt',
    'data/hmda_data/lar_data/lar_1997.txt',
    'data/hmda_data/lar_data/lar_1998.txt',
    'data/hmda_data/lar_data/lar_1999.txt',
    'data/hmda_data/lar_data/lar_2000.txt',
    'data/hmda_data/lar_data/lar_2001.txt',
    'data/hmda_data/lar_data/lar_2002.txt',
    'data/hmda_data/lar_data/lar_2003.txt'
    ], AUTO_DETECT=TRUE));

-- Only have loans that originated.
delete from lar_1994_2003 where not action_taken = '1';

-- Only have properly formatted census tracts.
DELETE FROM lar_1994_2003 WHERE NOT regexp_matches(census_tract, '[\d]{11}');
delete from lar_1994_2003 where loan_amount is null;

create or replace table lar_2004_2013 as
select
cast(array_slice(line, 1,4) as int) as activity_year,
array_slice(line, 5,14) as lei_or_respondent_id,
array_slice(line, 16,16) as loan_type,
array_slice(line, 24,24) as action_taken,
try_cast(replace(array_slice(line, 19,23), ' ', '') as int) * 1000 as loan_amount,
replace(array_slice(line, 30,31) || array_slice(line, 32,34) || replace(array_slice(line, 35,41), '.',''), ' ','' ) as census_tract,
from
(select column0 as line from read_csv([
    'data/hmda_data/lar_data/lar_2004.txt',
    'data/hmda_data/lar_data/lar_2005.txt',
    'data/hmda_data/lar_data/lar_2006.txt',
    'data/hmda_data/lar_data/lar_2007.txt',
    'data/hmda_data/lar_data/lar_2008.txt',
    'data/hmda_data/lar_data/lar_2009.txt',
    'data/hmda_data/lar_data/lar_2010.txt',
    'data/hmda_data/lar_data/lar_2011.txt',
    'data/hmda_data/lar_data/lar_2012.txt',
    'data/hmda_data/lar_data/lar_2013.txt'
    ], AUTO_DETECT=TRUE));

-- Only have loans that originated
delete from lar_2004_2013 where not action_taken = '1';

-- Only have properly formatted census tracts.
DELETE FROM lar_2004_2013 WHERE NOT regexp_matches(census_tract, '[\d]{11}');
delete from lar_2004_2013 where loan_amount is null;

create or replace table lar_2014_2016 as
select 
column00 as activity_year,
column01 as lei_or_respondent_id,
column03 as loan_type,
column09 as action_taken,
try_cast(replace(column07, ' ', '') as int) * 1000 as loan_amount,
replace(column11 || column12 || replace(column13, '.',''), ' ','' ) as census_tract,
from
read_csv_auto([
  'data/hmda_data/lar_data/lar_2014.csv',
  'data/hmda_data/lar_data/lar_2015.csv',
  'data/hmda_data/lar_data/lar_2016.csv',
  ], sample_size=50000);

-- Only have loans that originated
delete from lar_2014_2016 where not action_taken = '1';

-- Only have properly formatted census tracts.
DELETE FROM lar_2014_2016 WHERE NOT regexp_matches(census_tract, '[\d]{11}');
delete from lar_2014_2016 where loan_amount is null;

create or replace table lar_2017 as
select
lpad(column01, 10, '0') as lei_or_respondent_id,
column03 as loan_type,
column09 as action_taken,
try_cast(replace(column07, ' ', '') as int) * 1000 as loan_amount,
replace(column11 || column12 || replace(column13, '.',''), ' ','' ) as census_tract,
from
'data/hmda_data/lar_data/lar_2017.csv';

-- Only have loans that originated
delete from lar_2017 where not action_taken = '1';

ALTER TABLE lar_2017 ADD COLUMN activity_year INTEGER;
UPDATE lar_2017 SET activity_year=2017;

-- Only have properly formatted census tracts.
DELETE FROM lar_2017 WHERE NOT regexp_matches(census_tract, '[\d]{11}');
delete from lar_2017 where loan_amount is null;

create or replace table lar_2018_2020 as
select
activity_year,
lei as lei_or_respondent_id,
loan_type,
action_taken,
loan_amount,
census_tract,
from
read_csv_auto([
  'data/hmda_data/lar_data/lar_2018.csv',
  'data/hmda_data/lar_data/lar_2019.csv',
  'data/hmda_data/lar_data/lar_2020.csv'
], sample_size=50000);

-- Only have loans that originated
delete from lar_2018_2020 where not action_taken = 1;

-- Only have properly formatted census tracts.
DELETE FROM lar_2018_2020 WHERE NOT regexp_matches(census_tract, '[\d]{11}');
delete from lar_2018_2020 where loan_amount is null;
