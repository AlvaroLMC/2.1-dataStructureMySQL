CREATE DATABASE IF NOT EXISTS Youtube;
USE Youtube;

CREATE TABLE users (
    email VARCHAR(50) PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    username VARCHAR(50) NOT NULL,
    birth_date DATE,
    sex ENUM('M', 'F', 'Other'),
    country VARCHAR(50),
    zip_code VARCHAR(20)
);
CREATE TABLE channels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_email VARCHAR(255),
    FOREIGN KEY (user_email) REFERENCES users(email)
);
CREATE TABLE videos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    description TEXT,
    size INT,
    file_name VARCHAR(50),
    duration INT,
    thumbnail VARCHAR(50),
    views INT DEFAULT 0,
    likes INT DEFAULT 0,
    dislikes INT DEFAULT 0,
    status ENUM('public', 'hidden', 'private') DEFAULT 'public',
    publication_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_email VARCHAR(50),
    FOREIGN KEY (user_email) REFERENCES users(email)
);
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE video_tags (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);
CREATE TABLE subscriptions (
    user_email VARCHAR(50),
    channel_id INT,
    subscription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_email, channel_id),
    FOREIGN KEY (user_email) REFERENCES users(email),
    FOREIGN KEY (channel_id) REFERENCES channels(id)
);
CREATE TABLE video_reactions (
    user_email VARCHAR(50),
    video_id INT,
    reaction ENUM('like', 'dislike') NOT NULL,
    reaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_email, video_id),
    FOREIGN KEY (user_email) REFERENCES users(email),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);
CREATE TABLE playlists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('public', 'private') DEFAULT 'public',
    user_email VARCHAR(255),
    FOREIGN KEY (user_email) REFERENCES users(email)
);
CREATE TABLE playlist_videos (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(id),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text TEXT NOT NULL,
    comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_email VARCHAR(50),
    video_id INT,
    FOREIGN KEY (user_email) REFERENCES users(email),
    FOREIGN KEY (video_id) REFERENCES videos(id)
);
CREATE TABLE comment_reactions (
    comment_id INT,
    user_email VARCHAR(50),
    reaction ENUM('like', 'dislike') NOT NULL,
    reaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id, user_email),
    FOREIGN KEY (comment_id) REFERENCES comments(id),
    FOREIGN KEY (user_email) REFERENCES users(email)
);