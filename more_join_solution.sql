-- The JOIN operation Tutorial

-- Question 1
SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

-- Question 2
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012

-- Question 3
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game
INNER JOIN goal ON (game.id=goal.matchid)
WHERE goal.teamid = 'GER'

-- Question 4
SELECT game.team1, game.team2, goal.player
FROM game
INNER JOIN goal ON game.id = goal.matchid
WHERE goal.player LIKE 'Mario%'

-- Question 5
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal
INNER JOIN eteam ON goal.teamid = eteam.id
WHERE gtime <= 10

-- Question 6
SELECT game.mdate, eteam.teamname
FROM game
INNER JOIN eteam ON eteam.id = game.team1
WHERE eteam.coach = 'Fernando Santos'

-- Question 7
SELECT goal.player
FROM goal
INNER JOIN game ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw'

-- Difficult questions
-- Question 8
SELECT DISTINCT goal.player
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE (game.team1 = 'GER' OR game.team2 = 'GER')
AND goal.teamid != 'GER'

-- Question 9
SELECT eteam.teamname,
       COUNT(goal.player) AS goals
FROM eteam
INNER JOIN goal ON eteam.id = goal.teamid
GROUP BY eteam.teamname

-- Question 10
SELECT game.stadium,
       COUNT(goal.player) AS goals
FROM game
INNER JOIN goal ON goal.matchid = game.id
GROUP BY game.stadium

-- Question 11
SELECT goal.matchid, game.mdate,
       COUNT(goal.player) AS goals
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE game.team1 = 'POL'
OR game.team2  = 'POL'
GROUP BY goal.matchid, game.mdate

-- Question 12
SELECT goal.matchid, game.mdate,
       COUNT(goal.player) AS goals
FROM game
INNER JOIN goal ON goal.matchid = game.id
WHERE goal.teamid = 'GER'
GROUP BY goal.matchid, game.mdate

-- Question 13
SELECT game.mdate,
       game.team1,
       SUM(CASE WHEN goal.teamid = game.team1
                THEN 1
                ELSE 0
           END)
       AS score1,
       game.team2,
       SUM(CASE WHEN goal.teamid = game.team2
                THEN 1
                ELSE 0
           END)
       AS score2
FROM game
LEFT JOIN goal ON goal.matchid = game.id
GROUP BY game.mdate, game.team1, game.team2
ORDER BY game.mdate

-- QUIZ
1. D
2. C
3. A
4. A
5. B
6. C
7. B