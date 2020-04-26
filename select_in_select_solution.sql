-- SELECT within SELECT Tutorial

-- Question 1
SELECT name
FROM world
WHERE population >
     (SELECT population
      FROM world
      WHERE name ='Russia')

-- Question 2
SELECT name
FROM world
WHERE continent = 'Europe'
AND (gdp/population) >
    (SELECT (gdp/population)
     FROM world
     WHERE name = 'United Kingdom')

-- Question 3
SELECT name, continent
FROM world
WHERE continent =
      (SELECT continent
       FROM world
       WHERE name ='Argentina')
OR continent =
      (SELECT continent
       FROM world
       WHERE name ='Australia')
ORDER BY name

-- Question 4
SELECT name, population
FROM world
WHERE population >
      (SELECT population
       FROM world
       WHERE name = 'Canada')
AND population <
      (SELECT population
       FROM world
       WHERE name = 'Poland')

-- Question 5
SELECT name,
       CONCAT(ROUND(population * 100 /
       (SELECT population
        FROM world
        WHERE name = 'germany')), '%')
        AS per_german_pop
FROM world
WHERE continent = 'Europe'

-- Question 6
SELECT name
FROM world
WHERE gdp >
      (SELECT gdp
       FROM world
       WHERE continent = 'Europe'
       ORDER BY gdp DESC LIMIT 1)

-- Question 7
SELECT continent, name, area
FROM world AS x
WHERE area >=
      ALL
      (SELECT area
       FROM world AS y
       WHERE y.continent = x.continent
       AND area > 0)

-- Question 8
SELECT DISTINCT continent,
                (SELECT name
                 FROM world AS y
                 WHERE y.continent = x.continent
                 ORDER BY name LIMIT 1)
FROM world AS x

-- Difficult Questions
-- Question 9
SELECT name, continent, population
FROM world
WHERE continent NOT IN
      (SELECT continent
       FROM world
       WHERE population > 25000000
       GROUP BY continent);

-- Question 10
SELECT name, continent
FROM world AS x
WHERE population >
      ALL
      (SELECT population * 3
       FROM world AS y
       WHERE x.continent = y.continent
       AND x.name <> y.name);

-- Quiz
1. C
2. B
3. A
4. D
5. B
6. B
7. B