-- 여기는 USER3 화면입니다

CREATE TABLE tbl_score(
    sc_seq NUMBER PRIMARY KEY, --PRIMARY KEY를 선언해서 중복될 수 없음
    -- AUTO INCREMENT : 다른 DBMS에서는 INSERT를 수행할때 
    --칼럼의 값을 자동으로 넘버링 해주는 옵션, 
    --오라클 11 이하에서는 사용불가
    --오라클 12 이상에서는 사용가능
    sc_num CHAR(5) NOT NULL,
    sc_subject NVARCHAR2(10),
    sc_score NUMBER
    );
    
--오라클 11 이하에서는 자동증가 옵션이 없는 관계로 
--별도의 넘버링용 요소(객체)를 사용해서 자동 증가 효과를 만든다  
INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(1,'00001','국어',90);
    
INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(2,'00001','영어',80);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(3,'00001','수학',70);

SELECT *FROM tbl_score;

--오라클에서 자동증가되는 넘버링 값을 얻기 위해서
--생성하는 객체
CREATE SEQUENCE seq_score
START WITH 1 --시작값
INCREMENT BY 1; --증가값

SELECT seq_score.NEXTVAL FROM dual;

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00002','국어',88);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00002','영어',77);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00002','수어',98);

SELECT * FROM tbl_score;

UPDATE tbl_score
SET sc_score = 100
WHERE sc_seq = 10;

--만약 sc_seq칼럼이 없다면
UPDATE tbl_score
SET sc_score = 100
WHERE sc_num = '00002' AND sc_subject = '수학' ;
--여러 칼럼의 조건을 설정하여
--UPDATE나 DELETE는 가급적 사용하지 않는 것이 좋다.

--수학을 미술로 바꿀때
UPDATE sc_score
SET sc_subject = '미술'
WHERE sc_subject = '수학';

--UPDATE나 INSERT,DELETE를 수행하여도
--실제로 물리적 Table에 데이터가 저장되지 않는다
--그래서 데이터를 강제로 물리적 Table에 저장해줄 필요가 있다.
COMMIT;
--ROLLBACK과 반대되는 개념

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00003','국어',80);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00003','영어',90);

INSERT INTO tbl_score(sc_seq,sc_num,sc_subject,sc_score)
VALUES(SEQ_SCORE.NEXTVAL,'00003','수어',70);

SELECT * FROM tbl_score;

--ROLLBACK
--INSERT, UPDATE,DELETE된 데이터를 되돌리는 기능
--취소와 비슷한 개념이며
--가장 최근에 COMMIT된 이후의 명령수행(CUD)을 취소하는 역할
--또는 가장 최근에 CREATE된 명령을 수행한 이후의 명령수행(CUD)을 취소하는 역할
ROLLBACK;

SELECT * FROM tbl_score;