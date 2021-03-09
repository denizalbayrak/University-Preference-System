Create database db_Collage;
Create table tbl_university(
"universityid" serial NOT NULL,
"uname" varchar(100),
"address" varchar(100),
"email" varchar(100),
"city" varchar(100),
"universityType" varchar(100),
"year_ofFoundation" integer,
CONSTRAINT "pk_universityid" PRIMARY KEY("universityid")
);

Create table tbl_faculty(
"facultyid" serial NOT NULL,
"universityid" int NOT NULL,
"fname" varchar(100),
"email" varchar(100),
CONSTRAINT "pk_facultyid" PRIMARY KEY("facultyid"),
CONSTRAINT "for_key_universityid" FOREIGN KEY("universityid")
REFERENCES tbl_university("universityid") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create table tbl_departments(
"departmentid" serial NOT NULL,
"facultyid" int NOT NULL,
"depname" varchar(100),
"email" varchar(100),
"language" varchar(100),
"educationType" varchar(100),
"quota" varchar(100),
"quotaTopRanked" varchar(100),
"educationperiod"  integer,
"minsScore" varchar(100),
"minOrder" varchar(100),
CONSTRAINT "pk_departmentid" PRIMARY KEY("departmentid"),
CONSTRAINT "for_key_facultyid" FOREIGN KEY("facultyid")
REFERENCES tbl_faculty("facultyid") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

Create table tbl_student(
"studentid" serial NOT NULL,
"sname" varchar(100),
"surname" varchar(100),
"examinationscore" varchar(100),
"ranking" varchar(100),
"toprankedornot" varchar(100),
"firstchoice" int NOT NULL,
"secondchoice" int NOT NULL,
"thirdchoice" int NOT NULL,
CONSTRAINT "pk_studentid" PRIMARY KEY("studentid"),
CONSTRAINT "for_key_firstchoice" FOREIGN KEY("firstchoice")
REFERENCES tbl_departments("departmentid") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_secondchoice" FOREIGN KEY("secondchoice")
REFERENCES tbl_departments("departmentid") match simple
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT "for_key_thirdchoice" FOREIGN KEY("thirdchoice")
REFERENCES tbl_departments("departmentid") match simple
ON UPDATE CASCADE ON DELETE CASCADE
);

insert into tbl_university("uname", "address", "email", "city", "universityType", "year_ofFoundation" )
values
('Dokuz Eylül University','Tınaztepe', 'deu@deu.org', 'İzmir', 'State', '1982'),
('Ege University','Bornova', 'ege@ege.org', 'İzmir', 'State', '1955'),
('Koç University','Sarıyer', 'koc@koc.org', 'İstanbul', 'Private', '1993'),
('İstanbul University','Fatih', 'istanbul@istanbul.org', 'İstanbul', 'State', '1453'),
('İzmir University','Bornova', 'izmir@izmir.org', 'İzmir', 'Private', '2001'),
('Eskişehir Osmangazi University','Odunpazarı', 'esogü@esogü.org', 'Eskişehir', 'State', '1970'),
('Izmir Technical University','Balçova', 'iztu@iztu.org', 'İzmir', 'State', '2020')
;
Select*
from tbl_university;

insert into tbl_faculty("universityid", "fname", "email")
values
('1', 'Engineering', 'engineer@mail.com'),
('2', 'Engineering', 'engineer@mail.com'),
('3', 'Engineering', 'engineer@mail.com'),
('5', 'Engineering', 'engineer@mail.com'),
('6', 'Engineering', 'engineer@mail.com'),
('1', 'Medicine', 'medicine@mail.com'),
('2', 'Medicine', 'medicine@mail.com'),
('3', 'Medicine', 'medicine@mail.com'),
('4', 'Medicine', 'medicine@mail.com'),
('1', 'Law', 'law@mail.com'),
('5', 'Law', 'law@mail.com'),
('4', 'Law', 'law@mail.com')
;
Select*
from tbl_faculty;

insert into tbl_departments("facultyid", "depname", "email", "language", "educationType", "quota", "quotaTopRanked", "educationperiod",  "minsScore", "minOrder")
values
('1', 'Computer Engineering','deuceng@deu.org', 'English', 'öö', '90', '3', '4', '425.124', '37.082'),
('2', 'Computer Engineering','egeceng@ege.org', 'Turkish', 'öö', '100', '3', '4', '430.493', '34.157'),
('5', 'Computer Engineering','esoguceng@esogu.org', 'Turkish', 'öö', '70', '2', '4', '397.914', '53.500'),
('3', 'Computer Engineering','kocceng@koc.org', 'English', 'öö', '8', '2', '4', '543.234', '208'),
('4', 'Computer Engineering','izmirceng@izmir.org', 'English', 'öö', '4', '2', '4', '361.470', '35.076'),
('1', 'Mechanical Engineering','deume@deu.org', 'Turkish', 'öö', '105', '3', '4', '395,471', '55.209'),
('1', 'Mechanical Engineering','deumeio@deu.org', 'Turkish', 'iö', '100', '3', '4', '367,162', '76.400'),
('5', 'Mechanical Engineering','esogume@esogu.org', 'Turkish', 'öö', '90', '3', '4', '341,712', '100.000'),
('5', 'Mechanical Engineering','esogumeio@esogu.org', 'Turkish', 'iö', '105', '3', '4', '368,184', '75.597'),
('4', 'Industrial Engineering','izmirie@izmir.org', 'Turkish', 'öö', '6', '3', '4', '422,783', '38.431'),
('10', 'Law','deulaw@deu.org', 'Turkish', 'öö', '4802', '3', '4', '403,460', '15.866'),
('11', 'Law','izmirlaw@izmir.org', 'Turkish', 'öö', '18', '3', '4', '397,013', '19.981'),
('12', 'Law','istanbullaw@istanbul.org', 'Turkish', 'öö', '5404', '3', '4', '431,125', '4670'),
('12', 'Law','istanbullawio@istanbul.org', 'Turkish', 'iö', '3800', '3', '4', '414,956', '9916'),
('6', 'Medicine','deumed@deu.org', 'Turkish', 'öö', '250', '3', '6', '504,436', '4849'),
('7', 'Medicine','egemed@ege.org', 'Turkish', 'öö', '340', '3', '6', '510,399', '3677'),
('9', 'Medicine','istanbulmed@istanbul.org', 'Turkish', 'öö', '310', '3', '6', '514,923', '2881'),
('9', 'Medicine','istanbulmeden@istanbul.org', 'English', 'öö', '60', '3', '6', '520,079', '2093'),
('8', 'Medicine','kocmeden@koc.org', 'English', 'öö', '15', '3', '6', '548,173', '85')
;
Select*
from tbl_departments;


insert into tbl_student("sname", "surname", "examinationscore", "ranking", "toprankedornot", "firstchoice", "secondchoice",  "thirdchoice")
values
('Deniz','Albayrak', '427,350', '35.555', 'no', '1', '2', '3'),
('Selena','Gomez', '429,350', '36.505', 'no', '4', '2', '1'),
('Avril','Lavigne', '426,376', '36.986', 'no', '1', '5', '3'),
('Taylor','Swift', '534,350', '125', 'top ranked', '19', '16', '15'),
('Justin','Bieber', '427,867', '37.000', 'no', '1', '6', '8'),
('Harry','Styles', '429,789', '33.897', 'no', '15', '2', '1'),
('Kylie','Jenner', '404,350', '14.852', 'no', '13', '11', '12'),
('Sharpay','Evans', '555,350', '45', 'top ranked', '19', '16', '15'),
('Troy','Bolton', '412,350', '45.426', 'no', '1', '3', '5'),
('Gabriella','Montez', '400,350', '54.456', 'top ranked', '6', '7', '8'),
('Nick','Jonas', '431,350', '31.425', 'no', '2', '1', '5'),
('Kevin','Jonas', '403,350', '36.500', 'no', '6', '1', '10')
;
Select*
from tbl_student;

--QUERIES

--Q1
select "uname" from tbl_university where city SIMILAR TO 'İ%' 
and "year_ofFoundation" > 1990 

--Q2
select* from tbl_university where universityid in(select universityid from tbl_faculty where "fname" = 'Engineering') and universityid in(select universityid from tbl_faculty where "fname" = 'Medicine'); 

--Q3
select count(tbl_faculty."facultyid") , tbl_university."universityType" from tbl_faculty inner join tbl_university on tbl_faculty."universityid" = tbl_university."universityid" group by tbl_university."universityType";

--Q4 
select* from tbl_departments where "educationType"='iö' and "facultyid" in(select "facultyid" from tbl_faculty where "fname" = 'Engineering'); 

--Q5
select "depname", "educationperiod", "minsScore" from tbl_departments order by "educationperiod" desc, "minsScore" desc limit 5;

--Q6
select "depname", mostpreference, Count(*) as "Count" 
from
( select "firstchoice" as mostpreference from tbl_student
  union all
  select "secondchoice" as mostpreference from tbl_student
  union all
  select "thirdchoice" as mostpreference from tbl_student
) def INNER JOIN tbl_departments on def.mostpreference = tbl_departments."departmentid"
where "educationperiod"=4 group by mostpreference,"depname" order by "Count" desc limit 1

--Q7
select "sname", "surname", "examinationscore" from tbl_student where "firstchoice" in(select "departmentid" from tbl_departments where "depname" = 'Computer Engineering') order by "examinationscore" desc

--Q8
update tbl_faculty
set "universityid" = (select "universityid" from tbl_university where "uname" = 'Izmir Technical University')where "facultyid" in 
(select "facultyid" from tbl_faculty Inner Join tbl_university on tbl_faculty."universityid" = tbl_university."universityid" where "uname" ='Dokuz Eylül University' and "fname" ='Engineering') 

--Q9
update tbl_departments
set educationperiod= ("educationperiod" +1)
where "depname" = 'Law';


--Q10
delete from tbl_university where "uname"='İzmir University';