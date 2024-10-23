-- 1-1 과제 (의사, 환자)
create database homework;

use homework;

drop table 의사;

create table 의사(
	의사번호	char(4)	NOT NULL ,
    의사이름	varchar(20) ,
    소속 	char(10) ,
    근무연수 	int ,
    primary key(의사번호)
);

select * from 의사;

insert into 의사 values ('D001', '정지영', '내과', '5');
insert into 의사 values ('D002', '김선주', '피부과', '10');
insert into 의사 values ('D003', '정성호', '정형외과', '15');
insert into 의사 values ('D004', '김동현', '비뇨기과', '9');
insert into 의사 values ('D005', '이유경', '정신의학과', '11');

drop table 환자;

create table 환자(
	환자번호	char(4) NOT NULL ,
    환자이름	varchar(20) , 
	나이		int ,
    담당의사	char(4) NOT NULL ,
    
	primary key(환자번호) ,
    
    foreign key(담당의사)
		references 의사(의사번호)
);

select * from 환자;

insert into 환자 values ('P001', '오우진', '31', 'D002');
insert into 환자 values ('P002', '채광주', '50', 'D001');
insert into 환자 values ('P003', '김용욱', '43', 'D003');
insert into 환자 values ('P004', '김홍근', '30', 'D005');
insert into 환자 values ('P005', '조형우', '41', 'D004');

-- 1-2 과제 (사원)
create table 사원(
	사원번호	char(4) ,
    사원이름	varchar(20) ,
    나이 int ,
    주소 char(20) ,
    직급 char(10) ,
    
    primary key(사원번호)
);

select * from 사원;

insert into 사원 values ('E001', '홍준화', 30, '서울시 마포구', '대리');
insert into 사원 values ('E002', '김연주', 28, '서울시 영등포구', '사원');
insert into 사원 values ('E003', '이명기', 32, '서울시 강남구', '사원');
insert into 사원 values ('E004', '정명진', 25, '서울시 강서구', '사원');
    