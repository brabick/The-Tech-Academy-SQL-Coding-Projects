CREATE DATABASE db_FinalProject2
USE db_FinalProject2

--Creating all tables
CREATE TABLE tbl_library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_authors (
	BookID INT NOT NULL CONSTRAINT fk_bookid FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_copies (
	BookID INT NOT NULL CONSTRAINT fk_bookid2 FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_branchid FOREIGN KEY REFERENCES tbl_library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

CREATE TABLE tbl_borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (200, 1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
	BookID INT NOT NULL CONSTRAINT fk_bookid3 FOREIGN KEY REFERENCES tbl_books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_branchid2 FOREIGN KEY REFERENCES tbl_library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_cardno FOREIGN KEY REFERENCES tbl_borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(50) NOT NULL,
	DATEDUE VARCHAR(50) NOT NULL
);




--Finished with tables
--Adding data to tables
--Adding to Library Branch Table

INSERT INTO tbl_library_branch 
	(BranchName, Address)
	VALUES
	('Sharpstown', '1234 Thumbwarton Street'),
	('Central', '5678 Thumbstraighton Lane')
;


INSERT INTO tbl_library_branch
	(BranchName, Address)
	VALUES
	('West', '583 Westington Drive'),
	('South', '10482 Southmire Line')
;


--Finished adding to library branch table

--Inserting into publisher table
INSERT INTO tbl_publisher 
	(PublisherName, Address, Phone)
	VALUES
	('Weaver Bickerton', '155 S Inca', '315-922-1874')
;

INSERT INTO tbl_publisher 
	(PublisherName, Address, Phone)
	VALUES
	('Penguin', '222 W Wallaby', '555-896-1111'),
	('Hail the King', '69 Hippity Hop Road', '333-121-9896'),
	('Richardsons Son', '4451 Running Lane', '446-898-6321')

;
SELECT * FROM tbl_books

--Finished inserting into publisher table

--Inserting into books table
INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('House on the Hill', 'Penguin'),
	('Verb the Noun', 'Penguin'),
	('Flip the Flop', 'Penguin'),
	('Ring around the Rosie', 'Penguin'),
	('Upside down', 'Penguin')
;

INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('Dune', 'Weaver Bickerton'),
	('Rune', 'Weaver Bickerton'),
	('Flune', 'Weaver Bickerton'),
	('Boon', 'Weaver Bickerton'),
	('Swoon', 'Weaver Bickerton')
;

INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('Cars on street', 'Hail the King'),
	('Cars on the beat', 'Hail the King'),
	('Cars on your feet', 'Hail the King'),
	('Feet on your cars', 'Hail the King'),
	('Beating cars', 'Hail the King')
;

INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('Don''t rock the boat', 'Richardsons Son'),
	('Rock the boat baby', 'Richardsons Son'),
	('Please rock the boat', 'Richardsons Son'),
	('Don''t tip the boat over', 'Richardsons Son'),
	('Rock the boat', 'Richardsons Son')
;

INSERT INTO tbl_books
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Weaver Bickerton')
;

SELECT * FROM tbl_books
--Finished inserting into books table

--Inserting into Book Authors table

INSERT INTO tbl_book_authors
	(BookID, AuthorName)
	VALUES
	(1, 'Todoroki Miller'),
	(2, 'Todoroki Miller'),
	(3, 'Rubics Cube'),
	(4, 'Rubics Cube'),
	(5, 'Long Bastion'),
	(6, 'Long Bastion'),
	(7, 'Hippo del Pippo'),
	(8, 'Hippo del Pippo'),
	(9, 'Stephen King'),
	(10, 'Stephen King' ),
	(11, 'Sara Green'),
	(12, 'Sara Green'),
	(13, 'Ranch Longbottom'),
	(14, 'Ranch Longbottom'),
	(15, 'Pepper Spice'),
	(16, 'Pepper Spice'),
	(17, 'Lin Troller'),
	(18, 'Lin Troller'),
	(19, 'Bam Boozle'),
	(20, 'Bam Boozle')
;

INSERT INTO tbl_book_authors
	(BookID, AuthorName)
	VALUES
	(21, 'Mark W. Lee')
;

--Finished Inserting Into Book Authors Table
--Inserting into Borrower Table

INSERT INTO tbl_borrower
	(Name, Address, Phone)
	VALUES
	('Lisa Simpson', '898 Rockerfeller Lane', '596-152-1414'),
	('Brandon Bleu', '9102 S Freud Street', '294-385-7592'),
	('Fred Red', '1032 N Right Street', '172-383-9190'),
	('Breen Green', '375 S Apollo Avenue', '859-093-2243'),
	('Melody Yellow', '812 E Flippant Street', '304-905-0193'),
	('Pilot Violet', '123 N Greenhouse Street', '939-048-2840'),
	('Jack Black', '894 House Street', '292-930-0000'),
	('Bright White', '183 Township Road', '192- 192-1921')
;

INSERT INTO tbl_borrower
	(Name, Address, Phone)
	VALUES
	('Nota Borrowa', '4520 Notgonna Way', '156-858-6263')
;

--Finished inserting into Borrower Table
--Inserting into Book Copies Table

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(2, 100, 2),
	(2, 101, 2)
;

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(9, 101, 2),
	(10, 101, 2)
;

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(4, 100, 2),
	(6, 100, 2),
	(8, 100, 2),
	(10, 100, 2),
	(12, 100, 2),
	(14, 100, 2),
	(16, 100, 2),
	(18, 100, 2),
	(20, 100, 2)
;

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(3, 101, 2),
	(7, 101, 2),
	(8, 101, 2),
	(14, 101, 2),
	(15, 101, 2),
	(20, 101, 2),
	(21, 101, 2)
;

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(21, 100, 5)
;


INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(2, 102, 2),
	(3, 102, 2),
	(4, 102, 2),
	(5, 102, 2),
	(6, 102, 2),
	(7, 102, 2),
	(8, 102, 2),
	(9, 102, 2),
	(10, 102, 2),
	(11, 102, 2)
;

INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(12, 103, 2),
	(13, 103, 2),
	(14, 103, 2),
	(15, 103, 2),
	(16, 103, 2),
	(17, 103, 2),
	(18, 103, 2),
	(19, 103, 2),
	(20, 103, 2),
	(11, 103, 2)
;
INSERT INTO tbl_book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(2, 100, 3)
;

SELECT * FROM tbl_library_branch

--Finshed intersting into book copies table
--Inserting into Borrowers Table

INSERT INTO tbl_book_loans
	(BookID, BranchID, CardNo, DateOut, DATEDUE)
	VALUES
	(3, 101, 200, '2-1-19', '3-1-19'),
	(6, 101, 200, '2-1-19', '3-1-19'),
	(9, 101, 200, '2-1-19', '3-1-19'),
	(10, 101, 200, '2-1-19', '3-1-19'),
	(12, 101, 200, '2-1-19', '3-1-19'),
	(14, 101, 200, '2-1-19', '3-1-19'),
	(16, 101, 200, '2-1-19', '3-1-19'),
	(18, 101, 200, '2-1-19', '3-1-19'),
	(20, 101, 200, '2-1-19', '3-1-19'),
	(21, 101, 200, '2-1-19', '3-1-19'),
	(2, 100, 204, '2-1-19', '3-1-19'),
	(4, 100, 204, '2-1-19', '3-1-19'),
	(6, 100, 204, '2-1-19', '3-1-19'),
	(8, 100, 204, '2-1-19', '3-1-19'),
	(10, 100, 204, '2-1-19', '3-1-19'),
	(11, 100, 204, '2-1-19', '3-1-19'),
	(13, 100, 204, '2-1-19', '3-1-19'),
	(15, 100, 204, '2-1-19', '3-1-19'),
	(17, 100, 204, '2-1-19', '3-1-19'),
	(19, 100, 204, '2-1-19', '3-1-19')
;

INSERT INTO tbl_book_loans
	(BookID, BranchID, CardNo, DateOut, DATEDUE)
	VALUES
	(2, 103, 201, '2-4-19', '3-14-19'),
	(4, 103, 201, '2-4-19', '3-14-19'),
	(6, 103, 201, '2-4-19', '3-14-19'),
	(8, 103, 201, '2-4-19', '3-14-19'),
	(3, 103, 202, '2-10-19', '3-10-19'),
	(5, 103, 202, '2-10-19', '3-10-19'),
	(7, 103, 202, '2-10-19', '3-10-19'),
	(9, 103, 202, '2-10-19', '3-10-19'),
	(10, 103, 203, '2-7-19', '3-17-19'),
	(12, 103, 203, '2-7-19', '3-17-19'),
	(14, 103, 203, '2-7-19', '3-17-19'),
	(16, 103, 203, '2-7-19', '3-17-19'),
	(11, 103, 205, '2-2-19', '3-12-19'),
	(13, 103, 205, '2-2-19', '3-12-19'),
	(15, 103, 205, '2-2-19', '3-12-19'),
	(17, 103, 205, '2-2-19', '3-12-19'),
	(19, 103, 205, '2-2-19', '3-12-19'),
	(21, 103, 205, '2-2-19', '3-12-19'),
	(4, 102, 206, '2-11-19', '3-11-19'),
	(8, 102, 206, '2-11-19', '3-11-19'),
	(12, 102, 206, '2-11-19', '3-11-19'),
	(16, 102, 206, '2-11-19', '3-11-19'),
	(20, 102, 206, '2-11-19', '3-11-19'),
	(21, 102, 206, '2-14-19', '3-14-19'),
	(17, 102, 206, '2-14-19', '3-14-19'),
	(15, 102, 206, '2-14-19', '3-14-19'),
	(11, 102, 206, '2-14-19', '3-14-19'),
	(9, 102, 206, '2-14-19', '3-14-19')
;
INSERT INTO tbl_book_loans
	(BookID, BranchID, CardNo, DateOut, DATEDUE)
	VALUES
	(2, 101, 207, '2-12-19', '3-22-19'),
	(2, 102, 207, '2-14-19', '3-24-19')
;
