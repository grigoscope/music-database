-- Active: 1754636841634@@127.0.0.1@5432@postgres@public
-- Genres
CREATE TABLE IF NOT EXISTS genres (
    genre_id 		SERIAL 			PRIMARY KEY,
    name            VARCHAR (60)	NOT NULL
);

-- Artists
CREATE TABLE IF NOT EXISTS artists (
    artist_id 		SERIAL 			PRIMARY KEY,
    name			VARCHAR (60)	NOT NULL
);

-- Genres and Artists link (many-to-many)
CREATE TABLE IF NOT EXISTS genres_artists (
    genre_id		INT				NOT NULL REFERENCES genres (genre_id),
    artist_id		INT				NOT NULL REFERENCES artists (artist_id),
					PRIMARY KEY (genre_id, artist_id)
);

-- Albums
CREATE TABLE IF NOT EXISTS albums (
    album_id		SERIAL			PRIMARY KEY,
    name 			VARCHAR (60)	NOT NULL,
    year			SMALLINT		NOT NULL
					CHECK (year >= 1900)
);

-- Artists and Albums link (many-to-many)
CREATE TABLE IF NOT EXISTS artists_albums (
    artist_id		INT				NOT NULL REFERENCES artists (artist_id),
    album_id		INT				NOT NULL REFERENCES albums (album_id),
					PRIMARY KEY (artist_id, album_id)
);

-- Tracks
CREATE TABLE IF NOT EXISTS tracks (
    track_id 		SERIAL 			PRIMARY KEY,
    name			VARCHAR(80)		NOT NULL,
    duration		INTEGER 		NOT NULL,
    album_id 		INT 			NOT NULL REFERENCES albums (album_id),
					CHECK (duration > 0)
);

-- Playlists
CREATE TABLE IF NOT EXISTS compilations (
    compilation_id  SERIAL			PRIMARY KEY,
    name			VARCHAR(120)	NOT NULL,
    year			SMALLINT		NOT NULL,
					CHECK (year >= 1900)
);

-- Tracks and albums link (many-to-many)
CREATE TABLE IF NOT EXISTS compilations_tracks (
    compilation_id	INT				REFERENCES compilations (compilation_id),
    track_id		INT				REFERENCES tracks (track_id),
					PRIMARY KEY (compilation_id, track_id)
);