CREATE TABLE "accounts" (
    "user_id" serial PRIMARY KEY,
    "username" varchar(12) NOT NULL,
    "city" varchar(128),
    "transactions_completed" integer,
    "transactions_attempted" integer,
    "account_balance" numeric(12,2)
);

INSERT INTO "accounts" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance") VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 10, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);

	--1.	How do you get all users from Chicago?
	
SELECT * FROM "accounts"
WHERE "city" ILIKE 'chicago';
	--2.	How do you get all users with usernames that contain the letter a?
SELECT * FROM "accounts"
WHERE "username" ILIKE '%a%';
	--3.	The bank is giving a new customer bonus! How do you update all records with an account balance of 0.00 and a transactions_attempted of 0? Give them a new account balance of 10.00.
UPDATE "accounts" SET "account_balance" = 10
WHERE "account_balance" = 0 AND "transactions_attempted" = 0;

	--4.	How do you select all users that have attempted 9 or more transactions?
SELECT * FROM "accounts"
WHERE "transactions_attempted" > 8;
	
	--5.	How do you get the username and account balance of the 3 users with the highest balances, sorted highest to lowest balance? NOTE: Research LIMIT
	
SELECT "username", "account_balance" FROM "accounts"
WHERE "account_balance" > 1
ORDER BY "account_balance" DESC
LIMIT 3;
	--6.	How do you get the username and account balance of the 3 users with the lowest balances, sorted lowest to highest balance?
SELECT "username", "account_balance" FROM "accounts"
WHERE "account_balance" >= 0
ORDER BY "account_balance" ASC
LIMIT 3;
	--7.	How do you get all users with account balances that are more than $100?
SELECT "username" FROM "accounts"
WHERE "account_balance" > 100;
	--8.	How do you add a new account?
INSERT INTO "accounts" ("username", "city", "transactions_completed", "transactions_attempted", "account_balance") 
VALUES ('morgan', 'minneapolis', 0, 0, 12);
	--9.	The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: How do you delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.
SELECT "username" FROM "accounts"
WHERE "city" ILIKE 'miami' AND "transactions_completed" < 5 
OR "city" ILIKE 'phoenix' AND "transactions_completed" < 5;

--always check first

DELETE FROM "accounts"
WHERE "city" ILIKE 'miami' AND "transactions_completed" < 5 
OR "city" ILIKE 'phoenix' AND "transactions_completed" < 5;
--STRETCH
	--1.	Anthony moved to Santa Fe.
UPDATE "accounts" SET "city" = 'santa fe'
WHERE "username" = 'anthony';
	--2.	Grace closed her account.
	--3.	Travis made a withdrawl of $20,000. What's their new balance? NOTE: Research RETURNING
	--4.	The Bank needs to track last names. NOTE: Research ALTER TABLE https://www.postgresql.org/docs/10/static/sql-altertable.html
