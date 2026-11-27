# Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS);


# Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT E.*
FROM EMPLOYEES E
INNER JOIN JOBS J
        ON E.JOB_ID = J.JOB_IDENT
     WHERE J.JOB_TITLE = "Jr. Designer";


# Retrieve JOB information and who earn more than $70,000.
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
  FROM JOBS WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE SALARY > 70000 );


# Retrieve JOB information and list of employees whose birth year is after 1976.
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
  FROM JOBS WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976 );


# Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
SELECT * FROM ( SELECT EMP_ID, F_NAME, L_NAME, DEP_ID FROM EMPLOYEES) AS EMP4ALL;

SELECT * EXCEPT (SSN, B_DATE, SEX, ADDRESS, SALARY) FROM EMPLOYEES;   -- BigQuery
SELECT * EXCLUDE (SSN, B_DATE, SEX, ADDRESS, SALARY) FROM EMPLOYEES;  -- Snowflake, DuckDB


#  Retrieve all employee records whose salary is lower than the average salary.
SELECT * FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);


# The team A wants to see all employees whose address is in Elgin,IL.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';


# The team A wants to get all employees who were born during the 1970's.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%';


# The team A wants to retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

        
# Retrieve a list of employees ordered by department ID.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;

        
# HR department wants a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

        
# CHO wants to see the data - department name instead of department ID in the query data. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.
SELECT D.DEP_NAME, E.F_NAME, E.L_NAME 
FROM EMPLOYEES as E, DEPARTMENTS as D
WHERE E.DEP_ID = D.DEPT_ID_DEP
ORDER BY D.DEP_NAME, E.L_NAME DESC;

        
# For each department ID, retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

        
# For each department retrieve the number of employees in the department, and the average employee salary in the department.
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;




