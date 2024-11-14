use studydb;

drop table 주소록;

-- 세이프 모드 해제
SET SQL_SAFE_UPDATES = 0;

-- 데이터 구조 확인 desc(describe)
desc 주소록;

-- 데이터 조회
select * from 주소록;

-- 주소록(이름, 전화번호, 주소, 생일)
create table 주소록(
	번호 	int 		auto_increment ,
    이름 	char(10) 	not null ,
    전화번호 	char(13) ,
    주소 	varchar(10) , 
    생일 	varchar(11) , 
    primary key(번호)
);

-- 주소록(이름, 전화번호, 주소, 생일)
INSERT INTO 주소록(이름, 전화번호, 주소, 생일) VALUES('홍길동','010-1234-5678','서울','3월 15일');

INSERT INTO 주소록(이름, 전화번호, 주소, 생일) VALUES('이몽룡','010-3354-5643','부산','12월 14일');

INSERT INTO 주소록(이름, 전화번호, 주소, 생일) VALUES('최용만','321-2345','대전','5월 8일');

INSERT INTO 주소록(이름, 전화번호) VALUES('유정두','010-9999-9999');

INSERT INTO 주소록(이름, 전화번호) VALUES('이건우','010-2132-2345');

-- 1. 홍길동의 전화번호를 '010-3245-4368' 로 수정하라
update 	주소록 
set 	전화번호 ='010-3245-4368' 
where 	이름 = '홍길동';

-- 2. 이건우의 주소는 '서울', 생일은 '8월 23일' 로 수정하라
update 	주소록
set 	주소='서울', 생일='8월23일'
where 	이름= '이건우';

-- 3. 최용만의 레코드를 삭제하라
delete 
from	주소록
where	이름 = '최용만';

select * from 주소록;
