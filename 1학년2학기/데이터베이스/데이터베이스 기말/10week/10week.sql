select * from customer;

-- 1-1) 테이블의 모든 열을 검색하라
SELECT	*
FROM       customer;

-- 1-2) 테이블의 모든 열을 검색(필드명 사용)
SELECT	cno, cname, city, point
FROM       customer;

-- 1-3) 고객의 고객명, 거주지를 검색하라(테이블의 특정 열을 검색)
SELECT	cname, city
FROM       customer;

-- 1-4) cname 은 성명, city는 거주지로 출력하라(화면에 표시되는 열 이름 변경하여 검색) 
SELECT	cname 성명, city as 거주지
FROM       customer;

-- 1-5) customer 테이블에서 거주지를 검색하라
SELECT	city
FROM       customer;

-- 1-6) 거주지를 검색하는데 중복 행을 제거하여 한 번씩만 검색하라
-- (distinct) 사용
SELECT	distinct city
FROM       customer;


-- 2-1) 고객번호가 c101 인 고객의 모든 정보를 검색하라
SELECT	*
FROM       customer
WHERE	cno = 'c101' ;

-- 2-2) 포인트가 400 이하인 고객의 모든 정보를 검색하라
SELECT	*
FROM       customer
WHERE      point <= 400 ;

-- 2-3) 거주지가 서울 이면서 포인트가 500 이상인 고객의 이름, 거주지, 포인트를 검색하라
SELECT	cname, city, point
FROM	customer
WHERE	city = '서울' AND point >= 500 ;

-- 2-4) 거주지가 서울 이거나 포인트가 500 이상인 고객의 이름, 거주지, 포인트를 검색하라
SELECT	cname, city, point
FROM	customer
WHERE	city = '서울' OR point >= 500 ;

-- 2-5) 포인트가 350 부터 500 사이인 고객이름, 거주지, 포인트를 검색하라
-- 부등호 사용
SELECT	cname, city, point
FROM	customer
WHERE	point >= 350 AND point <= 500 ;

-- BETWEEN … AND 사용
SELECT	cname, city, point
FROM	customer
WHERE	point BETWEEN 350 AND 500 ;

-- 2-6) 거주지가 서울 이거나 안양인 고객번호, 이름, 거주지를 검색하라
-- 부등호 사용
SELECT	cno, cname, city
FROM       customer
WHERE	city = '서울' OR city = '안양' ;

-- IN 사용
SELECT	*
FROM       customer
WHERE	city IN('서울', '안양') ;


-- 2-7) 거주지가 서울이 아니거나 안양이 아닌 고객번호, 이름, 거주지를 검색하라
-- 부등호 사용
SELECT	*
FROM       customer
WHERE      city != '서울' AND city <> '안양' ;

-- NOT IN 사용
SELECT	*
FROM   	customer
WHERE   city NOT IN('서울', '안양') ;


-- 3-1) 정씨 성을 가진 고객의 모든 열을 검색하라
SELECT	*
FROM       customer
WHERE      cname LIKE '정%' ;

-- 3-2) 이름에 '동' 자가 들어가는 고객의 모든 열을 검색하라
SELECT	*
FROM      customer
WHERE     cname LIKE '%동%' ;

-- 3-3) 이름의 세번째 글자가 '우' 자가 들어가는 고객의 모든 열을 검색하라
SELECT	*
FROM       customer
WHERE      cname LIKE '__우' ; 

-- 3-4) 성이 홍씨, 박씨, 정씨인 고객을 검색하라	
SELECT	*
FROM       customer
WHERE      cname LIKE '홍%' OR cname LIKE '박%' OR cname LIKE '정%' ;

-- 성이 홍씨, 박씨, 정씨가 아닌 고객을 검색하라
SELECT	*
FROM       customer
WHERE      cname NOT LIKE '홍%' OR cname NOT LIKE '박%' OR cname NOT LIKE '정%' ; 

-- 3-5) 포인트가 없는 고객의 번호, 이름, 포인트를 검색하라
SELECT	*
FROM	customer
WHERE	point IS NULL ;

-- 포인트가 있는 고객의 번호, 이름, 포인트를 검색하라
SELECT	*
FROM	customer
WHERE	point IS NOT NULL ;

-- 4-1) 고객 테이블에서 이름을 오름차순 정렬하라	
SELECT	*
FROM	customer
ORDER BY	 cname ASC ;

-- 4-2) 거주지가 서울인 고객의 모든 데이터를 검색하는데, 이름의 오름차순 정렬하여 출력하라
SELECT	*
FROM       customer
WHERE      city = '서울' 
ORDER BY cname ASC ;

-- 4-3) 거주지의 오름차순으로 정렬하고, 거주지가 같으면 포인트의 내림차순으로 정렬하라
SELECT	*
FROM       customer
ORDER BY city ASC, point DESC ;

-- 4-4) 포인트가 많은 순으로(내림차순) 먼저 정렬하고, 같은 포인트는 이름의 오름차순으로 정렬하고
-- 이름이 같으면 거주지의 오름차순으로 정렬하여 검색하라 
SELECT	*
FROM       customer
ORDER BY point DESC, cname ASC, city ASC ;

-- 4-5) 다음의 의미는?
SELECT      cno,  cname,  city,  point  
FROM        customer  
ORDER  BY  3 ;