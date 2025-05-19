CREATE DATABASE IF NOT EXISTS Spotify;
USE Spotify;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    username VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    country VARCHAR(50),
    postal_code VARCHAR(20),
    is_premium BOOLEAN DEFAULT FALSE
);
CREATE TABLE Subscription (
    subscription_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    start_date DATE NOT NULL,
    renewal_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    subscription_id INT,
    payment_type ENUM('CreditCard', 'PayPal') NOT NULL,
    payment_date DATE NOT NULL,
    order_number VARCHAR(100) UNIQUE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (subscription_id) REFERENCES Subscription(subscription_id)
);
CREATE TABLE CreditCard (
    payment_id INT PRIMARY KEY,
    card_number VARCHAR(20),
    expiration_month INT,
    expiration_year INT,
    security_code VARCHAR(10),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);
CREATE TABLE PayPal (
    payment_id INT PRIMARY KEY,
    paypal_username VARCHAR(50),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);
CREATE TABLE Playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(50),
    song_count INT DEFAULT 0,
    created_at DATE,
    is_deleted BOOLEAN DEFAULT FALSE,
    deleted_at DATE,
    is_shared BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
CREATE TABLE Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    image_url TEXT
);
CREATE TABLE Album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    title VARCHAR(50),
    release_year YEAR,
    cover_image_url TEXT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);
CREATE TABLE Song (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT,
    title VARCHAR(50),
    duration TIME,
    play_count INT DEFAULT 0,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);
CREATE TABLE Playlist_Song (
    playlist_id INT,
    song_id INT,
    added_by INT,
    added_at DATE,
    PRIMARY KEY (playlist_id, song_id),
    FOREIGN KEY (playlist_id) REFERENCES Playlist(playlist_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id),
    FOREIGN KEY (added_by) REFERENCES User(user_id)
);
CREATE TABLE User_Artist_Follow (
    user_id INT,
    artist_id INT,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);
CREATE TABLE Artist_Related (
    artist_id INT,
    related_artist_id INT,
    PRIMARY KEY (artist_id, related_artist_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (related_artist_id) REFERENCES Artist(artist_id)
);
CREATE TABLE User_Favorite_Album (
    user_id INT,
    album_id INT,
    PRIMARY KEY (user_id, album_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);
CREATE TABLE User_Favorite_Song (
    user_id INT,
    song_id INT,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (song_id) REFERENCES Song(song_id)
);