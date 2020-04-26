-- SUM and COUNT Tutorial

-- Question 1
SELECT SUM(population) AS total_pop
FROM world

-- Question 2
SELECT DISTINCT continent
FROM world

-- Question 3
SELECT SUM(gdp) AS tot_gdp_Africa
FROM world
WHERE continent = 'Africa'

-- Question 4
SELECT COUNT(name) AS total
FROM world
WHERE area >= 1000000

-- Question 5
SELECT SUM(population) AS total
FROM world
WHERE name IN ('Estonia',
               'Latvia',
               'Lithuania')

-- Question 6
SELECT continent, COUNT(name) AS num_countries
FROM world
GROUP BY continent

-- Question 7
SELECT continent, COUNT(name) AS total
FROM world
WHERE population >= 10000000
GROUP BY continent

-- Question 8
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000


-- QUIZ
1. C
2. A
3. D
4. E
5. B
6. E
7. D
8. D