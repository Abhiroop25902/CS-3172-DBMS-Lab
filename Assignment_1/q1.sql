CREATE TABLE depts (
	deptcode varchar(3) PRIMARY KEY,
	deptname varchar(50) NOT NULL
);

CREATE TABLE students (
	rollno numeric(8) PRIMARY KEY,
	name varchar(30),
	bdate date CHECK (bdate < '2021-01-01'),
	deptcode char(3) REFERENCES depts (deptcode) ON DELETE CASCADE,
	hostel numeric CHECK (hostel < 10),
	parent_inc numeric(8, 1)
);

CREATE TABLE faculty (
	fac_code varchar(8) PRIMARY KEY,
	fac_name varchar(30) NOT NULL,
	fac_dept varchar(3) REFERENCES depts (deptcode)
);

CREATE TABLE crs_offrd (
	crs_code varchar(10) PRIMARY KEY,
	crs_name varchar(35) NOT NULL,
	crs_credits numeric(2, 1),
	crs_fac_cd varchar(8) REFERENCES faculty (fac_code)
);

CREATE TABLE crs_regd (
	crs_rollno numeric(8) REFERENCES students (rollno),
	crs_cd char(10) REFERENCES crs_offrd (crs_code),
	marks numeric(5, 2),
	PRIMARY KEY (crs_rollno, crs_cd)
);

INSERT INTO depts VALUES ('CST', 'Computer Science and Technology');
INSERT INTO depts VALUES ('IT', 'Information Technology');
INSERT INTO depts VALUES ('ETC', 'Electronics and Telecommunication');
INSERT INTO depts VALUES ('PH', 'Physics');
INSERT INTO depts VALUES ('CH', 'Chemistry');

INSERT INTO students VALUES (1, 'Abhiroop', '2002-09-25', 'CST', 8, 160000);
INSERT INTO students VALUES (2, 'abc', '2001-09-25', 'ETC', 7, 180000);
INSERT INTO students VALUES (3, 'bcd', '2001-08-25', 'IT', 6, 190000);
INSERT INTO students VALUES (4, 'cde', '2001-08-26', 'CST', 9, 200000);
INSERT INTO students VALUES (5, 'kjsd', '2001-09-25', 'ETC', 9, 250000);
INSERT INTO students VALUES (92005102, 'skj', '2001-08-25', 'IT', 8, 220000);
INSERT INTO students VALUES (92005010, 'srg', '2000-08-26', 'CST', 9, 210000);

INSERT INTO faculty VALUES ('CST_F1', 'dbp', 'CST');
INSERT INTO faculty VALUES ('CST_F2', 'hed', 'CST');
INSERT INTO faculty VALUES ('IT_F1', 'nls', 'IT');
INSERT INTO faculty VALUES ('IT_F2', 'jst', 'IT');
INSERT INTO faculty VALUES ('ETC_F1', 'eft', 'ETC');
INSERT INTO faculty VALUES ('ETC_F2', 'fdj', 'ETC');
INSERT INTO faculty VALUES ('PH_F1', 'sfgf', 'PH');
INSERT INTO faculty VALUES ('CH_F1', 'poi', 'CH');


INSERT INTO crs_offrd VALUES ('CST_C1', 'CST Course 1', 4, 'CST_F1');
INSERT INTO crs_offrd VALUES ('CST_C2', 'CST Course 2', 5, 'CST_F2');
INSERT INTO crs_offrd VALUES ('CST_C3', 'CST Course 3', 6, 'CST_F1');
INSERT INTO crs_offrd VALUES ('CST_C4', 'CST Course 4', 7, 'CST_F2');
INSERT INTO crs_offrd VALUES ('IT_C1', 'IT Course 1', 6, 'IT_F1');
INSERT INTO crs_offrd VALUES ('IT_C2', 'IT Course 2', 7, 'IT_F2');
INSERT INTO crs_offrd VALUES ('IT_C3', 'IT Course 3', 5, 'IT_F1');
INSERT INTO crs_offrd VALUES ('IT_C4', 'IT Course 4', 4, 'IT_F2');
INSERT INTO crs_offrd VALUES ('ETC_C1', 'ETC Course 1', 6, 'ETC_F1');
INSERT INTO crs_offrd VALUES ('ETC_C2', 'ETC Course 2', 4, 'ETC_F2');
INSERT INTO crs_offrd VALUES ('ETC_C3', 'ETC Course 3', 5, 'ETC_F1');
INSERT INTO crs_offrd VALUES ('ETC_C4', 'ETC Course 4', 7, 'ETC_F2');
INSERT INTO crs_offrd VALUES ('PH106', 'PH Course 1', 4, 'PH_F1');
INSERT INTO crs_offrd VALUES ('CH103', 'CH Course 1', 3, 'CH_F1');

