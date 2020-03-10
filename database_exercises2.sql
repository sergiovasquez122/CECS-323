select * from AUTHORS

select * from PUBLISHERS

select * from TITLES

select * from ROYALTIESsales

select * from AUTHORS where AU_LNAME like 'H%'

select title_name, type, price, PUBDATE from TITLES natural join PUBLISHERS where PUBDATE between '07/15/2014' and '08/15/2014'

select * from TITLES where TITLE_ID in ('T01', 'T04', 'T07')

select AU_FNAME, AU_LNAME, ADDRESS, CITY, "STATE" from AUTHORS order by CITY, "STATE"

select * from TITLES where PRICE > 20
