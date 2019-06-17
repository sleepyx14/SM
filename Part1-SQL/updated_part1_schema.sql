USE [testing]

GO

/*

	Drop the tables if they exists

*/

DROP TABLE IF EXISTS [emails];
DROP TABLE IF EXISTS [usage_log];
DROP TABLE IF EXISTS [user_admin];
DROP TABLE IF EXISTS [users];

/*
	Re-create tables with updated definitions
	that include Primay and Foreign keys where
	appropiate.
*/

CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[fName] [varchar](500) NULL,
	[lName] [varchar](500) NULL,
	[age] [bigint] NULL,
	[date] [datetime] NULL
)

GO
CREATE TABLE [dbo].[emails](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[email] [varchar](500) NULL,
	[isprimary] [int] NULL,
	[date] [datetime] NULL,
	[userID] [int] NOT NULL FOREIGN KEY REFERENCES users(id)
)

GO

CREATE TABLE [dbo].[usage_log](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[sessionId] [int] NULL,
	[login] [datetime] NULL,
	[logout] [datetime] NULL,
	[userID] [int] NOT NULL FOREIGN KEY REFERENCES users(id)
)

GO

CREATE TABLE [dbo].[user_admin](
	[id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[userId] [int] NOT NULL FOREIGN KEY REFERENCES users(id)
)

GO

/* Add users */

INSERT INTO users (fName,lName,age,date)
Values('Dwayne','Johnson',47,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Jack','Johnson',31,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Beverly','Johnson',66,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Lyndon B.','Johnson',65,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Ben','Johnson',78,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Don','Johnson',69,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Jimmie','Johnson',43,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Jimmy','Johnson',75,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Bobby','Bowden',89,GETDATE())

INSERT INTO users (fName,lName,age,date)
Values('Alec','Baldwin',61,GETDATE())


/* Add emails */
INSERT INTO emails(email,isprimary,date,userID)
Values('thegreatone@gmail.com',1,GETDATE(),1)

INSERT INTO emails(email,isprimary,date,userID)
Values('doomwasabadmovie@gmail.com',null,GETDATE(),1)

INSERT INTO emails(email,isprimary,date,userID)
Values('stillinspace@gmail.com',1,GETDATE(),2)

INSERT INTO emails(email,isprimary,date,userID)
Values('vouginaway@gmail.com',1,GETDATE(),3)

--INSERT INTO emails(email,isprimary,date,userID)
--Values('Iwasapresident@gmail.com',1,GETDATE(),4)

INSERT INTO emails(email,isprimary,date,userID)
Values('lastemailIneed@gmail.com',1,GETDATE(),5)

INSERT INTO emails(email,isprimary,date,userID)
Values('pasteliscool@gmail.com',1,GETDATE(),6)

INSERT INTO emails(email,isprimary,date,userID)
Values('startyourengines@gmail.com',1,GETDATE(),7)

INSERT INTO emails(email,isprimary,date,userID)
Values('hurricanecowboys@gmail.com',1,GETDATE(),8)

INSERT INTO emails(email,isprimary,date,userID)
Values('foreverfsu@gmail.com',1,GETDATE(),9)

INSERT INTO emails(email,isprimary,date,userID)
Values('bigshotbob@gmail.com',null,GETDATE(),9)

INSERT INTO emails(email,isprimary,date,userID)
Values('3booksbobby@gmail.com',null,GETDATE(),9)

INSERT INTO emails(email,isprimary,date,userID)
Values('30stones@gmail.com',1,GETDATE(),10)

INSERT INTO emails(email,isprimary,date,userID)
Values('iwasonfriends@gmail.com',null,GETDATE(),10)

INSERT INTO emails(email,isprimary,date,userID)
Values('drdoctor@gmail.com',null,GETDATE(),10)

INSERT INTO emails(email,isprimary,date,userID)
Values('broadwaysown@gmail.com',null,GETDATE(),10)



/*
	Insert usage_log
*/
INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-15 21:50:34','2019-05-30 00:20:09',1)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-30 23:23:32','2019-06-01 01:55:13',1)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-16 01:55:27','2019-06-01 01:55:13',2)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-16 05:00:29','2019-06-03 12:56:43',3)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-16 07:02:16','2019-06-05 07:07:49',4)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-16 12:49:45','2019-06-05 18:10:40',5)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-17 17:09:05','2019-06-06 06:21:24',6)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-22 14:21:09','2019-06-09 00:26:52',7)

INSERT INTO usage_log(sessionId,login,logout,userID)
Values(1,'2019-05-27 18:04:48','2019-06-09 22:02:19',8)

/*
	Insert user_admin
*/
INSERT INTO user_admin(userID)
Values(1)

INSERT INTO user_admin(userID)
Values(8)