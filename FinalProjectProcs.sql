--Start select statements
--Find Copies of The Lost Tribe in Sharpstown Library
CREATE PROC dbo.uspLostTribe
AS

SELECT * FROM tbl_book_copies
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_book_copies.BookID
	INNER JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
	WHERE BranchName = 'Sharpstown' AND
	Title = 'The Lost Tribe'

GO
;

--End finding Copies of The Lost Tribe in Sharpstown Library
--Find copies of The Lost Tribe at ANY Library

CREATE PROC dbo.uspLostTribeAnyBranch
AS

SELECT * FROM tbl_book_copies
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_book_copies.BookID
	INNER JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
	WHERE BranchName LIKE '%' AND
	Title = 'The Lost Tribe'
GO
;
--Found all copies of The Lost Tribe at ANY Library
--Find the Names of all Borrowers that DO NOT have a book borrowed currently

CREATE PROC dbo.uspGetBorrowerNoBooks
AS

SELECT Name FROM tbl_borrower
	FULL OUTER JOIN tbl_book_loans ON tbl_book_loans.CardNo = tbl_borrower.CardNo
	WHERE (tbl_borrower.CardNo) NOT IN (SELECT tbl_book_loans.CardNo FROM tbl_book_loans)

GO;
	
--Finish finding the Names of all Borrowers that DO NOT have a book borrowed currently
--Find Books that are due from Sharpstown today

CREATE PROC dbo.uspFindDueBooks
AS

SELECT BranchName, DATEDUE, Name, Title, tbl_borrower.Address FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_book_loans.BranchID = tbl_library_branch.BranchID
	INNER JOIN tbl_borrower ON tbl_borrower.CardNo = tbl_book_loans.CardNo
	INNER JOIN tbl_books ON tbl_books.BookID = tbl_book_loans.BookID
	WHERE BranchName = 'Sharpstown' AND DATEDUE = '2-13-19'
GO;


--Found books due from Sharpstown today
--Find number of books loaned out by each branch

CREATE PROC dbo.uspFindNumLoanedBooks
AS

SELECT BranchName, count(branchName) AS 'Loaned Books' FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_book_loans.BranchID = tbl_library_branch.BranchID
	GROUP BY BranchName
GO;


--Finished finding number of books loaned out by each branch
--Find info about people with more than 5 books loaned out to them


CREATE PROC dbo.uspFindManyBookBorrowers
AS

SELECT Name, COUNT(tbl_borrower.Name) AS 'Books Checked Out', Address FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.CardNo = tbl_borrower.CardNo
	GROUP BY tbl_borrower.Address, tbl_borrower.Name
	HAVING COUNT(tbl_borrower.Name) > 5 
GO;


--Finished finding info about people with more than 5 books loaned out to them
--Find books by Stephen King in Central Library with the title and number of copies

CREATE PROC dbo.uspFindStephenKingBooks
AS

SELECT Title, AuthorName, BranchName, tbl_book_copies.Number_Of_Copies FROM tbl_books
	INNER JOIN tbl_book_authors ON tbl_book_authors.BookID = tbl_books.BookID
	INNER JOIN tbl_book_copies ON tbl_book_copies.BookID = tbl_books.BookID
	INNER JOIN tbl_library_branch ON tbl_library_branch.BranchID = tbl_book_copies.BranchID
	WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
GO;
