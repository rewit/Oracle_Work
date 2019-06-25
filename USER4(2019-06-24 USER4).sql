--user4
CREATE TABLE tbl_student(

st_no	CHAR(3)	PRIMARY KEY	NOT NULL,
st_name	nVARCHAR2(30) NOT NULL,
st_addr	nVARCHAR2(50),		
st_grade	NUMBER(1) NOT NULL,
st_height	NUMBER(3),		
st_weight	NUMBER(3),		
st_nick	nVARCHAR2(20),		
st_nick_rem	nVARCHAR2(50),		
st_dep_no	CHAR(3)	NOT NULL

);

SELECT * FROM tbl_student;

CREATE TABLE tbl_dept(

dept_no	CHAR(3)	PRIMARY KEY	NOT NULL,
dept_name	nVARCHAR2(50)	NOT NULL,
dept_pro	nVARCHAR2(50),		
dept_te	nVARCHAR2(50)
);

SELECT * FROM tbl_dept;
--tbl_student 와 tbl_dept 테이블을 LEFT JOIN해서 리스트를 확인
SELECT * FROM tbl_student;


SELECT * FROM tbl_student,tbl_dept
WHERE st_dep_no = dept_no;






    
    