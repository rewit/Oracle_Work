--이곳은 관리자 화면입니다
--C:\bizwork\mydb 폴더에 user5TS 이름으로 tablespace를 생성하고
--초기 크기는 500MB, 자동증가 100KB

--user5 사용자를 생성
--DBA로 권한을 부여

--user5 접속정보를 설정하고
--user5 질의 작성기 창을 열어서


--student 엑셀파일을 참조하여 학생테이블을 생성하고
--엑셀 데이터를 임포트


CREATE TABLESPACE USER5TS
DATAFILE 'C:/bizwork/mydb/user5TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100K;


CREATE USER user5
IDENTIFIED BY 1234
DEFAULT TABLESPACE USER5TS;

GRANT DBA TO user5;

ALTER USER user2 DEFAULT TABLESPACE user5TS;




