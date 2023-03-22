create or replace table panel_1994_2003 as
select 
array_slice(line, 1, 10) as lei_or_respondent_id,
array_slice(line, 11, 14) as msa_number,
array_slice(line, 15, 15) as agency_code,
array_slice(line, 16, 17) as agency_group_code,
array_slice(line, 18, 47) as respondent_name,
array_slice(line, 48, 72) as respondent_city,
array_slice(line, 73, 74) as respondent_state,
array_slice(line, 75, 76) as respondant_fips_state_number,
array_slice(line, 77, 86) as assets,
array_slice(line, 87, 87) as other_lender_code,
array_slice(line, 88, 97) as parent_id,
array_slice(line, 98, 127) as parent_name,
array_slice(line, 128, 152) as parent_city,
array_slice(line, 153, 154) as parent_state,
array_slice(line, 155, 158) as activity_year
from
(select column0 as line from read_csv([
    'data/hmda_data/panel_data/panel_1994.txt',
    'data/hmda_data/panel_data/panel_1995.txt',
    'data/hmda_data/panel_data/panel_1996.txt',
    'data/hmda_data/panel_data/panel_1997.txt',
    'data/hmda_data/panel_data/panel_1998.txt',
    'data/hmda_data/panel_data/panel_1999.txt',
    'data/hmda_data/panel_data/panel_2000.txt',
    'data/hmda_data/panel_data/panel_2001.txt',
    'data/hmda_data/panel_data/panel_2002.txt',
    'data/hmda_data/panel_data/panel_2003.txt'
    ], AUTO_DETECT=TRUE));

create or replace table panel_2004_2013 as
select
array_slice(line, 1, 10) as lei_or_respondent_id,
array_slice(line, 11, 5) as msa_number,
array_slice(line, 16, 1) as agency_code,
array_slice(line, 17, 2) as agency_group_code,
array_slice(line, 19, 30) as respondent_name,
array_slice(line, 49, 25) as respondent_city,
array_slice(line, 74, 2) as respondent_state,
array_slice(line, 76, 2) as respondant_fips_state_number,
array_slice(line, 78, 10) as assets,
array_slice(line, 88, 1) as other_lender_code,
array_slice(line, 89, 10) as parent_id,
array_slice(line, 99, 30) as parent_name,
array_slice(line, 129, 25) as parent_city,
array_slice(line, 154, 2) as parent_state,
array_slice(line, 156, 4) as activity_year,
array_slice(line, 160, 10) as respondent_rssd
from
(select column0 as line from read_csv([
    'data/hmda_data/panel_data/panel_2004.txt',
    'data/hmda_data/panel_data/panel_2005.txt',
    'data/hmda_data/panel_data/panel_2006.txt',
    'data/hmda_data/panel_data/panel_2007.txt',
    'data/hmda_data/panel_data/panel_2008.txt',
    'data/hmda_data/panel_data/panel_2009.txt',
    'data/hmda_data/panel_data/panel_2010.txt',
    'data/hmda_data/panel_data/panel_2011.txt',
    'data/hmda_data/panel_data/panel_2012.txt',
    'data/hmda_data/panel_data/panel_2013.txt'
    ], delim='|', AUTO_DETECT=TRUE));

create or replace table panel_2014_2016 as
select 
array_slice(line,1, 4) as activity_year_panel,
array_slice(line,5, 14) as lei_or_respondent_id_panel,
array_slice(line,15, 15) as agency_code,
array_slice(line,16, 25) as parent_id,
array_slice(line,26, 55) as parent_name,
array_slice(line,56, 80) as parent_city,
array_slice(line,81, 82) as parent_state,
array_slice(line,83, 84) as region,
array_slice(line,85, 94) as assets,
array_slice(line,95, 95) as other_lender_code,
array_slice(line,96, 125) as respondent_name,
array_slice(line,126, 165) as filler_1,
array_slice(line,166, 190) as respondent_city,
array_slice(line,191, 192) as respondent_state,
array_slice(line,193, 202) as filler_2,
array_slice(line,203, 212) as filler_3,
array_slice(line,213, 222) as top_holder_rssd,
array_slice(line,223, 252) as top_holder_name,
array_slice(line,253, 277) as top_holder_city,
array_slice(line,278, 279) as top_holder_state,
array_slice(line,280, 319) as top_holder_country,
array_slice(line,320, 329) as respondent_rssd,
array_slice(line,330, 339) as parent_rssd,
array_slice(line,340, 341) as respondant_fips_state_number
from
(select column0 as line from read_csv([
  'data/hmda_data/panel_data/panel_2014.txt',
  'data/hmda_data/panel_data/panel_2015.txt',
  'data/hmda_data/panel_data/panel_2016.txt',
], delim='|', AUTO_DETECT=TRUE));

create or replace table panel_2017 as
select
column00 as activity_year,
column01 as lei_or_respondent_id,
column02 as agency_code,
column03 as parent_id,
column04 as parent_name,
column05 as parent_city,
column06 as parent_state,
column07 as region,
column08 as assets,
column09 as other_lender_code,
column10 as respondent_name,
column11 as respondent_city,
column12 as respondent_state,
column13 as top_holder_rssd,
column14 as top_holder_name,
column15 as top_holder_city,
column16 as top_holder_state,
column17 as top_holder_country,
column18 as respondent_rssd,
column19 as parent_rssd,
column20 as respondant_fips_state_number
from 'data/hmda_data/panel_data/panel_2017.csv';

create or replace table panel_2018_2020 as
select
activity_year,
lei as lei_or_respondent_id,
tax_id,
agency_code,
id_2017,
respondent_rssd,
respondent_name,
respondent_state,
respondent_city,
assets,
other_lender_code,
parent_rssd,
parent_name,
topholder_rssd,
topholder_name
from read_csv_auto([
  'data/hmda_data/panel_data/panel_2018.csv',
  'data/hmda_data/panel_data/panel_2019.csv'
])
union
select
*
from 'data/hmda_data/panel_data/panel_2020.csv';
