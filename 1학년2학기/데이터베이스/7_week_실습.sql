-- [실습 1] 무결성 제약조건

-- 신입생(학번,주민,이름, 학년, 주소,학과명)
drop table 신입생;

CREATE TABLE 신입생(
     학번              char(8) , 
     주민등록번호  		  char(14)      UNIQUE    ,					 -- 2)
     이름              varchar(20) ,
     학년              int           DEFAULT 1  ,				 -- 3)
     성별              char(1)    	CHECK (성별 IN('남', '여')) ,  -- 4)
     주소              varchar(20) ,
     학과명            varchar(20) ,
     PRIMARY KEY(학번)  											 -- 1)
);
-- 테이블 구조 확인
DESC 신입생;

-- 다음 조건을 만족하는 데이터정의어를 작성하시오
-- (조건)
-- 1) 기본키는 학번으로 지정
-- 2) 주민등록번호는 중복된 값을 갖지 않는다
-- 3) 학년은 기본값 1을 갖는다
-- 4) 성별 입력값은 남, 여 로 값을 제한한다


-- [실습 2] 과목(과목번호, 이름, 강의실, 개설학과, 시수)
drop table 과목;

CREATE TABLE 과목 ( 
      과목번호 char(4)            NOT NULL  , 
      이름       VARCHAR(20)   , 
      강의실    CHAR(3)           ,
      개설학과 VARCHAR(20)    ,
      시수       INT   
      PRIMARY KEY(과목번호) -- 2)
) ; -- 1)

-- 테이블 구조 확인
DESC 과목;

-- 다음 조건을 만족하는 데이터 정의어 작성
-- <조건>
-- 1) 과목번호,이름,강의실,개설학과, 시수 로 구성된 과목 테이블을 생성
-- 2) 기본키는 과목번호로 설정한다


-- [실습 3] 학생(학번, 이름, 주소, 학년, 나이, 휴대폰번호, 소속학과)
drop table 학생;

CREATE TABLE 학생 (
       학번       CHAR(4)           NOT NULL ,
       이름       VARCHAR(20)       NOT NULL ,
       주소       VARCHAR(50)       DEFAULT '미정' , -- 3)
       학년       INT  ,
       나이       INT  ,
       성별       CHAR(1) ,
       휴대폰번호  CHAR(14) 		   UNIQUE , -- 2)
       소속학과    VARCHAR(20) ,
       PRIMARY KEY(학번) -- 1)
) ;

-- 테이블 구조 확인
DESC 학생;

-- <조건>
-- 1) 기본키는 학번으로 설정한다
-- 2) 휴대폰번호를 대체키로 지정한다
-- 3) 주소 에는 기본값을 설정한다 (기본값: 미정)


-- [실습 4] 수강(학번,과목번호,신청날짜,중간성적,기말성적,평가학점)
drop table 수강;

CREATE TABLE 수강 (
         학번     char(6)           	NOT NULL ,
         과목번호  CHAR(4)          	NOT NULL ,
         신청날짜   DATE              ,
         중간성적   INT                	default 0 , -- 4)
         기말성적   INT                	default 0 , -- 4)
         평가학점   CHAR(1) ,        
          PRIMARY KEY(학번, 과목번호) , -- 1)
	  foreign key(학번) 				-- 2)
			references 학생(학번) ,
	  foreign key(과목번호) 			-- 3)
			references 과목(과목번호)

) ; 

-- 테이블 구조 확인
DESC 수강;

-- <조건>
-- 1) 기본키는 (학번,과목번호) 로 설정한다
-- 2) 학번 은 외래키로 학생 테이블의 학번을 참조한다
-- 3) 과목번호는 외래키로 과목 테이블의 과목번호를 참조한다
-- 4) 중간성적, 기말성적에는 기본값을 설정한다(기본값: 0)


