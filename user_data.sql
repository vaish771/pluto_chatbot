CREATE DATABASE IF NOT EXISTS PlutoChatbot;
USE PlutoChatbot;

CREATE TABLE users (
    user_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

INSERT IGNORE INTO users (user_id, name, email) VALUES
('U1001', 'Amit Sharma', 'amit.sharma@gmail.com'),
('U1002', 'Priya Mehta', 'priya.mehta@yahoo.com'),
('U1003', 'Rohan Verma', 'rohan.verma@outlook.com'),
('U1004', 'Sneha Iyer', 'sneha.iyer@gmail.com'),
('U1005', 'Vikas Singh', 'vikas.singh@yahoo.com'),
('U1006', 'Ananya Rao', 'ananya.rao@gmail.com'),
('U1007', 'Kunal Joshi', 'kunal.joshi@outlook.com'),
('U1008', 'Meera Kapoor', 'meera.kapoor@gmail.com'),
('U1009', 'Siddharth Das', 'siddharth.das@yahoo.com'),
('U1010', 'Neha Pandey', 'neha.pandey@gmail.com'),
('U1011', 'Manoj Nair', 'manoj.nair@outlook.com'),
('U1012', 'Divya Sinha', 'divya.sinha@gmail.com'),
('U1013', 'Rajiv Malhotra', 'rajiv.malhotra@yahoo.com'),
('U1014', 'Tanya Jain', 'tanya.jain@gmail.com'),
('U1015', 'Varun Saxena', 'varun.saxena@outlook.com'),
('U1016', 'Pooja Thakur', 'pooja.thakur@gmail.com'),
('U1017', 'Aditya Patil', 'aditya.patil@yahoo.com'),
('U1018', 'Suresh Reddy', 'suresh.reddy@gmail.com'),
('U1019', 'Kavita Choudhary', 'kavita.choudhary@outlook.com'),
('U1020', 'Harshita Goyal', 'harshita.goyal@gmail.com');

select * from users;

CREATE TABLE conversation_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(10),
    message TEXT,
    response TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
select * from conversation_history;

CREATE TABLE feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(10),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

INSERT IGNORE INTO feedback (user_id, rating, comments) VALUES
('U1001', 5, 'Very helpful chatbot!'),
('U1002', 4, 'Good response time, but needs better accuracy.'),
('U1003', 3, 'It’s okay but some answers were incorrect.'),
('U1004', 5, 'Loved the AI chatbot experience.'),
('U1005', 4, 'Great support and quick answers.');

select * from feedback;

CREATE TABLE model_version (
    id INT AUTO_INCREMENT PRIMARY KEY,
    version VARCHAR(10),
    release_date DATE,
    description TEXT
);

select * from model_version;

SHOW TABLES;

SELECT * FROM users;
SELECT * FROM conversation_history;
SELECT * FROM faq;
SELECT * FROM feedback;
SELECT * FROM model_version;

