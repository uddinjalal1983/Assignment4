
-- ASSIGNMENT No. 4
-- Md. Jalal Uddin
/*
Please create an organization chart for a real or imagined organization, implemented in a single SQL table.
Your deliverable script should:
1. Create the table. Each row should minimally include the person’s name, the person’s supervisor, and the
person’s job title. Using ID columns is encouraged.
2. Populate the table with a few sample rows.
3. Provide a single SELECT statement that displays the information in the table,showing who reports to whom

Goal: Create a organizational chart for the company name CSAAH

Sources:
http://www.mysqltutorial.org/mysql-self-join/ 
The Language of SQL- By Larry Rockoff Page 132

1. Nadia Islam (CEO), Rank-10, Supervisor-Null
2. Rebeca Park (Assistant), Rank-11, Supervisor-Nadia Islam (CEO)
3. Jennifer Zenwick (First Vice President), Rank-12, Supervisor-Nadia Islam (CEO)
4. Priscilla Lopez (Second Vice President), Rank-12, Supervisor-Nadia Islam (CEO)
5. Lindsey Riley (Third Vice President), Rank-12, Supervisor-Nadia Islam (CEO)
6. Lynna Zhong (Project Manager 1), Rank-13, Supervisor-Jennifer Zenwick (First Vice President)
7. Randy Persad (Project Manager 2), Rank-13, Supervisor-Priscilla Lopez (Second Vice President)
8. Arial Sharon (Project Manager 3), Rank-13, Supervisor-Lindsey Riley (Third Vice President)
9. Mamnunul Haque (Project Manager 4), Rank-13, Supervisor-Priscilla Lopez (Second Vice President)
10. Shree Subedhi (Cumminity Health Worker), Rank-14, Supervisor- Lynna Zhong (Project Manager 1)

All personnell names are fake
 */


DROP TABLE IF EXISTS CSAAH;

CREATE TABLE CSAAH (  
JobID int NOT NULL primary key,
FirstName varchar(50) NOT NULL,
LastName varchar(50), 
JobTitle varchar(50) NOT NULL, 
AbsoluteRank int, 
Supervisor varchar(50)
);

INSERT INTO CSAAH
VALUES
(100,'Nadia',  'Islam', 'CEO', 10,  'Null'),
(101,'Rebeca',  'Park', 'Assistant', 11,  'CEO'),
(102,'Jennifer',  'Zenwick', 'First Vice President', 12,  'CEO'),
(103,'Priscilla',  'Lopez', 'Second Vice President', 12,  'CEO'),
(104,'Lindsey',  'Riley', 'Third Vice President', 12,  'CEO'),
(105,'Lynna',  'Zhong', 'Project Manager1', 13,  'First Vice President'),
(106,'Randy',  'Persad', 'Project Manager2', 13,  'Second Vice President'),
(107,'Arial',  'Sharon', 'Project Manager3', 13,  'Third Vice President'),
(108,'Mamnunul',  'Haque', 'Project Manager4', 13,  'Second Vice President'),
(109, 'Shree', 'Subedhi', 'Cumminity Health Worker',14, 'Project Manager1');

-- select * from CSAAH;

SELECT CONCAT(m.LastName,', ',m.FirstName) AS 'Employee_name',
       CONCAT(e.LastName,', ',e.FirstName) AS 'Direct_report_to',
       m.JobID as 'Emplyee_ID', m.JobTitle as 'Title_of_the_Job', m.AbsoluteRank as 'Employee_Rank'
       
FROM CSAAH m
LEFT JOIN CSAAH e ON e.JobTitle = m.Supervisor
ORDER BY Employee_name;