# Music Store Database Project
This project focuses on the creation of a Music Store Database consisting of 13 different tables that are linked together. The database aims to simulate a music store's operations and provides a platform to analyze various aspects of the business.

## Project Description
The Music Store Database project is designed to mimic a real-world scenario of managing a music store's data. The database contains 13 interconnected tables, each representing different entities within the music store ecosystem. These tables include:

1. genres
2. invoice
3. invoice_line
4. media_type
5. playlist
6. playlist_track
7. track
8. album
9. album2
10. artist
11. customer
12. employee
13. schema_diagram
    
The tables are linked through primary and foreign key relationships to maintain data integrity and enable efficient querying.

# Queries
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


## Purpose of the Project
The main objectives of this project are:

To design and implement a relational database schema for a music store.
To populate the database with sample data representative of a music store's transactions and operations.
To provide SQL queries that answer common business questions and perform analysis on the music store data.
To showcase proficiency in SQL database design, querying, and data manipulation.

## Project Files
The project repository includes the following files:

music store data.zip: SQL script file containing the database schema creation and data insertion queries.
sql_solutions_music_store_database.sql: SQL file containing solutions to various questions and queries related to the music store database.

## README.md: The current file providing an overview of the project.
How to Use
To set up the Music Store Database and run the queries:
Clone this repository to your local machine.
Open a SQL client (such as MySQL Workbench, PostgreSQL, etc.).
Run the music_store_database.sql script to create the database schema and populate it with sample data.
Use the sql_solutions.sql file to execute SQL queries to answer specific questions about the music store.

## Contact Information
For any questions or feedback, feel free to reach out: 

- Email: ansharora.cs@gmail.com
- LinkedIn: [Connect with me on LinkedIn](https://www.linkedin.com/in/ansh-arora-data-scientist)
- Kaggle: [Follow me on Kaggle](https://www.kaggle.com/ansh1529)
