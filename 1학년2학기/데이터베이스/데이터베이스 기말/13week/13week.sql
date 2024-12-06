drop table if exists R;
drop table if exists S;

CREATE TABLE R (
	A char(1) ,
	B char(1)
);

CREATE TABLE S (
	B char(1) ,
	C char(1)
);

INSERT INTO R VALUES ('a', '2');
INSERT INTO R VALUES ('b', '3');
INSERT INTO R VALUES ('c', '3');
INSERT INTO R VALUES ('d', '5');

INSERT INTO S VALUES ('1', 'x');
INSERT INTO S VALUES ('2', 'y');
INSERT INTO S VALUES ('3', 'z');

select * from r;
select * from s;



-- 3) 자연 조인			
SELECT A, R.B, C			
FROM  R, S			
WHERE R.B = S.B;	

-- 2) 왼쪽외부조인				
SELECT *    	 			
FROM R LEFT OUTER JOIN S				
ON R.B = S.B;	

SELECT *    	 			
FROM R RIGHT OUTER JOIN S				
ON R.B = S.B;	

SELECT *    	 			
FROM R LEFT OUTER JOIN S				
ON R.B = S.B				
UNION				
SELECT *    	 			
FROM R RIGHT OUTER JOIN S				
ON R.B = S.B;				
		
-- emp(empno, empname, manager, dno)
DROP TABLE if exists emp;

create table emp (
    empno       char(4) PRIMARY KEY ,
    empname   varchar(12) ,
    manager    char(4) ,
    dno          char(1) ,
    FOREIGN KEY (manager) REFERENCES emp(empno)
);

insert into emp values('3011','이수민',NULL,'1');
insert into emp values('3426','박영권','3011','3');
insert into emp values('1003','조민희','3011','1');
insert into emp values('2106','김창섭','3426','2');
insert into emp values('3427','최종철','2106','3');

select * from emp;
        
SELECT E1.empname 사원명, E2.empname 직송상사명				
FROM emp E1, emp E2				
WHERE E1.manager = E2.empno;	

-- 추천고객(고객아이디,고객이름,나이,등급,직업,적립금,추천고객)
DROP TABLE if exists 추천고객;

create table 추천고객 (
    고객아이디   char(20)    NOT NULL PRIMARY KEY ,
    고객이름     varchar(20)  ,
    나이         int ,
    등급         varchar(10) ,
    직업         varchar(10) ,
    적립금       int ,
    추천고객     char(20) ,
    foreign key(추천고객) references 추천고객(고객아이디)
);

-- 추천고객(고객아이디,고객이름,나이,등급,직업,적립금,추천고객)
insert into 추천고객 values('orange','정지영',22,'silver','학생',0, NULL);
insert into 추천고객 values('apple','김현준',20,'gold','학생',1000, 'orange');
insert into 추천고객 values('banana','정소화',25,'vip','간호사',2500, 'orange');
insert into 추천고객 values('carrot','원유선',28,'gold','교사',4500, 'apple');

-- 데이터 조회
select * from 추천고객;

SELECT A.고객이름 고객명, B.고객이름 추천고객명					
FROM 추천고객 A, 추천고객 B					
WHERE A.추천고객 = B.고객아이디;	

SELECT empname, title 										
FROM employee 										
WHERE title = (SELECT title FROM employee WHERE empname = '박영권');										

SELECT empname											
FROM employee											
WHERE dno IN(SELECT deptno FROM department WHERE deptname IN('영업', '개발'));												

SELECT empname												
FROM employee												
WHERE dno NOT IN(SELECT deptno FROM department WHERE deptname IN('영업', '개발'));												
												
SELECT deptname										
FROM department										
WHERE NOT EXISTS(SELECT * FROM employee WHERE deptno=dno);										

SELECT empname, dno, salary 
FROM employee E1 WHERE salary >  (SELECT AVG(salary) FROM employee E2 WHERE E1.dno = E2.dno);

SELECT empname, dno, salary 
FROM employee E1 WHERE salary >  (SELECT AVG(salary) FROM employee E2 WHERE  E2.dno);

SELECT * FROM employee E1,employee E2 WHERE E1.dno = E2.dno;

SELECT AVG(salary) FROM employee E2 WHERE E2.dno;

DROP TABLE if exists pro;
DROP TABLE if exists stu;

-- stu(sno, sname, dept, sage)
-- pro(pno, pname, dept, page)

CREATE TABLE pro (
    pno   char(2),
    pname varchar(20), 
    dept  varchar(20),
    page  int,
    primary key(pno)
);

CREATE TABLE stu (
    sno   char(2),
    sname varchar(20), 
    dept  varchar(20),
    sage  int,
    primary key(sno)
);

insert into pro values('p1','이정무','컴퓨터',36);
insert into pro values('p2','우태하','컴퓨터',32);
insert into pro values('p3','이성민','건축',45);

insert into stu values('s1','유준호','컴퓨터',23);
insert into stu values('s2','오정민','컴퓨터',34);
insert into stu values('s3','이태현','건축',22);
insert into stu values('s4','신현주','건축',21);

select * from pro;
select * from stu;

SELECT sname, sage						
FROM stu						
WHERE sage =(SELECT MAX(sage) FROM stu);						

SELECT sname, S1.dept, sage										
FROM stu S1										
WHERE sage = (SELECT MAX(sage) FROM stu S2 WHERE S1.dept = S2.dept );

SELECT sno, sname, sage						
FROM stu						
WHERE sage > ANY(SELECT page FROM pro );						
										
SELECT sname, dept, sage									
FROM stu									
WHERE dept = (SELECT pro.dept FROM pro WHERE pname='이정무');	

SELECT sname, dept, sage								
FROM stu								
WHERE dept IN(SELECT dept FROM pro WHERE pno IN('p1','p2'));							
								
SELECT pno, pname, page 						
FROM pro						
WHERE page > ALL(SELECT sage FROM stu);						
