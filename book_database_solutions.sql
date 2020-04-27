-- 1) list all the data in the books database
select * from authors;

select * from publishers;

select * from titles;

select * from title_authors;

select * from royalties;

-- Find all the info on authors whose last name starts with
-- 'H'
select * from authors
where AU_LNAME like 'H%';

/* Find the title, type, salesprice, published date
for all titles published between july 15, 2014 and august 15, 2014
*/
select TITLE_NAME, "TYPE", SALES, PUBDATE
from titles 
where PUBDATE between '07/15/2014' and
'08/15/2014';

/* Find all the information for titles T01, T04, and T07 */
select * from titles where
TITLE_ID in ('T01', 'T04', 'T07');

/** Find the last name, first name, address, city, state for
all authors */
select au_lname, au_fname,ADDRESS, CITY, "STATE" from authors
order by state, city;

/** Find the title and sales price for all books that sell
 for more than $20 */
select title_name, price from titles
where price > 20;

/** Find the title and number of pages for all books that
have < 5000 copies */
select title_name, price from TITLES
where SALES < 5000;

/** Find the title fo all books that have been published
by 'Core Dump Books' **/
select * from TITLES natural join PUBLISHERS
where pub_name = 'Core Dump Books';

/** Find the title of all books that have not been published by
'Core Dump Books' */
select * from titles natural join publishers
where pub_name != 'Core Dump Books';

/** List all the different types of books */
select distinct type from titles ;

/** Find the publisher name of all books that were published in 
august 2014 */
select distinct pub_name from publishers natural join titles
where year(pubdate) = 2014 and month(pubdate) = 8;

/** Find the authors that live in the same state as their publishers */
select distinct authors.au_lname, authors.au_fname from authors
inner join TITLE_AUTHORS
on authors.AU_ID = title_authors.AU_ID
inner join titles
on TITLE_AUTHORS. TITLE_ID = titles.TITLE_ID
inner join publishers
on titles.pub_id = publishers.pub_id
where authors."STATE" = publishers."STATE";

/** Find the authors that do not live in the same state as their publishers */
select distinct authors.au_lname, authors.au_fname from authors
inner join TITLE_AUTHORS
on authors.AU_ID = title_authors.AU_ID
inner join titles
on TITLE_AUTHORS. TITLE_ID = titles.TITLE_ID
inner join publishers
on titles.pub_id = publishers.pub_id
where authors."STATE" != publishers."STATE";

/** Find the list of authros that write history books */
select distinct AUTHORS.au_lname, authors.AU_FNAME
from authors inner join 
title_authors on 
authors.AU_ID = title_authors.AU_ID
inner join titles on 
title_authors.TITLE_ID = titles.TITLE_ID
where type = 'history';

/** Find the publisher name of all books whose title starts
with E */
select pub_name from publishers natural join TITLES
where TITLE_NAME like 'E%';

/** List all the book and their authors
of all books that have been published by 'Schedenfrude press' */
select authors.au_lname, authors.au_fname, titles.title_name
from authors inner join title_authors
on authors.au_id = title_authors.AU_ID
inner join titles on
title_authors.TITLE_ID = titles.TITLE_ID
inner join publishers on 
titles.pub_id = publishers.PUB_ID
where pub_name = 'Schadenfreude Press';

/** List the authors and titles and all the advances paid
for all books. */
select au_fname, au_lname, title_name, advance*royalty_share from authors inner join title_authors on authors.au_id=title_authors.au_id inner join titles on title_authors.title_id=titles.title_id 
 right outer join royalties on titles.title_id=royalties.title_id;

/** How many books were published by each publisher */
select pub_id, count(TITLE_ID) as books from
publishers natural join titles
group by pub_id ;

/** How many books were published by each publishers
where the number of books published is greater than 2. */
select pub_id, count(TITLE_ID) as books from
publishers natural join titles
group by pub_id 
having count(TITLE_ID) > 2;

/** What is the highest advance paid for a book */
select max(ADVANCE) from ROYALTIES;

/** What is the average royalty rate paid */
select avg(ROYALTY_RATE) from ROYALTIES;

/** List the total royalties paid out for each book */
select title_name, ROYALTY_RATE * sales * price as total_royalties
from titles natural join royalties;

/** What is the total money paid out to each author to date */
select authors.au_fname, authors.au_lname, sum((advance + ROYALTY_RATE * price * sales) * ROYALTY_SHARE) as total_money
from authors inner join title_authors
on authors.au_id = title_authors.AU_ID
inner join titles on 
title_authors.title_id = titles.TITLE_ID
inner join ROYALTIES on
titles.TITLE_ID = ROYALTIES.TITLE_ID
group by au_fname, au_lname;

/** how many authors live in each state */
select state, count(au_id) as authors from
authors group by state;

/** How many books were written by each author */
select authors.au_lname, authors.au_fname, count(titles.title_id) as books
from authors inner join title_authors
on authors.au_id = title_authors.au_id
inner join titles on 
title_authors.title_id = titles.TITLE_ID
group by authors.au_lname, authors.au_fname
order by books desc;

/** Find the first name and last name of all authors
who live in the same state as sarah buchman */
select au_fname, au_lname from authors where state = (select state from authors
where au_fname = 'Sarah' and au_lname = 'Buchman');

/** Find the title of all books that have less pages than 'I blame my mother' */
select distinct title_name from titles 
where pages < (select PAGES from titles where
title_name = 'I Blame My Mother');

/** Find the books that pay out a lower royalty rate than
'Ask Your System Adminstrator' */
select title_name from titles
natural join ROYALTIES
where ROYALTY_RATE < 
(select ROYALTY_RATE from titles
natural join ROYALTIES
where title_name = 'Ask Your System Administrator');

/** What is the title and price of the lowest priced book */
select title_name, price from titles where price = (select min(price) from titles);

/** Find the publishers of all books that are the same type as 'How About Never?' */
select distinct pub_name from publishers natural join titles
where type = (select type from titles
where title_name = 'How About Never?');

/** List all city and state where we do business 
where we have authors or publishers. Identify each row as either
an author or a publisher */
select city, state, 'author' as category from authors
union
select city, state, 'publisher' as category from publishers;

/** List the states in which we have both authors and publishers */
select state from authors
intersect 
select state from publishers;

/** List all the authors who have not published */
select distinct au_lname, au_fname from authors
except
select distinct au_lname, au_fname
from authors inner join title_authors
on authors.au_id = title_authors.au_id
inner join titles on
title_authors.title_id = titles.title_id
inner join publishers on
titles.pub_id = publishers.PUB_ID;

/** list the publishers that did not publish a book during 2014 */
select distinct pub_name from publishers
except
select distinct pub_name from publishers
natural join titles 
where year(pubdate) =  2014;

/** List the states in which we have authors, publishers or both. */
select state, 'author' as category from
(select state from authors except select state from publishers) as tmp1
union 
select state, 'publisher' as category from
(select state from publishers except select state from authors) as tmp2
union
select state, 'both' as category from
(select state from PUBLISHERS intersect select state from AUTHORS) as tmp3
order by state;

/** List author name, and book title in which the author
is the last author listed */

/** List the author(s) of the book with the highest sales */
select au_fname, au_lname from authors where AU_ID 
in (
select AU_ID from title_authors natural join titles where
sales = (select max(sales) from titles));
