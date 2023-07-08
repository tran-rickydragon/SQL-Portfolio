-- 2 Write a query to list DegreeName, Year, Semester, CourseNo, CourseName, CreditHours for all degrees. 
--Make sure output is easy for students to follow.
SELECT d.degreeName AS 'Degree Name'
	,dc.dcYear AS 'Year'
	,dc.semester AS 'Semester'
	,c.courseNo AS 'CourseNo'
	,c.creditHours AS 'Credit Hours'
FROM degree d
JOIN degreeCourses dc ON d.degreeID = dc.degreeID
JOIN courses c ON dc.courseID = c.courseID
ORDER BY 'Degree Name'
	,'Year'
	,'Semester';

--3 Write a query to find out all courses that must be taken in Freshman year for Computer Science
SELECT d.degreeName AS 'Degree Name'
	,dc.dcYear AS 'Year'
	,dc.semester AS 'Semester'
	,c.courseNo AS 'CourseNo'
	,c.creditHours AS 'Credit Hours'
FROM degree d
INNER JOIN degreeCourses dc ON d.degreeID = dc.degreeID
INNER JOIN courses c ON dc.courseID = c.courseID
WHERE dc.dcYear = 1
	AND d.degreeName = 'Computer Science'
ORDER BY 'Semester';

--4 Write a query to find out all courses that must be taken in Senior year for Digital Media
SELECT d.degreeName AS 'Degree Name'
	,dc.dcYear AS 'Year'
	,dc.semester AS 'Semester'
	,c.courseNo AS 'CourseNo'
	,c.creditHours AS 'Credit Hours'
FROM degree d
INNER JOIN degreeCourses dc ON d.degreeID = dc.degreeID
INNER JOIN courses c ON dc.courseID = c.courseID
WHERE dc.dcYear = 4
	AND d.degreeName = 'Digital Media'
ORDER BY 'Semester';

--5 Write a query to list all overlaps between two degrees
SELECT d.degreeName AS 'Degree Name'
	,dc.dcYear AS 'Year'
	,dc.semester AS 'Semester'
	,c.courseNo AS 'CourseNo'
	,c.creditHours AS 'Credit Hours'
FROM degree d
INNER JOIN degreeCourses dc ON d.degreeID = dc.degreeID
INNER JOIN courses c ON dc.courseID = c.courseID
WHERE dc.courseID IN (
		SELECT courseID
		FROM degreeCourses
		GROUP BY courseID
		HAVING COUNT(courseID) > 1
		)
ORDER BY dc.courseID;

--6 Write a query to find out courses offer for CS and not DM and vice versa
SELECT d.degreeName AS 'Degree Name'
	,dc.dcYear AS 'Year'
	,dc.semester AS 'Semester'
	,c.courseNo AS 'CourseNo'
	,c.creditHours AS 'Credit Hours'
FROM degree d
INNER JOIN degreeCourses dc ON d.degreeID = dc.degreeID
INNER JOIN courses c ON dc.courseID = c.courseID
WHERE dc.courseID IN (
		SELECT courseID
		FROM degreeCourses
		GROUP BY courseID
		HAVING COUNT(courseID) < 2
		)
ORDER BY dc.courseID;

--7 Write a query to swap DIGM 2353 and DIFM 2352 (Digital Media - Sophomore year)
SELECT *
FROM courses
WHERE courseNo = 'DIGM 2353'
	OR courseNo = 'DIGM 2352';
--2353 = 35 | 2352 = 37
UPDATE degreeCourses
SET courseID = (
		CASE 
			WHEN courseID = 37
				THEN 35
			WHEN courseID = 35
				THEN 37
			ELSE courseID
			END
		)
WHERE degreeID = 2
	AND dcYear = 2;

--8 Write a query to remove COSC 4351 (Computer Science - Freshman year)
DELETE dc
FROM degreeCourses dc
INNER JOIN courses c ON dc.courseID = c.courseID
WHERE c.courseNo = 'COSC 4351'
	AND dc.dcYear = 1;
--9 Write a query to update the CreditHours for COSC 3380 Database Systems to 4
UPDATE courses
SET creditHours = 4
WHERE courseNo = 'COSC 3380';

--10 Write a query to swap all courses in Spring to Fall and Fall to Spring for Sophomore year in Computer Science
UPDATE degreeCourses
SET semester = (
		CASE 
			WHEN semester = 'Fall'
				THEN 'Spring'
			ELSE 'Fall'
			END
		)
WHERE degreeID = 1
	AND dcYear = 2;