INSERT INTO User (email, password, username, birth_date, gender, country, postal_code, is_premium)
VALUES 
('alice@example.com', 'securepass1', 'Alice123', '1995-06-15', 'Female', 'USA', '90210', TRUE),
('bob@example.com', 'securepass2', 'BobbyB', '1990-02-20', 'Male', 'UK', 'E1 6AN', FALSE),
('charlie@example.com', 'securepass3', 'CharlieM', '1988-11-05', 'Other', 'Canada', 'H2X 1Y4', TRUE);

INSERT INTO Subscription (user_id, start_date, renewal_date)
VALUES 
(1, '2025-01-01', '2025-06-01'),
(3, '2025-03-15', '2025-09-15');

INSERT INTO Payment (subscription_id, payment_type, payment_date, order_number, total)
VALUES 
(1, 'CreditCard', '2025-01-01', 'ORD1001', 59.99),
(2, 'PayPal', '2025-03-15', 'ORD1002', 59.99);

INSERT INTO CreditCard (payment_id, card_number, expiration_month, expiration_year, security_code)
VALUES 
(1, '4111111111111111', 12, 2026, '123');

INSERT INTO PayPal (payment_id, paypal_username)
VALUES 
(2, 'charlie@paypal.com');

INSERT INTO Artist (name, image_url)
VALUES 
('The Echoes', 'https://example.com/echoes.jpg'),
('DJ Sonic', 'https://example.com/djsonic.jpg');

INSERT INTO Album (artist_id, title, release_year, cover_image_url)
VALUES 
(1, 'Reflections', 2020, 'https://example.com/reflections.jpg'),
(2, 'Beats Unlimited', 2023, 'https://example.com/beats.jpg');

INSERT INTO Song (album_id, title, duration, play_count)
VALUES 
(1, 'Mirror World', '00:03:45', 1500),
(1, 'Time Shift', '00:04:12', 1200),
(2, 'Drop the Beat', '00:02:50', 2300);

INSERT INTO Playlist (user_id, title, song_count, created_at, is_deleted, is_shared)
VALUES 
(1, 'Workout Mix', 2, '2025-05-01', FALSE, TRUE),
(2, 'Relax Vibes', 1, '2025-05-10', TRUE, FALSE);

INSERT INTO Playlist_Song (playlist_id, song_id, added_by, added_at)
VALUES 
(1, 1, 1, '2025-05-01'),
(1, 3, 1, '2025-05-01'),
(2, 2, 2, '2025-05-10');

INSERT INTO User_Artist_Follow (user_id, artist_id)
VALUES 
(1, 1),
(1, 2),
(3, 1);

INSERT INTO Artist_Related (artist_id, related_artist_id)
VALUES 
(1, 2),
(2, 1);

INSERT INTO User_Favorite_Album (user_id, album_id)
VALUES 
(1, 1),
(3, 2);

INSERT INTO User_Favorite_Song (user_id, song_id)
VALUES 
(1, 1),
(1, 3),
(3, 2);

