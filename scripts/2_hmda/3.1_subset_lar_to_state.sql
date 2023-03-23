
create or replace table ma_1994_2003 as
select * from lar_1994_2003 where left(census_tract,2) = '25';

create or replace table ma_2004_2013 as
select * from lar_2004_2013 where left(census_tract,2) = '25';

create or replace table ma_2014_2016 as
select * from lar_2014_2016 where left(census_tract,2) = '25';

create or replace table ma_2017 as
select * from lar_2017 where left(census_tract,2) = '25';

create or replace table ma_2018_2020 as
select * from lar_2018_2020 where left(census_tract,2) = '25';

