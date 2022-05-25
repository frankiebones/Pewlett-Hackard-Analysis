# Pewlett Hackard prepares to ride the silver tsunami.
### An in depth look at those who are likely retiring soon and the prospects of a mentorship program to alleviate any staff issues caused by mass retirements.

Our goal was to utilize the Pewlett Hackard employee database to determine how many staff members are soon to be of retirement age and which departments are most likely to feel those affects. We then used that information to compile a list of those who were eligible and therefore may be worth approaching about a mentorship program.
This mentorship program would entail experienced and successful employees stepping back into a part-time role instead of retiring completely. Their new role in the company would be as a mentor to new hires.

# Results
### Our findings regarding the number of employees poised for retirement.
In order for us to compile the lists we needed, we first needed an understanding of the tables we had access to and how they relate to each other based on their primary and foreign keys.  
  
 The ERD, or Entity Relationship Diagram, below provides an overview of the schema of each table:
![EmployeeDB](https://user-images.githubusercontent.com/15967377/170278567-0d2dab56-78f5-4f43-9c7e-55fa95449549.png)

- the majority of those retiring are in Senior positions
- Management positions should be easy to fill as there will only be 2 available
- while there are over 1000 Assistant Engineers retiring, they are not likely candidates for the mentorship program 
- all who are retiring have at least 10 years experience within the company

# Summary
### We have provide some additional info that was not originally requested but may prove useful.

*How many roles will need to be filled as the "silver tsunami" begins to make an impact?*  
With 72,458 employees set to retire, there is a significant need for this mentorship program to take root.

Pewlett Hackard may benefit from some additional info as the average retirement age tends to vary based on gender.

```SQL
SELECT COUNT (gender) AS count, gender
FROM employees
GROUP BY gender
ORDER BY count DESC;
```
![gender](https://user-images.githubusercontent.com/15967377/170289403-4bb405f6-bacb-4223-9c91-bdcdc0fcca8a.PNG)

*Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?*  
Assuming those who are currently employed as Staff or Engineers could move up to Senior positions, and those who are Assistant Engineers could move up to Engineer positions, there should be enough qualified retirement-ready employees to help Pewlett Hackard transition just fine.  

If however, Pewlett Hackard only wanted to offer those with over 30 years experience in the company access to the mentorship program, their prospects would drop to under 1,000 employees.

```SQL
SELECT COUNT (title) AS count, title
FROM mentorship
WHERE from_date > '1992-01-01'
GROUP BY title
ORDER BY count DESC;
```
![senior_emp](https://user-images.githubusercontent.com/15967377/170287831-bba75d36-c8cd-4148-b1b0-504daedf79cb.PNG)
