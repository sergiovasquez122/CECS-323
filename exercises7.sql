select * from AUTHORS;

select * from PUBLISHERS;

select * from TITLES;

select * from TITLE_AUTHORS;

select * from ROYALTIES;

select * from AUTHORS
where AU_LNAME like 'H%';

select TITLE_ID, "TYPE", PRICE, PUBDATE
from TITLES where 
PUBDATE between '07/15/2014' and '08/15/2014';

select * from TITLES
where TITLE_ID in ('T01', 'T04', 'T07');

select AU_LNAME, AU_FNAME, ADDRESS, CITY, "STATE"
from AUTHORS order by CITY;

select TITLE_ID, TITLE_NAME, PRICE
from TITLES where PRICE > 20;

select TITLE_ID, TITLE_NAME, PAGES
from TITLES where SALES < 5000;

select TITLE_ID, TITLE_NAME
from TITLES natural join PUBLISHERS
where PUB_NAME = 'Core Dump Books';

select TITLE_ID, TITLE_NAME
from TITLES natural join PUBLISHERS
except 
select TITLE_ID, TITLE_NAME
from TITLES natural join PUBLISHERS
where PUB_NAME = 'Core Dump Books';

select distinct type from titles;

select distinct PUB_NAME from
publishers natural join titles
where year(PUBDATE) = 2014 
and month(PUBDATE) = 8;

select distinct AU_LNAME, AU_FNAME
from AUTHORS inner join TITLE_AUTHORS
on AUTHORS.AU_ID = TITLE_AUTHORS.AU_ID
inner join TITLES on
TITLE_AUTHORS.TITLE_ID = titles.TITLE_ID
inner join publishers
on titles.PUB_ID = publishers.PUB_ID
where authors."STATE" = publishers."STATE";

select distinct AU_LNAME, AU_FNAME
from AUTHORS inner join TITLE_AUTHORS
on AUTHORS.AU_ID = TITLE_AUTHORS.AU_ID
inner join TITLES on
TITLE_AUTHORS.TITLE_ID = titles.TITLE_ID
inner join publishers
on titles.PUB_ID = publishers.PUB_ID
where authors."STATE" != publishers."STATE";

select distinct au_lname, au_fname
from authors natural join 
title_authors natural join
titles where "TYPE" = 'history';

select pub_name
from publishers 
natural join TITLES
where TITLE_NAME like 'E%';

select PUB_NAME, count(TITLE_ID) from
publishers natural join titles
group by pub_name;

select count(AU_ID) from authors
where "STATE" in (
select "STATE" from authors
where AU_FNAME = 'Sarah'
and AU_LNAME = 'Buchman'
)

select distinct title_name from TITLES
where pages < (select pages from TITLES
where TITLE_NAME = 'I Blame My Mother');

select title_name, price from titles where 
price = (select min(price) from TITLES);

select distinct pub_name from publishers
natural join titles where
"TYPE" = (select "TYPE" from
TITLES where 
title_name = 'How About Never?');

select CITY, "STATE", 'authors' as category from
authors
union
select city, state, 'publishers' as category from 
publishers;

select  "STATE" from
authors
intersect
select "STATE" from
publishers order by "STATE";

select pub_name from publishers
except
select pub_name from PUBLISHERS
natural join TITLES
where year(PUBDATE) = 2014;

select distinct au_lname, au_fname from
authors natural join title_authors
natural join titles where sales = (
select max(sales) from TITLES
);

select distinct au_lname, au_fname from
authors except 
select distinct au_lname, au_fname
from authors inner join 
title_authors on 
authors.AU_ID = TITLE_AUTHORS.AU_ID
inner join titles on
TITLE_AUTHORS.TITLE_ID = TITLEs.TITLE_ID
inner join PUBLISHERS on 
titles.PUB_ID = publishers.PUB_ID;
