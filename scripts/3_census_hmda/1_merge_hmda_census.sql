create or replace table hmda_1994_2003
as
select
*
from 
hmda_1994_2003
join
census_crosswalk_1990_2010
on hmda_1994_2003.census_tract = census_crosswalk_1990_2010.census_code_1990;

-- 2004 starts to use 2000 census.
-- 2013 starts to use 2010 census.

create table cen_hmda_2004_2012 as
select
*
from 
hmda_2004_2013
join
census_crosswalk_1990_2010
on hmda_2004_2013.census_tract = census_crosswalk_1990_2010.census_code_2000
where activity_year < 2013;

alter table hmda_1994_2003 drop census_code_1990;
alter table hmda_1994_2003 drop census_code_2000;
alter table hmda_1994_2003 drop census_tract;
ALTER TABLE hmda_1994_2003 RENAME census_code_2010 TO census_tract;

alter table cen_hmda_2004_2012 drop census_code_1990;
alter table cen_hmda_2004_2012 drop census_code_2000;
alter table cen_hmda_2004_2012 drop census_tract;
ALTER TABLE cen_hmda_2004_2012 RENAME census_code_2010 TO census_tract;

create or replace table hmda_2004_2013 as
select * from cen_hmda_2004_2012
union all by name
(select
*
from 
hmda_2004_2013
where activity_year = 2013);

drop table cen_hmda_2004_2012;
