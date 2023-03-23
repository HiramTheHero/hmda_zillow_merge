
create or replace table hmda_1994_2003 as
select
*
from
lar_1994_2003
join
panel_1994_2003 using (lei_or_respondent_id, activity_year);


create or replace table hmda_2004_2013 as
select
*
from
lar_2004_2013
join
panel_2004_2013 using (lei_or_respondent_id, activity_year);

create or replace table hmda_2014_2016 as
select
*
from
lar_2014_2016
join
panel_2014_2016 using (lei_or_respondent_id, activity_year);

create or replace table hmda_2017 as
select
*
from
lar_2017
join
panel_2017 using (lei_or_respondent_id, activity_year);

create or replace table hmda_2018_2020 as
select
*
from
lar_2018_2020
join
panel_2018_2020 using (lei_or_respondent_id, activity_year);

