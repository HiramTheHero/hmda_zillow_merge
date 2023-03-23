/*
Needed Columns for Merge:
lei_or_respondent_id,
respondent_name,
activity_year,
*/

-- This is where you select your Panel variables.

create or replace table panel_1994_2003 as
select 
array_slice(line, 1, 10) as lei_or_respondent_id,
trim(array_slice(line, 18, 47)) as lender_name,
array_slice(line, 155, 158) as activity_year,
try_cast(array_slice(line, 77, 86) as int) as assets,
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

create or replace table panel_1994_2003 as
select distinct on (lei_or_respondent_id, activity_year) * from panel_1994_2003;

create or replace table panel_2004_2013 as
select
array_slice(line, 1, 10) as lei_or_respondent_id,
trim(array_slice(line, 19, 48)) as lender_name,
try_cast(array_slice(line, 156, 159) as int) as activity_year,
try_cast(array_slice(line, 78, 87) as int) as assets,
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

create or replace table panel_2004_2013 as
select distinct on (lei_or_respondent_id, activity_year) * from panel_2004_2013;

create or replace table panel_2014_2016 as
select 
array_slice(line,5, 14) as lei_or_respondent_id,
trim(array_slice(line,96, 125)) as lender_name,
try_cast(array_slice(line,1, 4) as int) as activity_year,
try_cast(array_slice(line,85, 94) as int) as assets,
from
(select column0 as line from read_csv([
  'data/hmda_data/panel_data/panel_2014.txt',
  'data/hmda_data/panel_data/panel_2015.txt',
  'data/hmda_data/panel_data/panel_2016.txt',
], delim='|', AUTO_DETECT=TRUE));

create or replace table panel_2014_2016 as
select distinct on (lei_or_respondent_id, activity_year) * from panel_2014_2016;

create or replace table panel_2017 as
select
column01 as lei_or_respondent_id,
upper(trim(column10)) as lender_name,
column00 as activity_year,
column08 as assets,
from 'data/hmda_data/panel_data/panel_2017.csv';

create or replace table panel_2017 as
select distinct on (lei_or_respondent_id, activity_year) * from panel_2017;

create or replace table panel_2018_2020 as
select
activity_year,
lei as lei_or_respondent_id,
upper(trim(respondent_name)) as lender_name,
assets,
from read_csv_auto([
  'data/hmda_data/panel_data/panel_2018.csv',
  'data/hmda_data/panel_data/panel_2019.csv'
])
union all
select
activity_year,
lei as lei_or_respondent_id,
upper(trim(respondent_name)) as lender_name,
assets,
from 'data/hmda_data/panel_data/panel_2020.csv';
