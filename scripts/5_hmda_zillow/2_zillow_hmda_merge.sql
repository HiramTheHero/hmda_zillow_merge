
update zillow_all set propertyaddresscensustractandblock = left(propertyaddresscensustractandblock, 11);

select regexp_matches('anabanana', '(an)*');

select distinct lendername, regexp_replace(lendername, '(CORP|CO)', 'CORPORATION') as change from zillow_all where regexp_matches(lendername, '\s(CORP|CO)($|\s)');

select regexp_replace(lendername, 'MTG', 'MORTGAGE')

select census_tract from hmda_1994_2003 limit 1000;

describe zillow_all;

create or replace table hmda_zillow_1994_2003
as
select *
FROM
hmda_1994_2003
JOIN
zillow_all
on hmda_1994_2003.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_1994_2003.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_1994_2003.lender_name, zillow_all.lendername ) > .85
and hmda_1994_2003.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

select count(*) from hmda_zillow_1994_2003;

select activity_year, avg(loanamount / totalassessedvalue) from hmda_zillow_1994_2003 group by activity_year order by activity_year;
select activity_year, count(*) from hmda_zillow_1994_2003 group by activity_year order by activity_year;


describe hmda_zillow_1994_2003



create or replace table hmda_zillow_2004_2013
as
select *
FROM
hmda_2004_2013
JOIN
zillow_all
on hmda_2004_2013.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2004_2013.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2004_2013.lender_name, zillow_all.lendername ) > .85
and hmda_2004_2013.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;


select activity_year, avg(loanamount / totalassessedvalue) from hmda_zillow_2004_2013 group by activity_year order by activity_year;
select activity_year, count(*) from hmda_zillow_2004_2013 group by activity_year order by activity_year;

create or replace table hmda_zillow_2014_2016
as
select *
FROM
hmda_2014_2016
JOIN
zillow_all
on hmda_2014_2016.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2014_2016.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2014_2016.lender_name, zillow_all.lendername ) > .85
and hmda_2014_2016.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

select activity_year, avg(loanamount / totalassessedvalue) from hmda_zillow_2014_2016 group by activity_year order by activity_year;
select activity_year, count(*) from hmda_zillow_2014_2016 group by activity_year order by activity_year;

create or replace table hmda_zillow_2017
as
select *
FROM
hmda_2017
JOIN
zillow_all
on hmda_2017.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2017.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2017.lender_name, zillow_all.lendername ) > .85
and hmda_2017.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

select activity_year, avg(loanamount / totalassessedvalue) from hmda_zillow_2017 group by activity_year order by activity_year;
select activity_year, count(*) from hmda_zillow_2017 group by activity_year order by activity_year;

create or replace table hmda_zillow_2018_2020
as
select *
FROM
hmda_2018_2020
JOIN
zillow_all
on hmda_2018_2020.census_tract = zillow_all.propertyaddresscensustractandblock
and hmda_2018_2020.activity_year = zillow_all.assessmentyear
and jaro_similarity(hmda_2018_2020.lender_name, zillow_all.lendername ) > .85
and hmda_2018_2020.loan_amount between zillow_all.loanamount - 1000 and zillow_all.loanamount + 1000;

select activity_year, avg(loanamount / totalassessedvalue) from hmda_zillow_2018_2020 group by activity_year order by activity_year;
select activity_year, count(*) from hmda_zillow_2018_2020 group by activity_year order by activity_year;

