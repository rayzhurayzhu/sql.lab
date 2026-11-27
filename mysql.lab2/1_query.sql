# Calculates the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST. (built-in function)
SELECT SUM(COST) AS SUM_OF_COST FROM PETRESCUE;


# Displays the maximum quantity of animals rescued.
SELECT MAX(QUANTITY) FROM PETRESCUE;

# the average cost of animals rescued
select AVG(COST) from PETRESCUE;

# Displays the average cost of rescuing a dog.
SELECT AVG(COST/QUANTITY) FROM PETRESCUE WHERE ANIMAL = 'Dog';

# Display the rounded cost of each rescue
SELECT ROUND(COST) FROM PETRESCUE;

# Find out the length of each animal's name
SELECT LENGTH(ANIMAL) FROM PETRESCUE

# Display animal name in each rescue in uppercase without duplications
SELECT DISTINCT(UCASE(ANIMAL)) FROM PETRESCUE

# Display the day of the month when cats have been rescued.
SELECT DAY(RESCUEDATE) FROM PETRESCUE
WHERE ANIMAL = "Cat";

# Display the number of rescues on the 5th month.
SELECT SUM(QUANTITY) FROM PETRESCUE WHERE MONTH(RESCUEDATE)='05';

# Display the number of rescues on the 14th day of the month.
SELECT SUM(QUANTITY) FROM PETRESCUE
WHERE DAY(RESCUEDATE) = 14;

# Animals rescued should see the vet within three days of arrivals. Displays the third day from each rescue.
SELECT *, DATE_add(RESCUEDATE, INTERVAL 3 DAY) FROM PETRESCUE;
  
# Display the length of time the animals have been rescued; the difference between today's date and the rescue date.
SELECT DATEDIFF(CURRENT_TIMESTAMP, RESCUEDATE) FROM PETRESCUE;
