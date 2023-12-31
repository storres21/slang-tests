CREATE TABLE slang(
 ID VARCHAR2(60),
 SAL_DATE DATE,
 SQL_DATE DATE,
 OPPORTUNITY_DATE DATE,
 CLOSE_DATE DATE,
 C_SAL__C INTEGER,
 C_SQL__C INTEGER,
 C_OPP__C INTEGER,
 STAGENAME VARCHAR2(60)
 
);


SELECT SAL.MES, SAL.CANT, SQL.CANT, OPP.CANT
FROM
(SELECT TO_CHAR(SAL_DATE, 'MM') MES, COUNT(ID) CANT
FROM SLANG
WHERE C_SAL__C = 1
GROUP BY TO_CHAR(SAL_DATE, 'MM')) SAL,
(SELECT TO_CHAR(SQL_DATE, 'MM') MES, COUNT(ID) CANT
FROM SLANG
WHERE C_SQL__C = 1
GROUP BY TO_CHAR(SQL_DATE, 'MM')) SQL,
(SELECT TO_CHAR(OPPORTUNITY_DATE, 'MM') MES, COUNT(ID) CANT
FROM SLANG
WHERE C_OPP__C = 1
GROUP BY TO_CHAR(OPPORTUNITY_DATE, 'MM')) OPP
WHERE SAL.MES = SQL.MES
AND SAL.MES = OPP.MES;
