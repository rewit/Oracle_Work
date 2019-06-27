--여기는 user5 화면입니다

SELECT
    *
FROM tbl_student;


COMMIT;

SELECT MAX(st_no) FROM tbl_student;

--칼럼의 타입이 CHAR이고 칼럼의 데이터들이 숫자형일떄만 가능
SELECT MAX(st_no) +1 FROM tbl_student;

--현재 학생 테이블 tbl_student에서 st_no에 가장 마지막 학번 +1의 값으로
--새로운 학번을 생성
SELECT LPAD(MAX(st_no) +1,3,'0') FROM tbl_student;

--PAD : 특정한 길이의 문자열의 패턴을 만드는 방법
--RPAD(값,크기,문자열)
--전체 문자열의 크기를 지정하고, 값을 왼쪽에 배치시키고 남은 부분의 오른쪽에 '문자열'로 채우기
SELECT RPAD(3,5,'0') FROM DUAL;

--LPAD(값,크기,문자열)
--전체 문자열의 크기를 지정하고, 값을 오른쪽에 배치시키고 남은 부분의 왼쪽에 '문자열'로 채우기
SELECT LPAD(3,5,'A') FROM DUAL;


SELECT * FROM tbl_score;


