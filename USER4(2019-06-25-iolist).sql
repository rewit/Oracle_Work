--여기는 user4 화면입니다


--월별로 매입,매출, 마진을 확인하는 쿼리

SELECT SUBSTR(io_date,0,7),--년-월로 추출
    SUM (DECODE(io_inout,'매입',io_total,0)) AS 매입합계,
    SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출합계,
    
    SUM(DECODE(io_inout,'매출',io_total,0)) -
    SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진
    
    FROM tbl_iolist
    GROUP BY SUBSTR(io_date,0,7)
    
    
    UNION --여러개의 SELECT문장에서 보여지는것을 하나의 리스트로 보여지게 묶음
          --그 뒤에 나오는 타입이 같아야 한다
          --UNION도 속도가 느림 
    SELECT '=====',00000,00000,00000 FROM DUAL
    
    UNION
    
    SELECT
    '총계',
    SUM (DECODE(io_inout,'매입',io_total,0)) AS 매입합계,
    SUM(DECODE(io_inout,'매출',io_total,0)) AS 매출합계,
    
    SUM(DECODE(io_inout,'매출',io_total,0)) -
    SUM(DECODE(io_inout,'매입',io_total,0)) AS 마진

FROM tbl_iolist;    
