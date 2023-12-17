/* Starting by getting a feel for the stream table and the chat table. We will see the first top 20 rows and names of columns, the names of games and channels.
*/ 
SELECT * FROM stream
LIMIT 20;

SELECT * FROM chat
LIMIT 20; 

/* Looking for the unique games and channels in the "stream" table.*/

SELECT DISTINCT game FROM stream;
SELECT DISTINCT channel FROM stream;

/* Looking for the most popular games in the stream table */  
SELECT game, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC; */

/*Where are located the gamers of LOL? */ 
SELECT game, country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY country
ORDER BY 3 DESC; */

/* Creating a list of players and their number of streamers. */ 
SELECT player, COUNT(*)
FROM stream
GROUP BY player
ORDER BY 2 DESC;

/*Here I will categorize each game by its genre: */
SELECT game,
CASE
WHEN
game = 'League of Legends' THEN 'MOBA'
WHEN
game = 'Dota 2' THEN 'MOBA'
WHEN
game = 'Heroes of the Storm' THEN 'MOBA'
WHEN
game = 'Counter-Strike: Global Offensive' THEN 'FPS'
WHEN
game = 'DayZ' THEN 'Survival'
WHEN
game = 'ARK: Survival Evolved' THEN 'Survival'
ELSE 'Other'
END AS 'genre',
COUNT(*)
FROM stream
GROUP BY game
ORDER BY 3 DESC; */

/* Taking a look at the "time" column */ 
SELECT time
FROM stream
LIMIT 10;

/*Let's return a formatted date of them' /* 
SELECT time,
strftime('%S', time)
FROM stream
GROUP BY 1
LIMIT 20; */

/*Here goes a query that returns 2 columns: the hours of the time column and the view count for each hour.
/* 
SELECT strftime('%H', time), COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

/* Let's join the two tables on the column that they share: device_id' /* 
SELECT * FROM stream
JOIN chat
ON stream.device_id = chat.device_id;
