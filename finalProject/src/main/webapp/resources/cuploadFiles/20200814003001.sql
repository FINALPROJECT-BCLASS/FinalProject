DROP SEQUENCE SEQ_PID;
DROP SEQUENCE SEQ_PNO;
DROP SEQUENCE SEQ_BSK;
CREATE SEQUENCE SEQ_PID START WITH 1; --PAINT 컬럼에사용
CREATE SEQUENCE SEQ_PNO START WITH 1; -- PAINT_PHOTO 컬럼에사용
CREATE SEQUENCE SEQ_BSK START WITH 1; -- 장바구니에서 사용
CREATE SEQUENCE SEQ_QNA START WITH 1; --QNA 에서사용
DROP SEQUENCE SEQ_ORD;
CREATE SEQUENCE SEQ_ORD START WITH 1; --ORDER_TABLE 에서사용


  CREATE OR REPLACE FORCE VIEW "SEMI"."V_GALLERY" ("작품번호", "작품이름", "작품가격", "카테고리", "작가이름", "작품소개", "작품제작년도", "사이즈번호", "좋아요", "작가아이디") AS 
  SELECT P.PAINT_NO 작품번호 ,PAINT_NAME 작품이름,PAINT_PRICE 작품가격,CATEGORY 카테고리,ARTIST_NAME 작가이름,PAINT_INT 작품소개
            ,PAINT_MDATE 작품제작년도, SIZE_NO 사이즈번호, LIKES 좋아요, M.USER_ID 작가아이디
    FROM PAINT P
    JOIN MASTERPIECE M ON (P.PAINT_NO = M.PAINT_NO)
    JOIN MEMBER ME ON (M.USER_ID = ME.USER_ID);
    
SELECT * FROM PAINT_PHOTO WHERE FILELEVEL=0 AND PAINT_NO BETWEEN 1 AND 10;

CREATE OR REPLACE VIEW V_PAINT
AS SELECT P.PANIT_NO , PAINT_NAME,PAINT_PRICE , CATEGORY,
          ARTIST_NAME,PAINT_INT,P.PAINT_MADTE, PS.WIDTH, PS.HEIGHT ,T.TAG_NAME
    FROM PAINT P
    JOIN PAINT_SIZE PS ON( P.SIZE_NO = PS.SIZE_NO)
    JOIN TAG T ON(P.PAINT_NO = T.PAINT_NO);
    
UPDATE PAINT_Q SET PQ_YN='Y' WHERE PQ_NO=8 AND PQ_YN='N';

ALTER TABLE RECEIPT_TABLE DROP COLUMN REC_LIST;

INSERT INTO ORDER_TABLE VALUES(SEQ_ORD.NEXTVAL,1,'admin','김경섭','123123','123','13494 경기 성남시 분당구 삼평동 681 123123','무통장입금');

ALTER TABLE ORDER_TABLE ADD(PAY_TYPE NVARCHAR2(20));


SELECT * FROM PAINT WHERE PAINT_PRICE BETWEEN 0 AND 100000000 ORDER BY 1;
SELECT * FROM PAINT WHERE PAINT_NO BETWEEN 0 AND 4 ORDER BY 1;


SELECT O.ORDER_NO, P.PAINT_NO,PP.AFILE,PAINT_NAME,P.ARTIST_NAME,PAINT_PRICE,B.ORDER_DATE,B.ORDER_STATUS 
				FROM ORDER_TABLE O 
				JOIN BUY_LIST B ON (O.ORDER_NO=B.ORDER_NO)  
				JOIN PAINT_PHOTO PP ON (O.PAINT_NO=PP.PAINT_NO)  
				JOIN PAINT P ON (O.PAINT_NO=P.PAINT_NO) 
				WHERE O.USER_ID='rudtjq810' AND PP.FILELEVEL = 0
                ORDER BY O.ORDER_NO DESC;
                
                
SELECT P.PAINT_NO , PAINT_NAME, PAINT_PRICE, CATEGORY, ARTIST_NAME, PAINT_INT, PAINT_MDATE, SIZE_NO, PP.AFILE, PP.FILEPATH
FROM PAINT P
JOIN PAINT_PHOTO PP ON (P.PAINT_NO =PP.PAINT_NO)
WHERE P.PAINT_NO= 2 AND PP.FILELEVEL = 0;



CREATE OR REPLACE VIEW MASTERPIECE_PAINT
AS
SELECT ROWNUM R, P.PAINT_NO, CNT, P.PAINT_NAME, P.ARTIST_NAME 
FROM ( SELECT PAINT_NO, COUNT(*) CNT
             FROM MASTERPIECE
             GROUP BY PAINT_NO
             ORDER BY CNT DESC
             ) M, PAINT P
WHERE P.PAINT_NO = M.PAINT_NO;  

commit;