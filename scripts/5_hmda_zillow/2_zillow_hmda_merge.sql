ALTER TABLE zillow_all ADD COLUMN propertyaddresscensustractandblock_orig VARCHAR;
update zillow_all set propertyaddresscensustractandblock_orig = propertyaddresscensustractandblock;
update zillow_all set propertyaddresscensustractandblock = left(propertyaddresscensustractandblock, 11);

create or replace table hmda_zillow_1994_2003
as
select *
FROM
hmda_1994_2003
JOIN
zillow_all
on hmda_1994_2003.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_1994_2003.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_1994_2003.lendername, zillow_all.lendername ) > .9
and hmda_1994_2003.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

/*
select activity_year,
avg(cast(loanamount as double) / (totalassessedvalue)) as normltv,
avg(loanamount / (totalassessedvalue + (totalassessedvalue * 0.055))) as lowltv
from hmda_zillow_1994_2003 group by activity_year order by activity_year;
*/

create or replace table hmda_zillow_2004_2013
as
select *
FROM
hmda_2004_2013
JOIN
zillow_all
on hmda_2004_2013.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2004_2013.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2004_2013.lendername, zillow_all.lendername ) > .9
and hmda_2004_2013.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

create or replace table hmda_zillow_2014_2016
as
select *
FROM
hmda_2014_2016
JOIN
zillow_all
on hmda_2014_2016.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2014_2016.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2014_2016.lendername, zillow_all.lendername ) > .9
and hmda_2014_2016.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;



create or replace table hmda_zillow_2017
as
select *
FROM
hmda_2017
JOIN
zillow_all
on hmda_2017.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2017.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2017.lendername, zillow_all.lendername ) > .9
and hmda_2017.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

create or replace table hmda_zillow_2018_2020
as
select *
FROM
hmda_2018_2020
JOIN
zillow_all
on hmda_2018_2020.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2018_2020.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2018_2020.lendername, zillow_all.lendername ) > .9
and hmda_2018_2020.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;
