-- USER1으로 접속한 화면
CREATE TABLE tbl_user (
    u_name nVARCHAR2(30),
    u_tel nVARCHAR2(20),
    u_addr nVARCHAR2(125)
);

INSERT INTO tbl_user(u_name, u_tel, u_addr)
VALUES('홍길동','001','서울특별시');

INSERT INTO tbl_user(u_name)
VALUES('성춘향');

INSERT INTO tbl_user(u_name,u_addr)
VALUES('이몽룡','한양');

INSERT INTO tbl_user(u_tel, u_addr)
VALUES('002','광주광역시');

SELECT * FROM tbl_user; 

SELECT * FROM tbl_user
WHERE u_name = '이몽룡' ;

-- tbl_user  테이블에 저장된 값들 중에서 u_name 칼럼이 null 인 리스트만 보여라
SELECT * FROM tbl_user
WHERE u_name IS NULL;

-- tbl_user 테이블에 저장된 값들 중에서 u_name 칼럼에 값이 저장된 리스트만 보여라
SELECT * FROM tbl_user
WHERE u_name IS NOT NULL;




