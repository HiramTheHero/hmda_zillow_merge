
create or replace table asmt_main as 
select 
trim(column00) as rowid,
upper(trim(column26)) as propertyfullstreetaddress,
upper(trim(column78)) as propertyunitnumber,
upper(trim(column27)) as propertycity,
upper(trim(column29)) as propertyzip
from read_csv_auto('data/MA/zillow_data/data_files/Asmt_Main.csv', all_varchar=1);

create or replace table asmt_main as 
select distinct on (rowid) * from asmt_main;

create or replace table asmt_value as 
select 
trim(column00) as rowid,
try_cast(trim(column03) as double) as totalassessedvalue,
try_cast(trim(column04) as int) as assessmentyear
from 
read_csv_auto('data/MA/zillow_data/data_files/Asmt_Value.csv');

create or replace table asmt_value as 
select distinct on (rowid) * from asmt_value;

create or replace table asmt_all as
select 
*
from
asmt_main
join
asmt_value
using (rowid);

create or replace table trans_propertyinfo as
select 
trim(column00) as transid,
upper(trim(column15)) as propertyfullstreetaddress,
upper(trim(column49)) as propertyunitnumber,
upper(trim(column16)) as propertycity,
upper(trim(column18)) as propertyzip,
upper(trim(column54)) as propertyaddresscensustractandblock
from read_csv_auto('data/MA/zillow_data/data_files/Trans_PropertyInfo.csv');

create or replace table trans_propertyinfo as 
select distinct on (transid) * from trans_propertyinfo;

create or replace table trans_main as
select 
upper(trim(column000)) as transid,
upper(trim(column006)) as recordingdate,
upper(trim(column037)) as lendername,
try_cast(trim(column059) as int) as loanamount
from
read_csv_auto('data/MA/zillow_data/data_files/Trans_Main.csv');

create or replace table trans_main as 
select distinct on (transid) * from trans_main;

create or replace table trans_all as
select 
*
from
trans_main
join
trans_propertyinfo
using (transid);

ALTER TABLE trans_all ADD COLUMN recordingyear int;
update trans_all set recordingyear = left(recordingdate, 4);

-- Format Tables for Merge

update trans_all set propertyfullstreetaddress = null where propertyfullstreetaddress = chr(0);
update trans_all set propertyaddresscensustractandblock = null where propertyaddresscensustractandblock = chr(0);
update trans_all set propertyunitnumber = null where propertyunitnumber = chr(0);
update trans_all set propertyunitnumber = null where propertyunitnumber = '';
update trans_all set propertycity = null where propertycity = chr(0);
update trans_all set propertyzip = null where propertyzip = chr(0);
update trans_all set recordingdate = null where recordingdate = chr(0);
update trans_all set recordingyear = null where recordingyear = chr(0);
update trans_all set lendername = null where lendername = chr(0);

update asmt_all set propertyfullstreetaddress = null where propertyfullstreetaddress = chr(0);
update asmt_all set propertyunitnumber = null where propertyunitnumber = chr(0);
update asmt_all set propertyunitnumber = null where propertyunitnumber = '';
update asmt_all set propertycity = null where propertycity = chr(0);
update asmt_all set propertyzip = null where propertyzip = chr(0);

update asmt_all set propertyunitnumber = 'n/a' where propertyunitnumber is null;
update trans_all set propertyunitnumber = 'n/a' where propertyunitnumber is null;


create or replace table zillow_all as
select
*
from
trans_all
join
asmt_all
on
asmt_all.propertyfullstreetaddress = trans_all.propertyfullstreetaddress
and
asmt_all.propertycity = trans_all.propertycity
and 
asmt_all.propertyzip = trans_all.propertyzip
and
asmt_all.assessmentyear = trans_all.recordingyear
and
asmt_all.propertyunitnumber = trans_all.propertyunitnumber;

create or replace table zillow_all as 
select distinct on (transid) * from zillow_all;

alter table zillow_all drop "propertyzip:1";
alter table zillow_all drop "propertycity:1";
alter table zillow_all drop "propertyfullstreetaddress:1";
alter table zillow_all drop "propertyunitnumber:1";
alter table zillow_all drop rowid;
alter table zillow_all drop transid;