INSERT INTO crs_regd VALUES (1, 'CST_C1', 89.6);
INSERT INTO crs_regd VALUES (1, 'CST_C2', 98.6);
INSERT INTO crs_regd VALUES (1, 'CST_C3', 67.6);
INSERT INTO crs_regd VALUES (1, 'CST_C4', 95.6);
INSERT INTO crs_regd VALUES (1, 'PH106', 100);
INSERT INTO crs_regd VALUES (1, 'CH103', 90);
INSERT INTO crs_regd VALUES (2, 'ETC_C1', 89.4);
INSERT INTO crs_regd VALUES (2, 'ETC_C2', 92.6);
INSERT INTO crs_regd VALUES (2, 'ETC_C3', 87.7);
INSERT INTO crs_regd VALUES (2, 'ETC_C4', 75.9);
INSERT INTO crs_regd VALUES (2, 'PH106', 89.3);
INSERT INTO crs_regd VALUES (2, 'CH103', 90.8);
INSERT INTO crs_regd VALUES (3, 'IT_C1', 88.4);
INSERT INTO crs_regd VALUES (3, 'IT_C2', 94.6);
INSERT INTO crs_regd VALUES (3, 'IT_C3', 82.7);
INSERT INTO crs_regd VALUES (3, 'IT_C4', 79.4);
INSERT INTO crs_regd VALUES (3, 'PH106', 84.3);
INSERT INTO crs_regd VALUES (3, 'CH103', 97.8);
INSERT INTO crs_regd VALUES (4, 'CST_C1', 82.6);
INSERT INTO crs_regd VALUES (4, 'CST_C2', 68.6);
INSERT INTO crs_regd VALUES (4, 'CST_C3', 63.6);
INSERT INTO crs_regd VALUES (4, 'CST_C4', 90.6);
INSERT INTO crs_regd VALUES (4, 'PH106', 82.3);
INSERT INTO crs_regd VALUES (4, 'CH103', 95.8);
INSERT INTO crs_regd VALUES (5, 'ETC_C1', 90.4);
INSERT INTO crs_regd VALUES (5, 'ETC_C2', 91.6);
INSERT INTO crs_regd VALUES (5, 'ETC_C3', 89.7);
INSERT INTO crs_regd VALUES (5, 'ETC_C4', 76.9);
INSERT INTO crs_regd VALUES (5, 'PH106', 82.8);
INSERT INTO crs_regd VALUES (5, 'CH103', 95.9);
INSERT INTO crs_regd VALUES (92005102, 'IT_C1', 89.4);
INSERT INTO crs_regd VALUES (92005102, 'IT_C2', 93.6);
INSERT INTO crs_regd VALUES (92005102, 'IT_C3', 86.7);
INSERT INTO crs_regd VALUES (92005102, 'IT_C4', 70.4);
INSERT INTO crs_regd VALUES (92005102, 'PH106', 88.8);
INSERT INTO crs_regd VALUES (92005102, 'CH103', 91.9);
INSERT INTO crs_regd VALUES (92005010, 'CST_C1', 83.6);
INSERT INTO crs_regd VALUES (92005010, 'CST_C2', 34.6);
INSERT INTO crs_regd VALUES (92005010, 'CST_C3', 69.6);
INSERT INTO crs_regd VALUES (92005010, 'CST_C4', 90.3);
INSERT INTO crs_regd VALUES (92005010, 'PH106', 82.8);
INSERT INTO crs_regd VALUES (92005010, 'CH103', 99.9);

