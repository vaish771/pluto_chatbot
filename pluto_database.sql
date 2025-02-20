CREATE DATABASE PlutoChatbot;
USE PlutoChatbot;

-- Table to store user messages and chatbot responses (conversation history)
CREATE TABLE conversation_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(50),  -- Unique identifier for each user
    user_message TEXT,
    bot_response TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table to store user information
CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,  
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table to store FAQs (from past 10 days)
CREATE TABLE faq (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question TEXT,
    answer TEXT,
    last_asked TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

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



-- Table to store chatbot model versions
CREATE TABLE model_version (
    id INT AUTO_INCREMENT PRIMARY KEY,
    version_number VARCHAR(10),
    description TEXT,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Query to get conversation history for a specific user
SELECT * FROM conversation_history WHERE user_id = 'User_123' ORDER BY timestamp DESC;

-- Query to get FAQs from the last 10 days
SELECT question, answer FROM faq WHERE last_asked >= NOW() - INTERVAL 10 DAY;

-- Query to get the latest chatbot model version
SELECT version_number, description FROM model_version ORDER BY updated_on DESC LIMIT 1;
