-- Active: 1754636841634@@127.0.0.1@5432@postgres@public
-- Inserting artists
INSERT INTO 
    artists (name)
VALUES 
    ('Imagine Dragons'),
    ('Linkin Park'),
    ('Eminem'),
    ('Billie Eilish')

-- Inserting genres
INSERT INTO 
    genres (name)
VALUES
    ('Alternative'),
    ('Rock'),
    ('Rap'),
    ('Pop')

-- Inserting albums
INSERT INTO
    albums (name, year)
VALUES
    ('Night Visions',                            2012),
    ('Evolve',                                   2017),
    ('Hybrid Theory',                            2000),
    ('Meteora',                                  2003),
    ('The Marshall Mathers LP',                  2000),
    ('The Eminem Show',                          2002),
    ('When We All Fall Asleep, Where Do We Go?', 2019),
    ('Happier Than Ever',                        2020);

-- Inserting tracks
INSERT INTO
    tracks (name, duration, album_id)
VALUES
    ('Radioactive',        186, 1),
    ('I Am So Sorry',      180, 1)
    ('Demons',             177, 1),
    ('Believer',           204, 2),
    ('Thunder',            187, 2),
    ('In the End',         216 ,3),
    ('Crawling',           209, 3),
    ('Numb',               187, 4),
    ('Somewhere I Belong', 213, 4),
    ('Stan',               404, 5),
    ('The Real Slim Shady',284, 5),
    ('Without Me',         290, 6),
    ('Sing for the Moment',339, 6),
    ('bad guy',            194, 7),
    ('bury a friend',      193, 7),
    ('Happier Than Ever',  298, 8),
    ('Therefore I Am',     174, 8);

-- Inserting compilations
INSERT INTO
    compilations (name, year)
VALUES
    ('Favourite',   2015),
    ('Random',      2019),
    ('Popular',     2022),
    ('Liked',       2025);

-- Link artists with albums
INSERT INTO
    artists_albums (artist_id, album_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 8);

-- Link compilations with tracks
INSERT INTO
    compilations_tracks (track_id, compilation_id)
VALUES
    (2,  1),
    (3,  1),
    (4,  1),
    (5,  1),
    (6,  2),
    (7,  2),
    (8,  2),
    (9,  2),
    (10, 3),
    (11, 3),
    (12, 3),
    (13, 3),
    (14, 4),
    (15, 4),
    (16, 4),
    (17, 4);

-- Link genres with artists
INSERT INTO
    genres_artists (genre_id, artist_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);
