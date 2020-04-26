-- More JOIN operations Tutorial

-- Question 1
SELECT id, title
FROM movie
WHERE yr = 1962

-- Question 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

-- Question 3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

-- Question 4
SELECT id
FROM actor
WHERE name = 'Glenn Close'

-- Question 5
SELECT id
FROM movie
WHERE title = 'Casablanca'

-- Question 6
SELECT actor.name
FROM actor
INNER JOIN casting ON casting.actorid = actor.id
INNER JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Casablanca'

-- Question 7
SELECT actor.name
FROM actor
INNER JOIN casting ON casting.actorid = actor.id
INNER JOIN movie ON movie.id = casting.movieid
WHERE movie.title = 'Alien'

-- Question 8
SELECT movie.title
FROM actor
INNER JOIN casting ON casting.actorid = actor.id
INNER JOIN movie ON movie.id = casting.movieid
WHERE actor.name = 'Harrison Ford'

-- Question 9
SELECT movie.title
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
AND casting.ord <> 1

-- Question 10
SELECT movie.title, actor.name
FROM actor
INNER JOIN casting ON casting.actorid = actor.id
INNER JOIN movie ON movie.id = casting.movieid
WHERE movie.yr = 1962
AND casting.ord = 1

-- Difficult Questions
-- Question 11
SELECT movie.yr, COUNT(movie.title) AS num_movies
FROM movie
INNER JOIN casting ON movie.id = casting.movieid
INNER JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'John Travolta'
GROUP BY movie.yr
HAVING COUNT(movie.title) > 2

-- Question 12
SELECT movie.title, actor.name
FROM casting
INNER JOIN movie ON casting.movieid = movie.id
INNER JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
AND movie.id IN
    (SELECT casting.movieid
     FROM casting
     INNER JOIN movie ON casting.movieid = movie.id
     INNER JOIN actor ON casting.actorid = actor.id
     WHERE actor.name = 'Julie Andrews')

-- Question 13
SELECT actor.name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON casting.movieid = movie.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(movie.title) >= 30
ORDER BY actor.name

-- Question 14
SELECT movie.title,
       COUNT(casting.actorid) AS cast
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON casting.movieid = movie.id
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title

-- Question 15
SELECT actor.name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON casting.movieid = movie.id
WHERE casting.movieid =
      ANY(SELECT casting.movieid
          FROM actor
          INNER JOIN casting
          ON actor.id = casting.actorid
          INNER JOIN movie
          ON casting.movieid = movie.id
          WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel'

-- QUIZ
1. C
2. E
3. C
4. B
5. D
6. C
7. B