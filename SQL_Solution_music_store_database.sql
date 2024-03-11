use music_store_database;
/* 
set 1 - easy
1) who is the senior most employee based on the job tiitle?
2) which country have the most invoices?
3) what are the top 3 values of total invoice?
4) Which city has the best customers? we would like to throw a promotional music festival in the city we made the most money. write a query that
 return one city that has the highest sum of invoice totals. return both the city name and sum of all invoice total.
5) Who is the best customer? The customer who has spent the most money will be declared the best customer. write a query that return the person
 who has spent the most money.
 
Set 2 - moderate
1) write query to return the e-mail, first name, last name, genre of all rock music listeners. Return your list ordered alphabetically by e-mail
 starting with A
2) Let's invite the artist who have written the most rock music in a dataset. Write a query that returns the artist's name and total track count 
of the top 10 rock band.
3) Return all the track names that have a song length longer than the average song length return the name and Milliseconds for each track. 
My phone went with the longest songs listened first.

SET 3 - hard
1) Find how much amount spent by each customer on artists? write a query to return customer name, artist name and total spent.
2) We want to find out the most popular music genre for each country we determine the most popular genre as the genre with the highest amount 
of purchases write a query that written each country along with the top genre. For countries where the maximum number of purchases is shared return
all genres.
3) Write a query that determines the customer that has spent the most on music for each country. I read that return the country along with the top
customer And how much they spent. For countries where the top amount spent is shared provide all customers who spent this amount.
*/

-- 1) who is the senior most employee based on the job tiitle?
select * from employee
order by levels desc
limit 1;

-- 2) which country have the most invoices?
select count(*) as c, billing_country
from invoice
group by billing_country
order by c desc;

-- 3) what are the top 3 values of total invoice?
select total from invoice
order by total desc
limit 3;

/*4) Which city has the best customers? we would like to throw a promotional music festival in the city we made the most money. write a query that
 return one city that has the highest sum of invoice totals. return both the city name and sum of all invoice total.*/
select billing_city as city_name, sum(total) as invoice_total
from invoice
group by city_name
order by invoice_total desc
limit 1;

/*5) Who is the best customer? The customer who has spent the most money will be declared the best customer. write a query that return the person
 who has spent the most money. */
select c.customer_id , sum(i.total) as total
from customer c
join invoice i
on i.customer_id = c.customer_id
group by c.customer_id
order by total desc
limit 1;

-- SET 2
/*1) write query to return the e-mail, first name, last name, genre of all rock music listeners. Return your list ordered alphabetically by e-mail
 starting with A */
select distinct c.email ,c.first_name, c.last_name 
from customer c
join invoice i
on i.customer_id = c.customer_id
join invoice_line l
on l.invoice_id = i.invoice_id
where track_id in (
select track_id from track
join genre g
on track.genre_id = g.genre_id
where g.name like "Rock")
order by email asc;
 
/*2) Let's invite the artist who have written the most rock music in a dataset. Write a query that returns the artist's name and total track count 
of the top 10 rock band.*/
select artist.artist_id, artist.name ,count(artist.artist_id) as total_songs
from track
join album2 on album2.album_id = track.album_id
join artist on artist.artist_id = album2.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like "Rock"
group by artist.artist_id , artist.name
order by total_songs desc
limit 10 ;

/*3) Return all the track names that have a song length longer than the average song length return the name and Milliseconds for each track. 
My phone went with the longest songs listened first.*/
select name,milliseconds
from track
where milliseconds > (select avg(track.milliseconds)as avg_track_length from track)
order by milliseconds desc;

-- SET 3
-- 1) Find how much amount spent by each customer on artists? write a query to return customer name, artist name and total spent.
select c.first_name, c.last_name , r.name as artist_name, sum(l.unit_price * l.quantity ) as amount_spent
from customer c
join invoice i on i.customer_id = c.customer_id
join invoice_line l on l.invoice_id = i.invoice_id
join track t on t.track_id = l.track_id
join album2 a on t.album_id = a.album_id
join artist r on r.artist_id = a.artist_id
group by c.first_name , c.last_name,  artist_name
order by amount_spent desc;

/* 2) We want to find out the most popular music genre for each country we determine the most popular genre as the genre with the highest amount 
of purchases write a query that written each country along with the top genre. For countries where the maximum number of purchases is shared return
all genres.*/
WITH popular_genre AS (
    SELECT
        COUNT(invoice_line.quantity) AS purchases,
        customer.country AS countries,
        genre.name,
        genre.genre_id,
        ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS rowno
    FROM
        invoice_line
        JOIN invoice ON invoice_line.invoice_id = invoice.invoice_id
        JOIN customer ON customer.customer_id = invoice.customer_id
        JOIN track ON track.track_id = invoice_line.track_id
        JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY
        countries,
        genre.name,
        genre.genre_id
    ORDER BY
        countries ASC,
        purchases DESC
)
SELECT * FROM popular_genre WHERE rowno <= 1;

/*3) Write a query that determines the customer that has spent the most on music for each country. I read that return the country along with the top
customer And how much they spent. For countries where the top amount spent is shared provide all customers who spent this amount. */
WITH top_customers AS (
    SELECT
        c.first_name,
        c.last_name,
        i.billing_country AS countries,
        i.total,
        RANK() OVER (PARTITION BY i.billing_country ORDER BY i.total DESC) AS rnk
    FROM
        customer c
        JOIN invoice i ON i.customer_id = c.customer_id
)
SELECT
    first_name,
    last_name,
    countries,
    total AS amount_spent
FROM
    top_customers
WHERE
    rnk = 1;







