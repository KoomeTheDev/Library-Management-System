-- Library Management System Database

-- Table: Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- Table: Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    published_year YEAR,
    copies_available INT NOT NULL DEFAULT 1
);

-- Junction Table: BookAuthors (Many-to-Many relationship)
CREATE TABLE BookAuthors (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Table: Members
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    membership_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Table: Loans
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    CONSTRAINT chk_due_after_loan CHECK (due_date > loan_date),
    CONSTRAINT chk_return_after_loan CHECK (return_date IS NULL OR return_date >= loan_date)
);

-- Insert Authors
INSERT INTO Authors (first_name, last_name) VALUES
('George', 'Orwell'),
('Jane', 'Austen'),
('J.K.', 'Rowling'),
('Mark', 'Twain');

-- Insert Books
INSERT INTO Books (title, isbn, published_year, copies_available) VALUES
('1984', '9780451524935', 1949, 5),
('Pride and Prejudice', '9780141199078', 1813, 3),
('Harry Potter and the Sorcerer''s Stone', '9780590353427', 1997, 7),
('Adventures of Huckleberry Finn', '9780486280615', 1884, 2);

-- Insert BookAuthors
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),  -- 1984 by George Orwell
(2, 2),  -- Pride and Prejudice by Jane Austen
(3, 3),  -- Harry Potter by J.K. Rowling
(4, 4);  -- Huck Finn by Mark Twain

-- Insert Members
INSERT INTO Members (full_name, email, phone) VALUES
('Alice Johnson', 'alice.johnson@example.com', '555-1234'),
('Bob Smith', 'bob.smith@example.com', '555-5678'),
('Carol Lee', 'carol.lee@example.com', '555-8765');

-- Insert Loans
INSERT INTO Loans (member_id, book_id, loan_date, due_date, return_date) VALUES
(1, 1, '2025-08-01', '2025-08-15', NULL),
(2, 3, '2025-08-05', '2025-08-20', '2025-08-18'),
(3, 2, '2025-08-10', '2025-08-24', NULL);
