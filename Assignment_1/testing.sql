------------------------------------Test 1-----------------
-- create table STUDENTS(
--     sno integer primary key, 
--     sname varchar(20) not null,
--     hno integer
-- );

-- insert into STUDENTS values (1, 'Abhiroop',8);
-- insert into STUDENTS values (2, 'Sanjana');
-- insert into STUDENTS values (3, 'Rahul',9);
-- insert into STUDENTS values (4, 'Arnab',10);
-- insert into STUDENTS values (5, 'Harsh',10);
-- select * from STUDENTS;

-- -- alter table STUDENTS
-- --     drop column hno;
-- -- select * from STUDENTS;

-- -- alter table STUDENTS
-- --     add column hno integer;
-- -- select * from STUDENTS;

-- select count(distinct hno)
--   from STUDENTS;

-- drop table STUDENTS;

--------------------------------------------Test 2------------------------------------
create domain faculty_name varchar(20);
create table FACULTY(
    fno integer primary key,
    fname faculty_name not null,
    dno integer not null,
    age integer,
    sal integer
);

insert into FACULTY
    values  (1, 'xyz', 1, 45, 90000),
            (2, 'abc', 2, 55, 100000),
            (3, 'efg', 3, 60, 110000),
            (4, 'hij', 3, 65, 120000),
            (5, 'pqr', 1, 70, 130000);

insert into FACULTY (fno, fname, dno)
    values (6, 'saf', 2);

select * from FACULTY;


create table DEPT(
    dno integer primary key,
    dname varchar(5) not null
);

insert into DEPT values 
    (1, 'CST'),
    (2, 'ETC'),
    (3, 'IT');

select * from DEPT;

-- select FACULTY.fname 
--     from FACULTY, DEPT
--     where FACULTY.dno = DEPT.dno
--     and DEPT.dname = 'CST';

-- select count(*)
--   from FACULTY F, DEPT D
--  where F.dno = D.dno
--    and D.dname = 'CST';

-- select min(age), max(age)
--   from FACULTY;

-- select  sum(sal)
--   from FACULTY;

-- select avg(age)
--   from FACULTY F, DEPT D
--  where F.dno = D.dno
--    and D.dname = 'IT';  

select fname, age
  from FACULTY
 where age = (select max(age)
              from FACULTY);


drop table FACULTY;
drop domain faculty_name;
drop table DEPT;

-----------------------------------------Test 3------------------------------
-- create table COURSE(
--     cno integer primary key,
--     cname varchar(100),
--     prereq integer
-- );

-- insert into COURSE values (1, 'Analysis of Algorithms', 2);
-- insert into COURSE values (2, 'Data Structures and Algorithms', 3);
-- insert into COURSE values (3, 'C Coding', -1);

-- select  P.cname, Q.cname
--   from COURSE P, COURSE Q
--  where P.prereq = Q.cno;

-- \d+ COURSE

-- drop table COURSE;