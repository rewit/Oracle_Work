--여기는 USER4 화면입니다


CREATE TABLE tbl_iolist (
    
    io_seq	NUMBER	PRIMARY KEY,
    io_date	VARCHAR2(10) NOT NULL,
    io_product	nVARCHAR2(50) NOT NULL,
    io_dept	nVARCHAR2(50) NOT NULL,
    io_dept_ceo	nVARCHAR2(30),
    io_inout	nVARCHAR2(10) NOT NULL,
    io_amt   NUMBER,
    io_price NUMBER,	
    io_total NUMBER

);

SELECT * FROM tbl_iolist;

SELECT COUNT(*) FROM tbl_iolist;

--매입과 매출을 구분해서 개수 세기
SELECT io_inout,COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

--tbl_iolist 테이블의 제2정규화 작업 진행
--상품정보를 tbl_iolist로부터 분리해서 상품테이블로 생성

SELECT io_product
FROM tbl_iolist
GROUP BY io_product
--상품 이름중 1개씩만 골라서 리스트로 추출
ORDER BY io_product;
--정렬


--상품테이블 생성
    CREATE TABLE tbl_product(
    p_code	VARCHAR2(7)	PRIMARY KEY,
    p_name	nVARCHAR2(50) NOT NULL,
    p_iprice	NUMBER ,
    p_oprice	NUMBER		
    );
    
    SELECT COUNT(*) FROM tbl_product;
    
    --거래처 정보 분리를 위해서
    --상품정보(tbl_iolist)에서 거래처 정보를 분리
    
    SELECT io_dept, io_dept_ceo
    FROM tbl_iolist
    GROUP BY io_dept, io_dept_ceo
    ORDER BY io_dept;
    
    
    CREATE TABLE tbl_comp (
    
c_code	VARCHAR2(5)	PRIMARY KEY,	
c_name	nVARCHAR2(50)	NOT NULL,
c_ceo	nVARCHAR2(50)	NOT NULL,
c_tel	nVARCHAR2(15),
c_addr	nVARCHAR2(150)
);

SELECT COUNT(*) FROM tbl_comp;

--상품코드와 거래처코드를 추가하기 위한 칼럼 추가
ALTER TABLE tbl_iolist ADD io_pcode VARCHAR2(7);
ALTER TABLE tbl_iolist ADD io_ccode VARCHAR2(5);

UPDATE tbl_iolist IO
SET io_pcode =
    (SELECT P.p_code FROM tbl_product P
     WHERE P.p_name = IO.io_product
     ); 

--거래처 정보에서 거래처 코드를 가져와서 iolist 테이블에 update
UPDATE tbl_iolist IO
SET io_ccode = 
(
    SELECT C.c_code FROM tbl_comp C
    WHERE C.c_name = IO.io_dept AND
    C.c_ceo = IO.io_dept_ceo
    );
    
ALTER TABLE tbl_iolist DROP COLUMN io_product;
ALTER TABLE tbl_iolist DROP COLUMN io_dept;    
ALTER TABLE tbl_iolist DROP COLUMN io_dept_ceo;

--tbl_iolist 테이블에 제2 정규화 완성

