-- Active: 1754636841634@@127.0.0.1@5432@postgres@public
--- Task 2
--- 1. Name and duration of max duration track
SELECT	
	name,
	MAX(duration) AS duration
FROM 
	tracks
GROUP BY
	name
ORDER BY
	duration DESC
LIMIT 1;

-- 2. Name of tracks where duration < 3.5 minutes
SELECT
	name
FROM
	tracks
WHERE
	duration >= 3.5;

-- 3. Compinations from 2018 to 2020
SELECT
	name
FROM
	compilations
WHERE
	year >= 2018
	AND year <= 2020;

-- 4. One word name of artists
SELECT
	name
FROM 
	artists 
WHERE
	name NOT LIKE '% %';

-- 5. Track names contain words "мой" or "my"
SELECT
	name
FROM
	tracks
WHERE
	name LIKE '%мой%'
	OR name LIKE '%my%';

-- Task 3
-- 1. Amount of artists in each genre
SELECT
	g.name, 
	COUNT(DISTINCT ga.artist_id)
FROM 
	genres_artists ga
LEFT JOIN
	genres g
	ON g.genre_id = ga.genre_id 
GROUP BY
	g.name;

-- 2. Amount of tracks in albums from 2019 to 2020
SELECT
	COUNT(DISTINCT t.track_id)
FROM 
	tracks t
LEFT JOIN
	albums a
	ON a.album_id = t.album_id 
WHERE
	a.year BETWEEN 2019 AND 2020;

-- 3. Average track durations for each album
SELECT 
	a.name,
	ROUND(AVG (t.duration), 1)
FROM 
	tracks t
JOIN
	albums a
	ON a.album_id = t.album_id
GROUP BY
	a.name;

-- 4. Artists who didn't release albums in 2020
SELECT
	a.artist_id,
	a.name
FROM
	artists a
LEFT JOIN (
	SELECT 
		DISTINCT aa.artist_id
	FROM
		artists_albums aa
	JOIN
		albums al
		ON al.album_id = aa.album_id
	WHERE
		al.year = 2020
	) y
	ON a.artist_id = y.artist_id
WHERE
	y.artist_id IS NULL;

-- 5. Compilations having Imagine Dragons
SELECT
	DISTINCT c.compilation_id,
	c.name
FROM
	compilations c
JOIN 
	compilations_tracks ct
	ON ct.compilation_id = c.compilation_id
JOIN
	tracks t
	ON t.track_id = ct.track_id
JOIN
	albums al
	ON al.album_id = t.album_id
JOIN
	artists_albums aa
	ON aa.album_id = al.album_id
JOIN
	artists a
	ON aa.artist_id = a.artist_id
WHERE
	a.name = 'Imagine Dragons';

-- Task 4
-- 1. Album names having artist of more than one genre
SELECT
	al.name
FROM
	albums al
JOIN
	artists_albums aa
	ON aa.album_id = al.album_id
JOIN
	artists a
	ON a.artist_id = aa.artist_id
JOIN
	genres_artists ga
	ON ga.artist_id = a.artist_id
JOIN
	genres g
	ON ga.genre_id = g.genre_id
GROUP BY
	al.name
HAVING
	COUNT (g.name) > 1;

-- 2. Traks not included in compilations
SELECT
	t.name
FROM 
	tracks t
LEFT JOIN
	compilations_tracks ct
	ON ct.track_id = t.track_id
LEFT JOIN
	compilations c
	ON c.compilation_id = ct.compilation_id
WHERE
	c.compilation_id IS NULL;

-- 3. Artist(s) released the most short track
SELECT
	a.name,
	MIN (t.duration)
FROM
	artists a
JOIN
	artists_albums aa
	ON aa.artist_id = a.artist_id
JOIN
	albums al
	ON al.album_id = aa.album_id
JOIN
	tracks t
	ON t.album_id = al.album_id
WHERE 
	t.duration = (
		SELECT
			MIN (duration)
		FROM tracks
)
GROUP BY
	a.name;

-- 4. Album names with minimal amount of tracks
SELECT
	t.album_id,
	a.name
FROM
	tracks t
LEFT JOIN
	albums a
	ON a.album_id = t.album_id
GROUP BY
	t.album_id,
	a.name
ORDER BY
	a.name DESC
LIMIT 1;
