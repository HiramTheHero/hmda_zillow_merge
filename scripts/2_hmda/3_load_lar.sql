create or replace table lar_1994_2003 as
select 
array_slice(line, 1,4) as activity_year,
array_slice(line, 5,14) as lei_or_respondent_id,
array_slice(line, 15,15) as agency_code,
array_slice(line, 16,16) as loan_type,
array_slice(line, 17,17) as loan_purpose,
array_slice(line, 18,18) as occupancy_type,
array_slice(line, 19,23) as loan_amount_000s,
array_slice(line, 24,24) as action_taken,
array_slice(line, 25,28) as msa_md_of_property,
array_slice(line, 29,30) as state_code,
array_slice(line, 31,33) as county_code,
array_slice(line, 34,40) as census_tract_number,
array_slice(line, 41,41) as applicant_race_1,
array_slice(line, 42,42) as co_applicant_race_1,
array_slice(line, 43,43) as applicant_sex,
array_slice(line, 44,44) as co_applicant_sex,
array_slice(line, 45,48) as applicant_income_000s,
array_slice(line, 49,49) as purchaser_type,
array_slice(line, 50,50) as denial_reason_1,
array_slice(line, 51,51) as denial_reason_2,
array_slice(line, 52,52) as denial_reason_3,
array_slice(line, 53,53) as edit_status,
array_slice(line, 54,60) as sequence_number
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

create or replace table lar_2004_2013 as
select
array_slice(line, 1, 4) as activity_year,
array_slice(line, 5, 14) as lei_or_respondent_id,
array_slice(line, 15, 15) as agency_code,
array_slice(line, 16, 16) as loan_type,
array_slice(line, 17, 17) as loan_purpose,
array_slice(line, 18, 18) as occupancy_type,
array_slice(line, 19, 23) as loan_amount_000s,
array_slice(line, 24, 24) as action_taken,
array_slice(line, 25, 29) as msa_md_of_property,
array_slice(line, 30, 31) as state_code,
array_slice(line, 32, 34) as county_code,
array_slice(line, 35, 41) as census_tract_number,
array_slice(line, 42, 42) as applicant_sex,
array_slice(line, 43, 43) as co_applicant_sex,
array_slice(line, 44, 47) as applicant_income_000s,
array_slice(line, 48, 48) as purchaser_type,
array_slice(line, 49, 49) as denial_reason_1,
array_slice(line, 50, 50) as denial_reason_2,
array_slice(line, 51, 51) as denial_reason_3,
array_slice(line, 52, 52) as edit_status,
array_slice(line, 53, 53) as property_type,
array_slice(line, 54, 54) as preapproval,
array_slice(line, 55, 55) as applicant_ethnicity_1,
array_slice(line, 56, 56) as co_applicant_ethnicity_1,
array_slice(line, 57, 57) as applicant_race_1,
array_slice(line, 58, 58) as applicant_race_2,
array_slice(line, 59, 59) as applicant_race_3,
array_slice(line, 60, 60) as applicant_race_4,
array_slice(line, 61, 61) as applicant_race_5,
array_slice(line, 62, 62) as co_applicant_race_1,
array_slice(line, 63, 63) as co_applicant_race_2,
array_slice(line, 64, 64) as co_applicant_race_3,
array_slice(line, 65, 65) as co_applicant_race_4,
array_slice(line, 66, 66) as co_applicant_race_5,
array_slice(line, 67, 67) as rate_spread,
array_slice(line, 72, 72) as hoepa_status,
array_slice(line, 73, 73) as lien_status,
array_slice(line, 74, 80) as sequence_number
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


create or replace table lar_2014_2016 as
select 
column00 as activity_year,
column01 as lei_or_respondent_id,
column02 as agency_code,
column03 as loan_type,
column04 as property_type,
column05 as loan_purpose,
column06 as occupancy_type,
column07 as loan_amount_000s,
column08 as preapproval,
column09 as action_taken,
column10 as msa_md_of_property,
column11 as state_code,
column12 as county_code,
column13 as census_tract_number,
column14 as applicant_ethnicity_1,
column15 as co_applicant_ethnicity_1,
column16 as applicant_race_1,
column17 as applicant_race_2,
column18 as applicant_race_3,
column19 as applicant_race_4,
column20 as applicant_race_5,
column21 as co_applicant_race_1,
column22 as co_applicant_race_2,
column23 as co_applicant_race_3,
column24 as co_applicant_race_4,
column25 as co_applicant_race_5,
column26 as applicant_sex,
column27 as co_applicant_sex,
column28 as applicant_income_000s,
column29 as purchaser_type,
column30 as denial_reason_1,
column31 as denial_reason_2,
column32 as denial_reason_3,
column33 as rate_spread,
column34 as hoepa_status,
column35 as lien_status,
column36 as edit_status,
column37 as sequence_number,
column38 as tract_population,
column39 as tract_minority_population_percent,
column40 as ffiec_msa_md_median_family_income,
column41 as tract_to_msamd_income_percentage,
column42 as tract_owner_occupied_units,
column43 as tract_one_to_four_family_homes,
column44 as application_date_indicator
from
read_csv_auto([
  'data/hmda_data/lar_data/lar_2014.csv',
  'data/hmda_data/lar_data/lar_2015.csv',
  'data/hmda_data/lar_data/lar_2016.csv',
  ], sample_size=50000);

create or replace table lar_2017 as
select
column00 as record_id,
column01 as lei_or_respondent_id,
column02 as agency_code,
column03 as loan_type,
column04 as property_type,
column05 as loan_purpose,
column06 as occupancy_type,
column07 as loan_amount_000s,
column08 as preapproval,
column09 as action_taken,
column10 as msa_md_of_property,
column11 as state_code,
column12 as county_code,
column13 as census_tract_number,
column14 as applicant_ethnicity_1,
column15 as co_applicant_ethnicity_1,
column16 as applicant_race_1,
column17 as applicant_race_2,
column18 as applicant_race_3,
column19 as applicant_race_4,
column20 as applicant_race_5,
column21 as co_applicant_race_1,
column22 as co_applicant_race_2,
column23 as co_applicant_race_3,
column24 as co_applicant_race_4,
column25 as co_applicant_race_5,
column26 as applicant_sex,
column27 as co_applicant_sex,
column28 as applicant_income_000s,
column29 as purchaser_type,
column30 as denial_reason_1,
column31 as denial_reason_2,
column32 as denial_reason_3,
column33 as rate_spread,
column34 as hoepa_status,
column35 as lien_status,
column36 as tract_population,
column37 as tract_minority_population_percent,
column38 as ffiec_msa_md_median_family_income,
column39 as tract_to_msamd_income_percentage,
column40 as tract_owner_occupied_units,
column41 as tract_one_to_four_family_homes
from
'data/hmda_data/lar_data/lar_2017.csv';

ALTER TABLE lar_2017 ADD COLUMN activity_year INTEGER;
UPDATE lar_2017 SET activity_year=2017;
UPDATE lar_2017 SET lei_or_respondent_id = lpad(lei_or_respondent_id, 10, '0');

create or replace table lar_2018_2020 as
select
*
from
read_csv_auto([
  'data/hmda_data/lar_data/lar_2018.csv',
  'data/hmda_data/lar_data/lar_2019.csv',
  'data/hmda_data/lar_data/lar_2020.csv'
], sample_size=50000);

ALTER TABLE lar_2018_2020 RENAME lei TO lei_or_respondent_id;

