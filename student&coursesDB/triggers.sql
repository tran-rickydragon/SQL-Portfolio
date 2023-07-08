-- full time student trigger
drop trigger enrollmentPartTime;
CREATE OR ALTER TRIGGER enrollmentFullTime ON atbl_studentsDegreesCourses
AFTER INSERT
AS
--here i want to connect student, studentcourses, and courses
IF EXISTS (
		SELECT s.studentID, sc.scYear, sc.scSemester
		FROM atbl_courses c
		INNER JOIN atbl_studentsCourses sc ON c.courseID = sc.courseID
		INNER JOIN atbl_students s ON sc.studentID = s.studentID
		INNER JOIN (
			SELECT DISTINCT studentID, scYear, scSemester
			FROM inserted
			) i ON s.studentID = i.studentID
			AND sc.scYear = i.scYear
			AND sc.scSemester = i.scSemester
		WHERE s.enrollmentStatus = 'Full Time'
		GROUP BY s.studentID, sc.scYear, sc.scSemester
		HAVING sum(c.creditHours) > 24
		)
BEGIN
	RAISERROR ('You cannot enroll in more than 24 credit hours per semester!', 16, 1);

	ROLLBACK TRANSACTION;
END;

--how many credit hours studentID 1 currently has 
SELECT sc.studentID, sc.courseID, sc.scYear, sc.scSemester, sc.numberGrade, c.creditHours
FROM atbl_studentsCourses sc
INNER JOIN atbl_courses c ON sc.courseID = c.courseID
WHERE sc.studentID = 1
	AND sc.scYear = 1
	AND sc.scSemester = 'Fall';
--result is (3*6) + 4 = 22

SELECT courseID, creditHours
FROM atbl_courses
WHERE courseID = 'MATH 1342';
--credit hour = 3

--test trigger by adding more than 24 hours
INSERT INTO atbl_studentsCourses (studentID, courseID, scYear, scSemester, numberGrade, letterGrade, repititionStatus)
VALUES (1, 'MATH 1342', 1, 'Fall', 99, 'A', 0);

-- part time student trigger
CREATE OR ALTER TRIGGER enrollmentPartTime ON atbl_studentsDegreesCourses
AFTER INSERT
AS
--here i want to connect student, studentcourses, and courses
IF EXISTS (
		SELECT s.studentID, sc.scYear, sc.scSemester
		FROM atbl_courses c
		INNER JOIN atbl_studentsCourses sc ON c.courseID = sc.courseID
		INNER JOIN atbl_students s ON sc.studentID = s.studentID
		INNER JOIN (
			SELECT DISTINCT studentID, scYear, scSemester
			FROM inserted
			) i ON s.studentID = i.studentID
			AND sc.scYear = i.scYear
			AND sc.scSemester = i.scSemester
		WHERE s.enrollmentStatus = 'Part Time'
		GROUP BY s.studentID, sc.scYear, sc.scSemester
		HAVING sum(c.creditHours) > 12
		)
BEGIN
	RAISERROR ('You cannot enroll in more than 12 credit hours per semester!', 16, 1);

	ROLLBACK TRANSACTION;
END;

--how many credit hours studentID 2 currently has 
SELECT sc.studentID, sc.courseID, sc.scYear, sc.scSemester, sc.numberGrade, c.creditHours
FROM atbl_studentsCourses sc
INNER JOIN atbl_courses c ON sc.courseID = c.courseID
WHERE sc.studentID = 2
	AND sc.scYear = 1
	AND sc.scSemester = 'Fall';
--result is (3*4) = 12

SELECT courseID, creditHours
FROM atbl_courses
WHERE courseID = 'MATH 1342';
--credit hour = 3

--test trigger by adding more than 24 hours
INSERT INTO atbl_studentsCourses (studentID, courseID, scYear, scSemester, numberGrade, letterGrade, repititionStatus)
VALUES (2, 'MATH 1324', 1, 'Fall', 99, 'A', 0);

select * from atbl_studentsCourses
where studentID = 2
and courseID = 'MATH 1342'

--limit the amount of retake of courses to 3 times
CREATE OR ALTER TRIGGER enrollmentCount3 ON atbl_studentsDegreesCourses
AFTER INSERT
AS
IF EXISTS (
		SELECT studentID, courseID, dropDate
		FROM atbl_studentsDegreesCourses
		where dropDate IS NULL
		OR dropDate < (DATEADD(week, 3, enrollmentDate))
		GROUP BY studentID, courseID, dropDate, enrollmentDate
		HAVING COUNT(*) > 3
		) 
BEGIN
	RAISERROR ('You cannot enroll in a class more than 3 times!', 16, 1);
	 
	ROLLBACK TRANSACTION;
END;

-- test
INSERT INTO atbl_studentsDegreesCourses (
	studentID
	,degreeID
	,courseID
	,scYear
	,scSemester
	,numberGrade
	,enrollmentDate
	,dropDate
)
VALUES
(1, 1, 'COSC 1336', 4, 'Spring', 95, '2022-08-18', null),
(1, 1, 'COSC 1336', 2, 'Fall', 91, '2022-08-18', null),
(1, 1, 'COSC 1336', 2, 'Spring', 84, '2022-08-18', null);

select * from atbl_studentsDegreesCourses
where studentID = 1 and courseID = 'COSC 1336';

--drop course trigger
--if a course is dropped 3 weeks after the enrollmentdate then the number grade will update to 50
CREATE
	OR
ALTER TRIGGER dropCourse ON atbl_studentsDegreesCourses
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE a
	SET numberGrade = 50
	FROM atbl_studentsDegreesCourses a
	INNER JOIN inserted i ON a.studentID = i.studentID
	WHERE i.dropDate > (DATEADD(week, 3, a.enrollmentdate))
		AND i.studentID = a.studentID
		AND i.degreeID = a.degreeID
		AND i.courseID = a.courseID
		AND i.scSemester = a.scSemester
		AND i.scYear = a.scYear
END;

-- test 
select * from atbl_studentsDegreesCourses
where studentID = 1 and courseID = 'COSC 1336';

update atbl_studentsDegreesCourses
SET dropDate = null, numberGrade = 90
where studentID = 1 AND degreeID = 1 AND courseID = 'COSC 1336' AND scSemester = 'Fall' AND scYear = 1;

update atbl_studentsDegreesCourses
SET dropDate = '2022-09-14'
where studentID = 1 AND degreeID = 1 AND courseID = 'COSC 1336' AND scSemester = 'Fall' AND scYear = 1;

select * from atbl_studentsDegreesCourses
where studentID = 1 and courseID = 'COSC 1336';
