
-- USER1으로 접속한 화면

-- DUAL : 오라클에만 있는 DUMMY(가상의) TABLE
--      어떤 계산식 등을 임시로 테스트 해보고자 할때 사용하는 문법
SELECT 30 + 40 FROM DUAL;

SELECT '대한민국만세' FROM DUAL;
SELECT '대한' + '민국' FROM DUAL;

SELECT '대한' || '민국' FROM DUAL; -- 오라클 전용
--  SELECT '대한' & '민국' FROM [table];  -- 다른 DBMS에서