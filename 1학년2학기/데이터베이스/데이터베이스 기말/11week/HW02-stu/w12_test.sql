
-- 조인 실습용(MySQL)
drop table if exists freshman;
drop table if exists dmember;

CREATE TABLE freshman ( 
   name    VARCHAR(12) NOT NULL ,
   address  VARCHAR(9)
);

CREATE TABLE dmember ( 
   name        VARCHAR(12) NOT NULL ,
   dept_name VARCHAR(30)
);

INSERT INTO freshman VALUES('김광식', '서울');
INSERT INTO freshman VALUES('김현정', '대전');
INSERT INTO freshman VALUES('조영수', '대전');

INSERT INTO dmember VALUES('김광식', '컴퓨터공학과');
INSERT INTO dmember VALUES('김현정', '산업공학과');
INSERT INTO dmember VALUES('이진영', '전자공학과');

SELECT * FROM freshman;
SELECT * FROM dmember;

use testdb;

drop table if exists R1;
drop table if exists S1;

CREATE TABLE R1 (
	A int ,
	B int 
);

CREATE TABLE S1 (
	A int ,
	C int ,
             D int 
);

INSERT INTO R1 VALUES (1, 4);
INSERT INTO R1 VALUES (2, 5);

INSERT INTO S1 VALUES (1,3,4);
INSERT INTO S1 VALUES (2,2,6);
INSERT INTO S1 VALUES (3,1,9);

select * from r1;
select * from s1;

-- 1) 카티션 프로덕트
select * from R1, S1;

-- 2) 동등 조인
select * from R1, S1
where R1.A = S1.A;

-- 3) 자연조인
select R1.A, B, C, D
from R1, S1
where R1.A = S1.A;

-- 4) 세타 조인
select * from R1, S1
where R1.A >= S1.C;

drop table if exists omember;
drop table if exists group_ex;

CREATE TABLE omember ( 
   id         CHAR(3)     NOT NULL ,
   groupid CHAR(1)
);

CREATE TABLE group_ex ( 
   groupid   CHAR(1)   NOT NULL ,
   position   VARCHAR(12)
);

INSERT INTO omember VALUES('100', 'A');
INSERT INTO omember VALUES('101', 'B');
INSERT INTO omember VALUES('102', 'A');
INSERT INTO omember VALUES('102', 'F');

INSERT INTO group_ex VALUES('A', '서울');
INSERT INTO group_ex VALUES('B', '대구');
INSERT INTO group_ex VALUES('C', '광주');
INSERT INTO group_ex VALUES('D', '부산');
INSERT INTO group_ex VALUES('E', '대전');

SELECT * FROM omember;
SELECT * FROM group_ex;

-- 1) 카디션 프로덕트
SELECT *			
FROM  omember, group_ex;			

-- 2) 동등조인
SELECT *				
FROM  omember, group_ex				
WHERE omember.groupid = group_ex.groupid;				

-- 3) 자연조인
SELECT omember.groupid, id, position				
FROM  omember, group_ex				
WHERE omember.groupid = group_ex.groupid;				

-- 4) 왼쪽외부조인
SELECT *					
FROM   omember LEFT OUTER JOIN group_ex					
ON omember.groupid = group_ex.groupid;					

-- 5) 오른쪽 외부조인
SELECT *						
FROM   omember RIGHT OUTER JOIN group_ex						
ON       omember.groupid = group_ex.groupid;						

-- 6) 완전외부조인
SELECT *					
FROM   omember LEFT OUTER JOIN group_ex					
ON       omember.groupid = group_ex.groupid					
UNION					
SELECT *					
FROM   omember RIGHT OUTER JOIN group_ex					
ON       omember.groupid = group_ex.groupid;					

drop table if exists emp;
drop table if exists project;

CREATE TABLE emp ( 
    ename    VARCHAR(12)  NOT NULL ,
    pno       int
);

CREATE TABLE project ( 
   pno        int                  NOT NULL ,
   pname    VARCHAR(20)
);

INSERT INTO emp VALUES('홍길동', 101);
INSERT INTO emp VALUES('임꺽정', 102);
INSERT INTO emp VALUES('박찬호', 101);
INSERT INTO emp VALUES('박찬호', 103);
INSERT INTO emp VALUES('신동엽', NULL);

INSERT INTO project VALUES(101, '작전중');
INSERT INTO project VALUES(102, '특공대');
INSERT INTO project VALUES(103, '유레카');
INSERT INTO project VALUES(104, '다모여');

SELECT * FROM emp;
SELECT * FROM project;

-- 1) 카티션 프로덕트
SELECT *		
FROM  emp, project;		

-- 2) 동등조인
SELECT *				
FROM  emp, project				
WHERE emp.pno = project.pno;

-- 3) 자연조인	
SELECT emp.pno, ename, pname				
FROM  emp, project				
WHERE emp.pno = project.pno;				
			
-- 4) 왼쪽 외부조인				
SELECT *				
FROM   emp LEFT OUTER JOIN project				
ON       emp.pno = project.pno;				
					
-- 5) 오른쪽 외부조인				
SELECT *				
FROM   emp RIGHT OUTER JOIN project				
ON       emp.pno = project.pno;				

-- 6) 완전 외부조인				
SELECT *				
FROM   emp LEFT OUTER JOIN project				
ON       emp.pno = project.pno				
UNION				
SELECT *				
FROM   emp RIGHT OUTER JOIN project				
ON       emp.pno = project.pno;				

-- 3-1 ---------------
/* member_set.sql */
/* 집합연산 (합집합, 교집합, 차집합) */
drop table if exists 정회원;
drop table if exists 준회원;
 
CREATE TABLE 정회원 (
    번호 		INT 	PRIMARY KEY  ,
    이름 		varCHAR(12) 	NOT NULL ,
    주민번호 	CHAR(14) 	NOT NULL ,
    휴대폰번호 	CHAR(14) 	NOT NULL,
    이메일 	VARCHAR(30) ,
    등록일 	CHAR(8)
);

CREATE TABLE 준회원 (
    번호 		INT 	PRIMARY KEY  ,
    이름 		varCHAR(12) 	NOT NULL ,
    주민번호 	CHAR(14) 	NOT NULL ,
    휴대폰번호 	CHAR(14) 	NOT NULL,
    이메일 	VARCHAR(30) ,
    등록일 	CHAR(8)
);
 
/* 정회원 데이터 입력 */

INSERT INTO 정회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 1, '홍길동', '820416-1234567', '(011) 123-1231','gdhong@hitel.net','20070302');
INSERT INTO 정회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 2, '임꺽정', '830507-2345678', '(010) 122-1222','jung@hanmail.net','20050422');
 
/* 준회원 데이터 입력 */
 
/* 참고) 집합연산 실습을 위해서 홍길동 동일한 데이터를 입력한다. 즉, 홍길동 은 정회원, 준회원 이다 */
 
INSERT INTO 준회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 1, '홍길동', '820416-1234567', '(011) 123-1231','gdhong@hitel.net','20070302');
INSERT INTO 준회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 3, '박찬호', '850321-1456789', '(010) 133-1231','chpark@hanmail.net','20090512');
INSERT INTO 준회원 ( 번호, 이름, 주민번호, 휴대폰번호, 이메일, 등록일)
VALUES ( 4, '선동열', '761122-1889911', '(010) 144-1222','sun@naver.com','20080605');
 
SELECT * FROM 정회원;
SELECT * FROM 준회원;

select 이름, 이메일 from 정회원
union
select 이름, 이메일 from 준회원;

select 이름, 이메일 from 정회원
union all
select 이름, 이메일 from 준회원;