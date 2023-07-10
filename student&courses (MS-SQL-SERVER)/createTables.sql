-- atbl_table | aviw_view

create table atbl_degrees (
degreeID int identity(1,1) primary key,
degreeName nvarchar(100),
degreeType nvarchar(50),
degreeYear nvarchar(9),
school nvarchar(200)
);

create table atbl_courses  (
courseID nvarchar(9) primary key not null,
courseName nvarchar(100) not null,
creditHours int not null,
lectureContactHours tinyint not null,
labContactHours tinyint, 
formerly nvarchar(10),
prerequisite nvarchar(max),
corequisite nvarchar(max),
courseDescription nvarchar(max),
repeatability bit,
coreCategory nvarchar(100),
note nvarchar(255),
TCCNS nvarchar(100),
additionalFee bit
);

create table atbl_degreesCourses (
degreeID int,
courseID nvarchar(9),
dcYear tinyint,
dcSemester nvarchar(50),
foreign key (degreeID) references atbl_degrees(degreeID),
foreign key (courseID) references atbl_courses(courseID),
constraint PK_degreeCourses Primary key (degreeID, courseID)
);

create table atbl_students (
studentID int identity(1,1) primary key,
enrollmentStatus nvarchar(50) not null,
maxCreditHours AS CASE
WHEN enrollmentStatus = 'Full Time'
	THEN 24
WHEN enrollmentStatus = 'Part Time'
	then 12
	END, 
firstName nvarchar(100) not null,
lastName nvarchar(100) not null,
dateOfBirth date not null,
phoneNumber nvarchar(20),
address nvarchar(50),
city nvarchar(50),
state nvarchar(50),
zipcode nvarchar(10),
GPA decimal(3,2)
);


create table atbl_emails (
emailID int identity(1,1) primary key,
studentID int,
emailType nvarchar(50),
email nvarchar(max), -- google says longest possible is 320
foreign key (studentID) references atbl_students(studentID)
);

create table atbl_studentsDegrees (
studentID int,
degreeID int,
enrollmentYear nvarchar(50),
gradutationYear nvarchar(50)
foreign key (studentID) references atbl_students(studentID),
foreign key (degreeID) references atbl_degrees(degreeID),
constraint PK_studentsDegrees Primary key (studentID, degreeID)
);

create table atbl_studentsDegreesCourses (
studentID int not null,
degreeID int not null,
courseID nvarchar(9) not null,
scYear int not null,
scSemester nvarchar(50) not null,
numberGrade int,
letterGrade AS CASE
WHEN numberGrade >= 95
			THEN 'A'
		WHEN numberGrade >= 90
			AND numberGrade < 95
			THEN 'A-'
		WHEN numberGrade >= 85
			AND numberGrade < 90
			THEN 'B+'
		WHEN numberGrade >= 80
			AND numberGrade < 85
			THEN 'B'
		WHEN numberGrade >= 75
			AND numberGrade < 80
			THEN 'B-'
		WHEN numberGrade >= 70
			AND numberGrade < 75
			THEN 'C'
		WHEN numberGrade < 70
			THEN 'F'
		END,
enrollmentDate date,
dropDate date,
foreign key (studentID) references atbl_students(studentID),
foreign key (degreeID) references atbl_degrees(degreeID),
foreign key (courseID) references atbl_courses(courseID)
);

ALTER TABLE atbl_studentsDegreesCourses ADD CONSTRAINT CK_semster CHECK (scSemester = 'Fall' or  scSemester = 'Spring' or scSemester = 'Summer' or scSemester = 'Winter');

ALTER TABLE atbl_studentsDegreesCourses ADD CONSTRAINT PK_atbl_studentsCourses PRIMARY KEY (studentID,courseID,scYear,scSemester);

ALTER TABLE atbl_studentsDegreesCourses ADD CONSTRAINT CK_dropDate CHECK 

--unique index with studentID, courseID, scYear, scSemester

