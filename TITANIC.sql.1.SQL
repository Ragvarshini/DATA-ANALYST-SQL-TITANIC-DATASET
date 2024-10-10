SELECT * FROM titanic_project1_sql;
USE titanic_project1_sql;

-- 1 show first 10 rows of the dataset.
SELECT * FROM titanic LIMIT 10;

-- 2 show the last 10 rows of the dataset.
SELECT * FROM titanic ORDER BY passengerId DESC LIMIT 10; 

-- 3 find the number of parrenger who survived
SELECT count(*) AS "passenger_survived" FROM  titanic WHERE survived=1;

-- 4 find the average age of passengers
SELECT AVG (age)  FROM titanic;

-- 5 find the number of passengers in each class
SELECT Pclass , count(*) as "No_of_Passengers" FROM titanic GROUP BY Pclass;

-- 6 Find the first 10 rows of the dataset sorted by passenger class in descending order
SELECT * FROM titanic ORDER BY 	Pclass  desc limit 10;

-- 7 Find the number of passenger in each class sorted by class in ascending order.
Select Pclass, count(*) from titanic GROUP BY Pclass  ORDER BY Pclass ASC ;

-- 8 Find the average fare paid by passengers in each class.
SELECT  Pclass, AVG (fare) AS "Avg_Fare"FROM titanic GROUP BY Pclass;

-- 9 Find the name of the passenger with the highest fare.
SELECT Name , fare FROM titanic where fare = (SELECT MAX(fare) FROM titanic);
-- finding maximum fare passenger -- SELECT MAX(fare) FROM titanic; 

-- 10 Find the name of the passenger who had the highest age among the surviours.
SELECT Name , Age  FROM titanic WHERE Age= (SELECT MAX(age) FROM TITANIC WHERE Survived =1) AND survived =1; 
-- SELECT MAX(age) FROM TITANIC WHERE Survived =1; 

-- 11 Find the number of passengers who paid more than the average fare .
SELECT COUNT(*) AS Number_passenger FROM titanic WHERE Fare > (SELECT  avg(fare) from titanic);
-- SELECT  avg(fare) from titanic ;

-- 12 Find the name of the passenger who had the most parents or children on board . 
SELECT name , Parch from titanic WHERE Parch  = (SELECT MAX(Parch) FROM titanic);
-- SELECT MAX(Parch) FROM titanic;

-- 13 Find the number of male and female passengers who survived,
-- and order the results by sex in ascending order . 
SELECT sex, count(*) AS "Name survived"FROM titanic WHERE survived =1
GROUP BY Sex
ORDER BY Sex ASC  ;

-- 14 Find the name, age, and fare of the oldest passenger who survived . 
SELECT name, age, fare  FROM titanic WHERE Age = (SELECT MAX(Age) from titanic WHERE  Survived =1) and survived =1;
-- SELECT MAX(Age) from titanic WHERE  Survived =1;

-- 15 Find the name and age of the youngest female passenger who survived in third class . 
SELECT Name , age , pclass FROM titanic where age=  (SELECT min(age)FROM titanic where sex = "female" AND Pclass = 3 and survived = 1) and Pclass = 3 and survived =1;
-- SELECT min(age)FROM titanic where sex = "female" AND Pclass = 3 and survived = 1;

-- 16 Find the number of male and female passengers . 
SELECT 
SUM(CASE WHEN Sex = "male" then 1 else 0 end) AS num_male,
SUM(CASE WHEN Sex = "female" then 1 else 0 end ) AS num_female 
FROM titanic;

-- 17 Select all passengers who travelled in a cabin that was not shared by other passengers . 
SELECT * FROM titanic WHERE cabin NOT IN  (SELECT cabin FROM titanic GROUP BY cabin HAVING count(*) >1);
-- SELECT cabin FROM  titanic GROUP BY cabin HAVING  count(*) >1;
