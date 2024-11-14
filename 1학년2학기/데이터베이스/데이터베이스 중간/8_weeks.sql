use testdb;

drop table 사원;

-- 사원(사원번호, 사원명, 연락처, 생일)
create table 사원 ( 
	사원번호 		char(4) 		not null ,
    사원명 		varchar(20) ,
    연락처 		char(13) ,
    생일 		varchar(15) ,
    primary key(사원번호)
);

-- 사원(사원번호, 사원명, 연락처, 생일)
insert into 사원(사원번호, 사원명, 연락처) values("D001", "정지영", " ");
insert into 사원(사원번호, 사원명, 연락처) values("D002", "김선주", "010-1111-1111");
insert into 사원(사원번호, 사원명, 생일) values("D003", "정성호", "10월04일");

select * from 사원;