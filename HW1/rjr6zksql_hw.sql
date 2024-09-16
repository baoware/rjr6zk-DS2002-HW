-- Part 1: Querying the World and Chinook Databases
-- World Database Questions:
-- Easy:
SELECT * FROM country WHERE Region = "South America";
SELECT Population FROM country WHERE Name = "Germany";
SELECT * FROM city WHERE CountryCode = "JPN";

-- Medium:
SELECT * FROM country WHERE Continent = "Africa" ORDER BY Population DESC LIMIT 3;
SELECT * FROM country WHERE Population BETWEEN 1000000 and 5000000;
SELECT country.* FROM country
	JOIN countrylanguage ON country.Code = countrylanguage.CountryCode 
		WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- Chinook Database Questions:
-- Easy:
SELECT Album.Title FROM Album
	JOIN Artist on Album.ArtistId = Artist.ArtistId
    	WHERE Artist.Name = "AC/DC";
SELECT FirstName, LastName, Email FROM Customer WHERE Country = "Brazil" LIMIT 500;
SELECT * FROM Playlist LIMIT 500;
 
-- Medium:
SELECT COUNT(*) FROM Track
	JOIN Genre on Track.GenreId = Genre.GenreId
    	WHERE Genre.Name = "Rock";
SELECT * FROM Employee WHERE ReportsTo = 2;
SELECT (SELECT COUNT(*) FROM Invoice) / (SELECT COUNT(*) FROM Customer);

-- Part 2: Create Your Own Database
-- 1. **Design Your Database:**
-- Bookstore with table for books, customers, and orders. Books will have columns for titles, authors, price, and ids. Customers will have columns for names, emails, and ids. Orders will have columns for the ids of customers and books, and new order ids.

-- 2. **Create the Tables:**
CREATE TABLE books (
	title VARCHAR(100),
    author VARCHAR(100),
    price FLOAT,
    book_id INT,
    PRIMARY KEY (book_id)
);

CREATE TABLE customers (
	name VARCHAR(200),
    email VARCHAR(200),
    customer_id INT,
	PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
    customer_id INT,
    book_id INT,
    order_id INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 3. **Insert Data:**
INSERT INTO books VALUES 
	('Italian Folktales', 'Italo Calvino', 19.99, 1),
    ('One Hundred Years of Solitude', 'Gabriel Garcia-Marquez', 13.99, 2),
    ('Invisible Cities', 'Italo Calvino', 11.99, 3),
    ('The Stranger', 'Albert Camus', 12.99, 4),
    ('Labyrinths', 'Jose Luis Borges', 15.99, 5);
    
INSERT INTO customers VALUES 
    ('Bao Duong', 'rjr6zk@Virginia.edu', 1),
    ('Ilove Reading', 'readforever@gmail.com', 2),
    ('Umberto Eco', 'eco@goodreads.com', 3),
    ('Tissuebox', 'flamingo@kleenex.com', 4),
    ('Raising Canes', 'caniac@hotmail.com', 5);

INSERT INTO orders VALUES 
    (1,1,1),
    (2,2,2),
    (3,3,3),
    (4,4,4),
    (5,5,5);
    
-- 4. **Write Queries:**
SELECT * FROM books;

SELECT orders.order_id, books.title, customers.name FROM orders
	JOIN books ON orders.book_id = books.book_id
    JOIN customers ON orders.customer_id = customers.customer_id
		WHERE orders.customer_id = 1;
        
SELECT COUNT(*) FROM orders;
