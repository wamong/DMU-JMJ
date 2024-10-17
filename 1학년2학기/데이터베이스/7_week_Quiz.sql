create database studydb;

use studydb;

drop table 학생;
drop table 과목;
drop table 수강;


create table 학생(
	학번		char(4)		NOT NULL ,
    학생명	varchar(12) ,
    학년		int ,
	primary key(학번)
);

create table 과목(
	과목번호 	char(5) ,
    과목명 	varchar(30) , 
    primary key(과목번호)
);

    
create table 수강(
	학번 	char(4) ,
    과목번호 	varchar(30) ,
	성적 	int ,
    primary key(학번, 과목번호) ,
    foreign key(학번) 	references 학생(학번) ,
    foreign key(과목번호) references 과목(과목번호)
);

select * from 학생;

insert into 학생 values('1111', '홍길동', 1);
insert into 학생 values('2222', '김윤식', 3);
insert into 학생 values('3333', '이정진', 2);
insert into 학생 values('4444', '홍진아', 1);

select * from 과목;

insert into 과목 values('CS100', '데이터베이스');
insert into 과목 values('CS101', '운영체제');
insert into 과목 values('CS102', '자료구조');

select * from 수강;

insert into 수강 values('1111', 'CS100', 98);
insert into 수강 values('1111', 'CS102', 88);
insert into 수강 values('2222', 'CS102', 90);
insert into 수강 values('3333', 'CS100', 92);




