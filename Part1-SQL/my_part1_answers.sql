-- Here are some questions to answer
-- Keep the questions in the file, and just put the answers below the questions.

/*
  About the DATA
  There are 4 tables
  here is a list with descriptions

  IMPORTANT: YOU MAY CHANGE THE TABLE STRUCTURES IF YOU WOULD LIKE.
      THE LAST QUESTION WILL ASK ABOUT ALL YOUR CHANGES.

  - users
     - just a list of user data
  - emails
     - holds users emails.
     - There is a one to many relationship with the users table. Each user can have many emails
     - One email is marked as the primary email for the user
  - usage_log
     - holds the users session dates and times.
     - contains the login and logout times of every user session.
     - So every time a user logs in, it creates a new entry in this table
  - users_admin
     - only holds a user id
     - if a user's id is in this table, then they are an admin
*/

-- EXAMPLE
-- Write a statement that will return all the users
--  with the last name 'Johnson'
SELECT *
  FROM users
  WHERE lName = 'Johnson';


-- QUESTION 1
-- write a statement that returns all the users data
--   including their primary email, if they have one
--   and if they are an admin or not
select
	users.fName,
	users.lName,
	users.age,
	users.date,
	emails.email as [Primary Email],
	case
		when user_admin.id is null then 'end user'
		else 'admin'
	end as [user type]
from users
left join emails
	on users.id = emails.userID
		and emails.isprimary = 1
left join user_admin
	on users.id = user_admin.userId


-- QUESTION 2
-- write a statement that returns all user data
--   including their primary email
--   and if they are an admin or not
--   but only users with emails
select
	users.fName,
	users.lName,
	users.age,
	users.date,
	emails.email as [Primary Email],
	case
		when user_admin.id is null then 'end user'
		else 'admin'
	end as [user type]
from users
left join emails
	on users.id = emails.userID
		and emails.isprimary = 1
left join user_admin
	on users.id = user_admin.userId
where emails.id is not null


-- QUESTION 3
-- write a statement that returns all user data
--   that do not have an email
--   and are not admins
select
	users.fName,
	users.lName,
	users.age,
	users.date,
	emails.id,
	user_admin.id
from users
left join emails
	on users.id = emails.userID
left join user_admin
	on users.id = user_admin.userId
where emails.id is null
	and user_admin.id is null


-- QUESTION 4
-- write a statement that returns all the users data
--    only users with last name that contains a letter 'B'
--    and also return the number of emails those users have
select
	users.fName,
	users.lName,
	users.age,
	users.date,
	count(emails.id) as [Number of emails]
from users
left join emails
	on users.id = emails.userID
where users.lName like '%B%' COLLATE SQL_Latin1_General_Cp1_CS_AS
group by users.fName, users.lName, users.age, users.date

-- QUESTION 5
-- write a statement that returns all the users data
--    only users that have more than one email
--    and are admins
with email_count as (
	select 
		userID,
		count(ID) as [num_emails]
	from emails
	group by emails.userID
)
select 
	users.fName,
	users.lName,
	users.age,
	users.date
from users
	join user_admin
		on users.id = user_admin.id
	join email_count
		on users.id = email_count.userID
			and email_count.num_emails > 1
		

-- QUESTION 6
-- write a statement that returns all user data
--   with the total amount of time the users have spent on the site
--   in the past 21 days, in minutes
with log_min_totals as (
select 
	userID,
	sum(datediff(mi,login,logout)) as [total_min_logged]
from usage_log
group by usage_log.userID
)
select 
	users.fName,
	users.lName,
	users.age,
	users.date,
	case
		when log_min_totals.userID is null then 0
		else log_min_totals.total_min_logged
	end as [usage time]
from users
left join log_min_totals
	on users.id = log_min_totals.userID
left join usage_log
	on users.id = usage_log.userID
where datediff(dd,usage_log.login,getdate()) <= 21


-- QUESTION 7
-- Write a statement that returns all user data
--   with the total amount of time spent on the site
--   and with the total number of logins
--   beginning of time
with log_totals as (
select 
	userID,
	sum(datediff(mi,login,logout)) as [total_min_logged],
	count(ID) as [log_count]
from usage_log
group by usage_log.userID
)
select 
	users.fName,
	users.lName,
	users.age,
	users.date,
	case
		when log_totals.userID is null then 0
		else log_totals.total_min_logged
	end as [usage time],
	case
		when log_totals.userID is null then 0
		else log_totals.log_count
	end as [number of logins]from users
left join log_totals
	on users.id = log_totals.userID

-- QUESTION 8
-- given the table structure provided.
-- How would you did/would you change/improve our schema? Any Why?
-- Please list all changes that were made and a justification for the change.

/*
	I added primary to all 4 tables and set a foreign key that refferences the
	users table in other 3 tables. This was done so that I could easily reffer
	to user data that was stored in the other 3 tables.

	If this data was actually being used in a professional setting then one
	additional change that i would make would be to create a view based off
	of the CTEs I created for my answers in question 6 and 7. That way instead
	of having to perform that every single time those numbers are needed one
	could just query the view or table that gets updated whenever the appropiate
	table are updated with new data. This would make it easier to maintain the db as
	a whole and it would also make the db a little more flexible since this additional
	data would be availble without having to create those CTE's every single time.
*/