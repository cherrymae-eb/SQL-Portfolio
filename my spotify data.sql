-- specify the database where the table is located:
USE own_database;

-- retrieve all records  froo myspotify_data table:
SELECT * 
FROM myspotify_data;

-- retrieve records for a specific artist:
SELECT *
FROM myspotify_data
WHERE artistName = 'Lana Del Rey';

-- retrieve records for a specific song:
SELECT *
FROM myspotify_data
WHERE trackName = 'Black Beauty';

-- retrieve records for a specific song:
SELECT *
FROM myspotify_data
WHERE trackName = "Would've, Could've, Should've";

-- calculate the total milliseconds played for all artist:
SELECT artistName,
	SUM(msPlayed) AS totalPlaytime
FROM myspotify_data
GROUP BY artistName;

-- my top 5 artists based on the total amount of milliseconds the song was played:
SELECT artistName,
	SUM(msPlayed) AS totalPlaytime
FROM myspotify_data
GROUP BY artistName
ORDER BY totalPlaytime DESC
LIMIT 5;

-- calculate the total milliseconds played for each song:
SELECT trackName, 
	SUM(msPlayed) AS totalPlaytime
FROM myspotify_data
GROUP BY trackName;

-- my top 10 songs based on the total amount of milliseconds the song was played:
SELECT 
	trackName,
    artistName,
	SUM(msPlayed) AS totalPlaytime
FROM myspotify_data
GROUP BY trackName, artistName
ORDER BY totalPlaytime DESC
LIMIT 10;

-- my most played song
SELECT 
	trackName,
    artistName,
	COUNT(trackName) AS playCount
FROM myspotify_data
GROUP BY trackName, artistName
ORDER BY playCount DESC
LIMIT 1;

-- songs played on specific date
SELECT *
FROM myspotify_data
WHERE DATE(endTime) = '2022-07-17';

-- my listens by hour of day
SELECT HOUR(endTime) AS hour_of_day,
	COUNT(endTime) as listens
FROM myspotify_data
GROUP BY hour_of_day
ORDER BY hour_of_day;
-- this query extracts the hour from the "end_time" column using the HOUR() function
-- it then counts the number of listens for each hour of the day using COUNT()