-- -- delete record from student whose deptcode = 'CST'
-- SELECT * 
-- FROM students;

-- DELETE FROM students 
-- WHERE deptcode = 'CST';

-- SELECT * 
-- FROM students;


-- Find out the courses offered by the faculty dbp and nls.\
SELECT crs_code
FROM
	faculty,
	crs_offrd
WHERE
	faculty.fac_code = crs_offrd.crs_fac_cd
	AND (faculty.fac_name = 'dbp'
		OR faculty.fac_name = 'nls');

-- Find out the courses with full details offered by dbp.
SELECT crs_offrd
FROM
	faculty,
	crs_offrd
WHERE
	faculty.fac_code = crs_offrd.crs_fac_cd
	AND faculty.fac_name = 'dbp';

-- Get the courses the credits of which lies between 4.0 and 6.0.
SELECT crs_code
FROM crs_offrd
WHERE crs_credits BETWEEN 4.0 AND 6.0;

--Get the courses the credits of which are > 6.5.
SELECT crs_code
FROM crs_offrd
WHERE crs_credits > 6.5;

-- Count the number of students in CSE dept.
SELECT count(*)
FROM students
WHERE deptcode = 'CST';

--Determine the minimum, maximum and average marks of each courses.
SELECT	
	crs_cd,
	crs_name,
	min(marks),
	avg(marks),
	max(marks)
FROM
	crs_regd,
	crs_offrd
WHERE crs_regd.crs_cd = crs_offrd.crs_code
GROUP BY (crs_cd, crs_name)
ORDER BY crs_cd;

--Determine the total credits of the courses registered by a student.
SELECT 
	crs_regd.crs_rollno as roll_no,
	sum(crs_offrd.crs_credits * crs_regd.marks/100) as total_credits
FROM crs_regd, crs_offrd
WHERE crs_regd.crs_cd = crs_offrd.crs_code
GROUP BY crs_regd.crs_rollno
ORDER BY crs_regd.crs_rollno;

--Count the number of students in each hostel whose department is CSE.
SELECT 
	hostel,
	count(*) as num_students
FROM students
WHERE deptcode = 'CST'
GROUP BY hostel;

-- Display the hostel,rollno,parent_inc of the student who has the max(parent_inc) 
-- in a hostel.
SELECT
	hostel,
	rollno,
	parent_inc
FROM students
WHERE parent_inc in (SELECT max(parent_inc) 
					FROM students 
					GROUP BY hostel)
ORDER BY hostel;

-- Display the name and parental income of each student greater than 
-- the parental income of some rollno 92005010.
SELECT
	name,
	parent_inc
FROM students
WHERE parent_inc > (SELECT parent_inc 
					FROM students 
					WHERE rollno = 92005010);

-- Find out marks of students who have marks more than
-- rollno 92005102 for course CH103 and PH106.

-- CREATE TABLE crs_regd (
-- 	crs_rollno numeric(8) REFERENCES students (rollno),
-- 	crs_cd char(10) REFERENCES crs_offrd (crs_code),
-- 	marks numeric(5, 2),
-- 	PRIMARY KEY (crs_rollno, crs_cd)
-- );

SELECT 
	crs_rollno,
	crs_cd, 
	marks
FROM crs_regd
WHERE(
	(
		crs_cd = 'CH103'
		AND 
		marks > (
					SELECT marks
					FROM crs_regd
					WHERE crs_rollno = 92005102 AND crs_cd = 'CH103'
				)
	)
	OR 
	(
		crs_cd = 'PH106'
		AND 
		marks > (
					SELECT marks
					FROM crs_regd
					WHERE crs_rollno = 92005102 AND crs_cd = 'PH106'
				)
	)
);


DROP TABLE crs_regd;
DROP TABLE crs_offrd;
DROP TABLE faculty;
DROP TABLE students;
DROP TABLE depts;

