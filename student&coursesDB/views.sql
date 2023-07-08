--Caculate the GPA for each student
CREATE OR ALTER VIEW aviw_gpaView
AS
SELECT sc.studentID, sc.degreeID, (SUM(sc.numberGrade * c.creditHours) / SUM(c.creditHours)) AS GPA
FROM atbl_studentsDegreesCourses sc
JOIN atbl_courses c ON sc.courseID = c.courseID
GROUP BY sc.studentID, sc.degreeID;

SELECT * FROM aviw_gpaView;

--Convert the GPA of the previous view to the 4.0 scale
CREATE OR ALTER VIEW aviw_gpaScaled
AS
SELECT studentID, degreeID, 'GPA Scaled' = CASE 
		WHEN GPA >= 93
			THEN 4.0
		WHEN GPA = 92
			THEN 3.9
		WHEN GPA = 91
			THEN 3.8
		WHEN GPA = 90
			THEN 3.7
		WHEN GPA = 89
			THEN 3.6
		WHEN GPA = 88
			THEN 3.5
		WHEN GPA = 87
			THEN 3.4
		WHEN GPA = 86
			THEN 3.3
		WHEN GPA = 85
			THEN 3.2
		WHEN GPA = 84
			THEN 3.1
		WHEN GPA = 83
			THEN 3.0
		WHEN GPA = 82
			THEN 2.9
		WHEN GPA = 81
			THEN 2.8
		WHEN GPA = 80
			THEN 2.7
		WHEN GPA = 79
			THEN 2.6
		WHEN GPA = 78
			THEN 2.5
		WHEN GPA = 77
			THEN 2.4
		WHEN GPA = 76
			THEN 2.3
		WHEN GPA = 75
			THEN 2.2
		WHEN GPA = 74
			THEN 2.1
		WHEN GPA = 73
			THEN 2.0
		WHEN GPA = 72
			THEN 1.9
		WHEN GPA = 71
			THEN 1.8
		WHEN GPA = 70
			THEN 1.7
		WHEN GPA = 69
			THEN 1.6
		WHEN GPA = 68
			THEN 1.5
		WHEN GPA = 67
			THEN 1.4
		WHEN GPA = 66
			THEN 1.3
		WHEN GPA = 65
			THEN 1.2
		WHEN GPA = 64
			THEN 1.1
		WHEN GPA = 63
			THEN 1.0
		WHEN GPA = 62
			THEN 0.9
		WHEN GPA = 61
			THEN 0.8
		WHEN GPA = 60
			THEN 0.7
		WHEN GPA = 59
			THEN 0.6
		WHEN GPA = 58
			THEN 0.5
		WHEN GPA = 57
			THEN 0.4
		WHEN GPA = 56
			THEN 0.3
		WHEN GPA = 55
			THEN 0.2
		WHEN GPA = 54
			THEN 0.1
		ELSE 0.0
		END
FROM aviw_gpaView;

SELECT * FROM aviw_gpaScaled;


--view to see how many semesters is remaining for each student
CREATE OR ALTER VIEW aviw_remainingSemesters
AS
SELECT sdc.studentID as studentID
	,(MAX(sdc.enrollmentDate)) AS latestEnrollment
	,((120 - SUM(c.creditHours)) / s.maxCreditHours) AS remaining
FROM atbl_courses c
JOIN atbl_studentsDegreesCourses sdc ON c.courseID = sdc.courseID
JOIN atbl_students s ON sdc.studentID = s.studentID
WHERE sdc.dropDate IS NULL
	AND sdc.numberGrade > 70
GROUP BY sdc.studentID
	,s.maxCreditHours;
	
select*from aviw_remainingSemesters;

select*from atbl_studentsDegreesCourses;

--view to see when the expected graduation date is for each student
CREATE OR ALTER VIEW aviw_expectedGradutation
AS
select studentID, 'Graduation' = CASE 
		WHEN MONTH(DATEADD(MONTH, (remaining*6), latestEnrollment)) > 0
			AND MONTH(DATEADD(MONTH, (remaining*6), latestEnrollment)) < 6
			THEN 'MAY 15'
		WHEN MONTH(DATEADD(MONTH, (remaining*6), latestEnrollment)) > 6
			AND MONTH(DATEADD(MONTH, (remaining*6), latestEnrollment)) <= 12
			THEN 'DECEMBER 15'
		END,
(YEAR(DATEADD(MONTH, (remaining*6), latestEnrollment))) AS 'YEAR'
from aviw_remainingSemesters;

select*from aviw_expectedGradutation;

--COURSE REPORT
CREATE OR ALTER VIEW aviw_report
AS
select sdc.studentID, 
concat(s.firstName, ' ', s.lastName) as 'Full Name', 
sdc.courseID, c.courseDescription, 
string_agg(concat(sdc.numberGrade, ' (', sdc.letterGrade, ' in Year ', ' - ', sdc.scSemester, ')'), ', ' ) AS Grade
from atbl_students s
inner join atbl_studentsDegreesCourses sdc on s.studentID = sdc.studentID
inner join atbl_courses c on sdc.courseID = c.courseID
group by sdc.studentID, sdc.degreeID, sdc.courseID, s.firstName, s.lastName, c.courseDescription

select*from aviw_report;
