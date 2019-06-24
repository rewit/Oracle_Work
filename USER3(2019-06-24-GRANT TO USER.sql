--여기는 user3 화면입니다

SELECT * FROM tbl_score;
SELECT * FROM tbl_student;

INSERT INTO tbl_score(sc_seq, sc_num,sc_susject,sc_score)
VALUES (SEQ_SCOR.NEXTVAL,'00003','국어',80)

INSERT INTO tbl_score(sc_seq, sc_num,sc_susject,sc_score)
VALUES (SEQ_SCOR.NEXTVAL,'00003','영어',70)

INSERT INTO tbl_score(sc_seq, sc_num,sc_susject,sc_score)
VALUES (SEQ_SCOR.NEXTVAL,'00003','수어',90)

COMMIT;

    --user2와 user3는 모두 DBA 권한을 가지고 있다
    --만약 user2가 DBA가 아닌 제한된 권한을 가진 사용자라면
    --다른 schema에 있는 table은 조회가 불가능하다
    --내 schema에 있는 table을 다른 사용자가 조회할 수 있도록
    --권한을 열어주어야 한다
    --내 schema에 있는 tbl_score table을 user2가 조회할수 있도록
    --권한을 열어준다
    GRANT SELECT ON tbl_score TO user2;
    --내 tbl_score table에 있는 user2가 데이터를 추가할수 있다
    GRANT INSERT ON tbl_score TO user2;
    GRANT DELETE ON tbl_score TO user2;
    GRANT UPDATE ON tbl_score TO user2;
    
    GRANT INSERT,SELECT,UPDATE,DELETE ON tbl_score TO user2;

--전체 부여된 권한 조회    
    SELECT * FROM DBA_SYS_PRIVS ORDER BY GRANTEE;
--현재 사용자에게 부여된 권한 조회
    SELECT * FROM USER_SYS_PRIVS;
--현재 사용자가 다른 사용자에게 부여한 권한 조회
    SELECT * FROM USER_TAB_PRIVS;

    SELECT * FROM DBA_TAB_PRIVS;