-- Library Management Database

-- Create the database
CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

-- Create Authors table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Biography TEXT
);

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- Create Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Publisher VARCHAR(100),
    YearPublished YEAR,
    CopiesAvailable INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Create Members table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    MembershipDate DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Create Librarians table
CREATE TABLE Librarians (
    LibrarianID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    HireDate DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Create Borrowing (Loans) table
CREATE TABLE Borrowing (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LibrarianID INT,
    LoanDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (LibrarianID) REFERENCES Librarians(LibrarianID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT chk_return_after_loan CHECK (ReturnDate IS NULL OR ReturnDate >= LoanDate),
    CONSTRAINT chk_due_after_loan CHECK (DueDate >= LoanDate)
);
-- Sample Authors
INSERT INTO Authors (Name, Biography) VALUES
('Ngũgĩ wa Thiong\'o', 'Renowned Kenyan writer known for works in Gikuyu and English.'),
('Grace Ogot', 'Kenyan author and politician famous for storytelling and historical novels.'),
('Binyavanga Wainaina', 'Kenyan writer and journalist, founder of Kwani? literary magazine.');

-- Sample Categories (Genres)
INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('History'),
('Poetry'),
('African Literature'),
('Science');

-- Sample Books
INSERT INTO Books (Title, AuthorID, CategoryID, ISBN, Publisher, YearPublished, CopiesAvailable) VALUES
('A Grain of Wheat', 1, 1, '9780435905229', 'Heinemann Kenya', 1967, 5),
('The Promised Land', 1, 1, '9780435908121', 'Heinemann Kenya', 1986, 3),
('The Graduate', 2, 1, '9789966205397', 'EAEP', 1964, 4),
('One Day I Will Write About This Place', 3, 1, '9781594631817', 'Graywolf Press', 2011, 2);

-- Sample Members
INSERT INTO Members (Name, Address, Phone, Email, MembershipDate) VALUES
('James Mwangi', 'Nairobi, Kenya', '0712345678', 'james.mwangi@example.co.ke', '2023-01-15'),
('Amina Hassan', 'Mombasa, Kenya', '0723456789', 'amina.hassan@example.co.ke', '2023-03-22'),
('Peter Otieno', 'Kisumu, Kenya', '0734567890', 'peter.otieno@example.co.ke', '2023-06-10');

-- Sample Librarians
INSERT INTO Librarians (Name, Email, Phone, HireDate) VALUES
('Mercy Wairimu', 'mercy.wairimu@library.ke', '0700123456', '2020-07-01'),
('David Njoroge', 'david.njoroge@library.ke', '0700654321', '2019-09-15');

-- Sample Borrowing Records (Loans)
INSERT INTO Borrowing (BookID, MemberID, LibrarianID, LoanDate, DueDate, ReturnDate) VALUES
(1, 1, 1, '2025-09-01', '2025-09-15', '2025-09-10'),
(2, 2, 2, '2025-09-05', '2025-09-19', NULL),
(3, 3, 1, '2025-08-20', '2025-09-03', '2025-09-02');
