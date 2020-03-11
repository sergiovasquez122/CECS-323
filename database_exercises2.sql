select * from AUTHORS

select * from PUBLISHERS

select * from TITLES

select * from ROYALTIES

select * from AUTHORS where AU_LNAME like 'H%'

select title_name, type, price, PUBDATE from TITLES natural join PUBLISHERS where PUBDATE between '07/15/2014' and '08/15/2014'

select * from TITLES where TITLE_ID in ('T01', 'T04', 'T07')

select AU_FNAME, AU_LNAME, ADDRESS, CITY, "STATE" from AUTHORS order by CITY, "STATE"

select * from TITLES where PRICE > 20

select * from TITLES where sales < 5000

select TITLE_NAME from TITLES natural join PUBLISHERS where PUB_NAME = 'Core Dump Books'

select TITLE_NAME from TITLES natural join PUBLISHERS where PUB_NAME != 'Core Dump Books'

select distinct type from TITLES

select distinct PUB_NAME from PUBLISHERS natural join TITLES where Month(PUBDATE) = 8 and year(PUBDATE) = 2014

select distinct AU_FNAME, AU_LNAME from AUTHORS natural join TITLE_AUTHORS natural join TITLES where type = 'history'

select PUB_NAME from PUBLISHERS natural join TITLES where TITLE_NAME like 'E%'
Schadenfreude Press

select * from AUTHORS
inner join TITLE_AUTHORS
on  AUTHORS.AU_ID = TITLE_AUTHORS.AU_ID
inner join TITLES
on TITLE_AUTHORS.TITLE_ID = TITLES.TITLE_ID
inner join PUBLISHERS
on PUBLISHERS.PUB_ID = TITLES.PUB_ID
where PUB_NAME = 'Schadenfreude Press'

select max(advance) from ROYALTIES

select avg(ROYALTY_RATE) from ROYALTIES

select PUB_NAME, count(TITLE_ID) as numberOfBooks from PUBLISHERS natural join TITLES group by PUB_NAME order by count(TITLE_ID) desc

select pub_name, count(title_id) as number_of_books from Publishers natural join Titles group by pub_name having count(title_id) > 2 order by count(title_id) desc

select state, count(au_id) from AUTHORS group by state order by count(au_id) desc
