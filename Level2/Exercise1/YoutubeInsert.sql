INSERT INTO users (email, password, username, birth_date, sex, country, zip_code) VALUES 
('jane.doe@example.com', 'password123', 'JaneDoe', '1990-01-15', 'F', 'Spain', '28001'),
('john.smith@example.com', 'password456', 'JohnSmith', '1985-05-20', 'M', 'USA', '90210');

INSERT INTO channels (name, description, user_email) VALUES 
('Jane\'s Channel', 'This is Jane\'s personal channel.', 'jane.doe@example.com'),
('John\'s Adventures', 'Travel and adventure videos by John.', 'john.smith@example.com');

INSERT INTO videos (title, description, size, file_name, duration, thumbnail, views, likes, dislikes, status, user_email) VALUES
('Cooking Video', 'A simple recipe demonstration.', 1048576, 'cooking.mp4', 300, 'cooking.jpg', 100, 10, 1, 'public', 'jane.doe@example.com'),
('Travel Video', 'A documentary on mountain adventures.', 2097152, 'travel.mp4', 600, 'travel.jpg', 250, 25, 5, 'public', 'john.smith@example.com');

INSERT INTO tags (name) VALUES ('Cooking'), ('Travel'), ('Documentary'), ('Recipe');

INSERT INTO video_tags (video_id, tag_id) VALUES 
(1, 1), (1, 4), (2, 2), (2, 3);

INSERT INTO subscriptions (user_email, channel_id) VALUES 
('jane.doe@example.com', 2);

INSERT INTO video_reactions (user_email, video_id, reaction) VALUES 
('jane.doe@example.com', 2, 'like'),
('john.smith@example.com', 1, 'dislike');

INSERT INTO playlists (name, status, user_email) VALUES 
('My Favorites', 'public', 'jane.doe@example.com'),
('Travel Collection', 'private', 'john.smith@example.com');

INSERT INTO playlist_videos (playlist_id, video_id) VALUES 
(1, 2),  
(2, 2);  

INSERT INTO comments (text, user_email, video_id) VALUES 
('Great video, I learned a lot!', 'jane.doe@example.com', 2),
('I did not like this video.', 'john.smith@example.com', 1);

INSERT INTO comment_reactions (comment_id, user_email, reaction) VALUES
(1, 'john.smith@example.com', 'like'),
(2, 'jane.doe@example.com', 'dislike');