--여기는 user3 화면입니다 

SELECT SC.sc_num,ST.st_name,SC.sc_subject,SC.sc_score
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num;
        
        
SELECT SC.sc_num,ST.st_name,SUM(SC.sc_score)
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num,ST.st_name
ORDER BY Sc.sc_num;

--ROUND : 반올림
SELECT SC.sc_num,ST.st_name,ROUND(AVG(SC.sc_score))
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num,ST.st_name
ORDER BY Sc.sc_num;

--TRUNC : 버림
SELECT SC.sc_num,ST.st_name,TRUNC(AVG(SC.sc_score))
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num,ST.st_name
ORDER BY Sc.sc_num;

SELECT SC.sc_num,
       ST.st_name AS 총점,
       SUM(sc.sc_score)AS 총점,
       TRUNC(AVG(SC.sc_score)) AS 평균1버림,
       ROUND(AVG(SC.sc_score)) AS 평균2반올림
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON SC.sc_num = ST.st_num
GROUP BY Sc.sc_num,ST.st_name
HAVING ROUND(AVG(SC.sc_score)) >= 80
ORDER BY Sc.sc_num;
