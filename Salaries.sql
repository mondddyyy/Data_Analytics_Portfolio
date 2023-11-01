use data_new;
-- 1 Show all data columns and rows in the table
SELECT * FROM salaries;

-- 2 Show only the EmployeeName and Job Title columns
SELECT EmployeeName,JobTitle FROM salaries;

-- 3 Show the number of employees in the table
SELECT COUNT(*) FROM salaries;

-- 4 Show unique job titles in the table
SELECT DISTINCT JobTitle FROM salaries;

-- 5 Show job title and overtime pay for employees with overtime pay greater than 10000
SELECT ID, JobTitle, OvertimePay FROM salaries 
WHERE OvertimePay > 100000;

-- 6 Show the average base pay for all employees
SELECT AVG(BasePay) AS "Average BasePay" FROM salaries;

-- 7 Show the top 10 highest paid employees and Job Title
SELECT ID, EmployeeName, JobTitle, TotalPay FROM salaries 
ORDER BY TotalPay DESC LIMIT 5;

-- 8 Show the average of BasePay, OvertimePay and OtherPay for each employee
SELECT EmployeeName, (BasePay + OvertimePay + OtherPay) / 3 
AS "Average_BasePay_OvertimePay_OtherPay" FROM salaries;

-- 9 Show "Manager" job title from all employees
SELECT EmployeeName, JobTitle FROM salaries 
WHERE JobTitle LIKE '%Manager%';

-- 10 Show all employee job title except "Manager"
SELECT EmployeeName, JobTitle FROM salaries WHERE JobTitle <> 'Manager';

-- 11 Show all role of employees with total pay between 100,000 and 150,000
SELECT * FROM salaries
WHERE TotalPay >= 100000 AND TotalPay <= 150000;

-- 12 Show all employee with base pay less than 50,000 or total pay greater than 100,000
SELECT * FROM salaries WHERE BasePay < 50000 OR TotalPay > 100000;

-- 13 Show all role "Director" employee with total pay benefits value 
-- between 100,000 and 150,000
SELECT * FROM salaries WHERE JobTitle LIKE '%Director%'
AND TotalPayBenefits BETWEEN 100000 AND 150000;

-- 14 Show all employees ordered by total pay benefits in descending order
SELECT * FROM salaries ORDER BY TotalPayBenefits DESC;

-- 15 Show all job titles with average base pay at least 100,000 and order them
-- by the average base pay in descending order
SELECT JobTitle, AVG(BasePay) AS "avgbasepay" FROM salaries
GROUP BY JobTitle HAVING AVG(BasePay) >= 100000
ORDER BY avgbasepay DESC;

-- 16 Delete the empty column
ALTER TABLE salaries DROP COLUMN Benefits, DROP COLUMN Notes, DROP COLUMN STATUS;
SELECT * FROM salaries;

-- 17 Update base pay all employees with 
-- job title containing "Manager" by increasing it by 10%
UPDATE salaries SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE "%Manager%";
SELECT * FROM salaries;

-- 18 Delete all employees who have no OvertimePay
SELECT COUNT(*) FROM salaries WHERE OvertimePay =0;
DELETE FROM salaries WHERE OvertimePay =0;
SELECT COUNT(*) FROM salaries WHERE OvertimePay =0;