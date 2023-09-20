DESC EMP;
DESC DEPT;
DESC EMP;
DESC SALGRADE;
-----------------------------------------------------------
-- 기본 SELECT * (열을 의미) FROM EMP(테이블 이름); 세미콜론으로 끝남
SELECT * FROM EMP;
-- EMP 테이블에서 사원번호, 사원이름, 사원이 속한 부서번호만 조회
SELECT EMPNO, ENAME, DEPTNO
FROM EMP;
-- SQL문 작성 시 유의사항
-- SQL문은 대소문자를 구분하지 않음
-- SQL문장은 한줄 또는 여러 줄에 입력 될 수 있음
-- 일반적으로 키워드는 대문자로 입력한다.
-- 일반적으로 이름, 열 이름 등은 소문자로 작성한다.
-- SQL문의 마지막 절은 ;로 끝난다.
-- 사원번호와 부서번호만 나오도록 EMP 테이블 조회하기.
SELECT EMPNO, DEPTNO FROM EMP;
-- 별칭 설정하기 : AS, 열이름 또는 컬럼을 별칭으로 표시 할 수 있음
SELECT ENAME AS 이름, SAL AS 급여, SAL*12+COMM AS 연봉, COMM AS 성과급
FROM EMP;

-- 중복 제거하기 : DISTINCT, 데이터를 조회할 때 값이 중복되는 행이 여러개 조회되는 경우, 값이 중복된 행을 한개씩만 선택하고자 하는 경우 사용
SELECT DISTINCT JOB, DEPTNO FROM EMP;
-- 컬럼값을 계산하는 산술연산자 : +, -, *, /
SELECT ENAME, SAL, SAL + 12
FROM EMP;
-- WHERE 구문 : 데이터를 조회할 때 사용자가 원하는 조건에 맞는 데이터만 조회하고 싶을 때 사용 (행을 제한)
-- 여러 연산자와 함께 사용함
SELECT * FROM EMP
WHERE DEPTNO = 10; -- 데이터베이스에서는 = 같다라는 의미로 사용

SELECT * FROM EMP
WHERE EMPNO = 7369;
-- 급여가 2500 초과인 사원번호, 이름, 직무, 급여 출력 해보기
SELECT EMPNO, ENAME, JOB, SAL 
FROM EMP
WHERE SAL > 2500;

SELECT *
FROM EMP
WHERE SAL * 12 = 36000;

-- 성과급이 500 초과인 사원 출력
SELECT * FROM EMP
WHERE COMM > 500;

-- 입사일이 81년 1월1일 이전인 데이터를 조회하는 명령
-- 날짜를 비교할 경우 날짜 형식에 맞춰서 비교하면 됨
SELECT * FROM EMP
WHERE HIREDATE < '81/01/01';

-- 같지 않음을 표현하는 방법은 여러가지가 존재 <>, !=, ^=, NOT
SELECT * FROM EMP
WHERE NOT DEPTNO = 30;

-- 급여가 3000이상이고, 부서가 20번인 사원 조회
SELECT * 
FROM EMP
WHERE SAL >= 3000 AND DEPTNO = 20;

-- 급여가 3000 이상이고, 부서가 20번이고, 입사일이 82/01/01 이전 사람
SELECT * 
FROM EMP
WHERE SAL >= 3000 AND DEPTNO = 20 AND HIREDATE < '82/01/01';

-- 급여가 3000 이상이고 부서가 20번이거나 입사일이 82년 1월 1일 이전인 사원 조회
SELECT * 
FROM EMP
WHERE SAL >= 3000 AND (DEPTNO = 20 OR HIREDATE < '82/01/01');

-- 급여가 2500 이상이고 직업이 MANAGER인 사원정보만 출력
SELECT * 
FROM EMP
WHERE SAL >= 2500 AND JOB = 'MANAGER';

-- IN 연산자
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';
    
SELECT *
FROM EMP
WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');

SELECT *
FROM EMP
WHERE DEPTNO NOT IN(20, 30);

-- BETWEEN A AND B 연산자 : 일정한 범위를 조회할 때 사용하는 연산자
-- 급여가 2000이상 3000이하인 사원 조회
SELECT *
FROM EMP
WHERE SAL >= 2000 AND SAL <= 3000;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

-- 사원번호가 7689 ~ 9702 사이의 사원 조회
SELECT *
FROM EMP
WHERE EMPNO BETWEEN 7689 AND 9702

-- 1980년에 입사하지 않은 사원 조회
SELECT *
FROM EMP
WHERE NOT HIREDATE '1980/01/01' AND '1980/12/31';

-- LIKE, NOT LIKE 연산자 : 일부문자열이 포함되어 있는지 여부를 확인하는 연산자, 주로 검색에서 사용
-- % : 길이와 상관없이 모든 문자를 의미
--_ :문자 1자를 의미
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '%K%';

SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

-- 사원 이름에 AM이 포함되어 있는 사원데이터 출력
-- 사원 이름에 AM이 포함되어 있지 않은 사원데이터 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

SELECT *
FROM EMP
WHERE ENAME NOT LIKE '%AM%';
-- 사원이름에 AM이 포함되어 있지 않은 사원데이터 출력

-- NULL : 미확정 또는 알수 없는 값을 의미함, 그래서 연산, 할당, 비교 불가( = , N)
SELECT SAL*12+COMM AS 연봉, COMM
FROM EMP;

SELECT *
FROM EMP
WHERE COMM = NULL;

SELECT *
FROM EMP
WHERE ename LIKE '%\%P' ESCAPE '\';

SELECT ename, sal, sal*12+comm as annsal, comm
FROM EMP;
SELECT *
FROM EMP
WHERE COMM = NULL; -- ???? ??? 

-- IS NULL : NULL ???? ??? 
SELECT *
FROM EMP
WHERE COMM IS NULL; --NULL ???? ???

-- MANAGER?? ???? ????? ??? 
SELECT *
FROM EMP
WHERE MGR IS NOT NULL;

-- 정렬을 위한 ORDER BY 절 
SELECT *
FROM EMP
ORDER BY SAL ASC; -- ASC 는 오름 차순

-- 사원 번호 기준으로 오름차순 정렬 
SELECT *
FROM EMP
ORDER BY EMPNO DESC; 

-- 여러 컬럼 기준으로 정렬하기 
-- 정렬 조건이 없으면 기본적으로 오름차순 
-- 급여순으로 정렬하고 급여가 같은경우 이름순 정렬 
SELECT *
FROM EMP
ORDER BY SAL ASC,  ENAME DESC; -- 오름차순 정렬 이후 이름 기준 내림 차순 


-- 연결 연산자 : SELECT문 조회시 컬럼 사이에 특정한 문자를 넣고싶을떄 사용
SELECT ENAME || 'S JOB IS '|| JOB as EMPLOYEE 
FROM EMP;  
-- 이름S JOB IS 직업 으로 가공하여 출력함  DELETE

-- 1. 사원 이름이 S로 끝나는 사원 데이터 출력 DELETE
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

--2. 30번 부서에서 근무하는 사원중 직책이 SALESMAN인 사원의 사원번호 이름 직책 급여 부서번호 출력 

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE JOB='SALESMAN' 
AND DEPTNO = 30;

-- 3. 20, 30번 부서에 근무하는 사원 중 급여 2000 초과인 사원인 사원번호,이름,급여,부서 번호출력

SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE SAL >2000 
AND DEPTNO IN (20,30);

--4. BETWEEN 연산자 사용하지 않고 급여가 2000이상 3000이하 데이터 출력

SELECT *
FROM EMP
WHERE SAL >= 2000
AND SAL <= 3000;

-- 5. 사원 이름에 E가 포함되어 있는 30번 부서의 사원중 급여가 1000 ~ 2000사이가 아닌 사원이름
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO
FROM EMP
WHERE DEPTNO =30 
AND ENAME LIKE'%E%' 
AND SAL NOT BETWEEN 1000 AND 2000 ;

-- 6. 추가수당이 존재하지않고 상급자가 있고  직책이 MANAGER, CLERK인 사원에서
-- 사원 이름이 두번쨰 글자가 L이 아닌 사원의 정보를 출력함
SELECT *
FROM EMP
WHERE  COMM IS NULL 
AND MGR IS NOT NULL
AND JOB IN ('CLERK','MANAGER') 
AND ENAME NOT LIKE '_L%' ;


---------------------------------------------------------------
-- 문자 함수 : 문자 데이터를 가공하는것
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT *
FROM EMP
WHERE UPPER(ENAME) = UPPER('JAMES');

-- LENGTH 함수 : 문자열 길이를 반환
-- LENGTHB : 문자열의 바이트  수 반환
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

--SUBSTR /SUBSTRB : 문자열 자르기  (행 , 시작위치, 자르기순)
-- 데이스베이스 시작위치는 0이 아님, 3번째 매개변수를 생략하면 끝까지 
SELECT JOB, SUBSTR(JOB, 1, 2) , SUBSTR(JOB,3,2),SUBSTR(JOB, 5)
FROM EMP;

SELECT JOB,
    SUBSTR(JOB,-LENGTH(JOB)), -- 음수는 뒤에서부터, 길이에 대한 음수값으로 역순
    SUBSTR(JOB,-LENGTH(JOB),2), -- SALESMAN, -8이면 S위치에 길이가 2만큼 출력
    SUBSTR(JOB, -3)
FROM EMP;

-- 1. **EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회**
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 2. **EMP테이블에서 커미션을 받지 못하는 직원 조회**
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = 0;

-- 3. **EMP테이블에서 관리자가 없는 직원 정보 조회**
SELECT *
FROM EMP
WHERE MGR IS NULL;


-- 4. **EMP테이블에서 급여를 많이 받는 직원 순으로 조회**
SELECT *
FROM EMP
ORDER BY SAL DESC;
-- 5. **EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
**
SELECT *
FROM EMP
ORDER BY SAL DESC, COMM DESC;

-- 6. **EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)**
SELECT EMPNO,ENAME,JOB,HIREDATE
FROM EMP
ORDER BY HIREDATE ASC;
-- 7. **EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)**
SELECT EMPNO,ENAME
FROM EMP
ORDER BY EMPNO DESC;

-- 8. **EMP테이블에서 사번, 입사일, 사원명, 급여 조회  (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)**
SELECT EMPNO,HIREDATE,ENAME,SAL
FROM EMP
ORDER BY DEPTNO ASC, HIREDATE DESC;

-- 9.오늘 날짜에 대한 정보 조회
SELECT SYSDATE
FROM DUAL;

-- ------------------------------------------------------------
-- 함수 DELETE
--오라클에서 함수는 내장 함수 사용자 정의 함수로 나누어
-- 내장 함수는 단일행 함수와 다중행(집계) 함수로 나누어짐
-- DUAL 테이블: 오라클의 SYS계정에서 제공하는 테이블로 함수나 
-- 계산식에서 테이블 참조없이 실행해 보기 위해 제공됨 (DUMMY 테이블)

-- ABS : 절대값을 구하는 함수 
SELECT -10 , ABS(-10) 
FROM DUAL; 

--ROUND : 반올림한 결과를 반환하는 함수 : ROUND(숫자, 반올림 위치 ), 위치는 음수값도 줄수 있음
SELECT ROUND(1234.5678) AS ROUND, 
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND (1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC : 버림한 결과를 반환하는 함수 
SELECT TRUNC(1234.5678) AS TRUNC, 
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC (1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- MOD : 나누기한 나머지만 출력 
SELECT MOD(21, 5) 
FROM DUAL;

-- CEIL : 소수점 이하를 무조건 올림 
SELECT CEIL(12.00001)
FROM DUAL;

--FLOOR : 소수점 이하를 무조건 내림 
SELECT FLOOR(12.00001)
FROM DUAL;

--POER : 정수 A를 정수 B만큼 제곱하는 함수 (3 ,4)
SELECT POWER(3,4)
FROM DUAL;

-- INSTR : 문자의 포함여부 (인덱스로 반환 )
SELECT INSTR( ' HELLO, ORACLE! ' ,'L') as INSTR_1,
    INSTR( ' HELLO, ORACLE! ' ,'L', 5) as INSTR_2,
    INSTR( ' HELLO, ORACLE! ' ,'L', 2 , 2) as INSTR_3 --3번쨰 인자는 시작위치, 4번쨰 인자는 몇번쨰 인지
FROM DUAL;

--특정 문자가 포함된 행찾기
SELECT *
FROM EMP
WHERE INSTR(ENAME,'S') > 0;

SELECT * 
FROM EMP
WHERE ENAME LIKE '%S%'

-- REPLACE : 특정 문자열 데이터에 포함된 문자를 다른문자로 대체 IS
-- 대체할 문자를 넣지 않으면 해당 문자 삭제 IS
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE ('010-1234-5678' , '-',  '  ') AS REPLACE_1,
    REPLACE ('010-1234-5678','-' ) AS REPLACE_2
FROM DUAL; 

-- LPAD / RPAD : 기준 공간의 칸 수를 특정 문자로 채우는 형태 
SELECT LPAD('ORACLE', 10, '+')
FROM DUAL;

SELECT 'ORACLE',
    LPAD('ORACLE',10,'#') AS LPAD_1,
    LPAD('ORACLE',10,'*') AS RPAD_1,
    LPAD('ORACLE',10) AS LPAD_2,
    LPAD('ORACLE',10) AS RPAD_2
FROM DUAL;

-- 개인 정보 뒷자리 * 표시 
SELECT
    RPAD('971225 -', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-',13, '*') AS RPAD_PHONE
FROM DUAL;

-- 두 문자열을 합치는 CONCAT 함수
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT( '   :    ',ENAME))
FROM EMP
WHERE ENAME = 'JAMES';

-- TRIM/ LTRIM / RTRIM : 문자열 내에서 특정 문자열을 지우기 위해 사용 
-- 삭제할 문자를 지정하지 않으면 공백 제거 ( 공백 제거용으로 사용 )
SELECT '[' || TRIM('            _Oracle_         ') || ']' AS TRIM,
 '[' || LTRIM('          _Oracle_ ') || ']' AS LTRIM,
 '[' || LTRIM('<_Oracle_>             ', '<_') || ']' AS LTRIM_2,
 '[' || RTRIM(' _Oracle_         ') || ']' AS RTRIM,
 '[' || RTRIM('<_Oracle_>            ', '_>') || ']' AS RTRIM_2
 FROM DUAL;

 SELECT TRIM('                  호오오올리 쉣                ') AS HOLI
FROM DUAL;

-- 날짜 데이터를 다루는 날짜함수
-- SYSDATE :  운영 체제의 현재 날짜와 시간 정보를 가져옴
SELECT SYSDATE AS 현재시간
FROM DUAL;

SELECT SYSDATE AS 오늘,
    SYSDATE -1 AS 어제,
    SYSDATE +1 AS내일
FROM DUAL;

-- 몇 개월 이후 날짜 구하는 ADD_MONTH 함수
-- 특정 날짜에 지정한 개월 수 이후의 날짜 데이터를 반환하는 함수
-- ADD_MONTH (날짜 , 개월 , 일)  이후를 반환 
SELECT SYSDATE, 
    ADD_MONTHS(SYSDATE, 3) 
FROM DUAL;

-- EMP Table에서 입사 10주년이 되는 사원들 데이터 출력 DELETE
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS 입사10주년 -- 10년 더하기
FROM EMP;

--SYSDATE와 ADD_MONTH 함수를 사용하여 현재 날짜와 6개월 후 날짜 출력
SELECT SYSDATE AS 오늘,
    ADD_MONTHS(SYSDATE ,6) 
FROM DUAL;

--두 날짜 간의 개월 수 차이를 구하는 MONTHS_BETWEEN 함수
SELECT EMPNO, ENAME,HIREDATE,SYSDATE,
    MONTHS_BETWEEN(HIREDATE ,SYSDATE) AS MONTHS1,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3
FROM EMP;

-- 날짜 정보 추출 함수
-- EXTRACT 함수는 날짜 유형의 데이터로 부터 날짜 정보를 분리하여 새로운 정보로 출력
SELECT EXTRACT(YEAR FROM DATE '2023 - 09 - 15') AS 년도추출
FROM DUAL;

SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE) = 12; 

-- 9. **오늘 날짜에 대한 정보 조회**
SELECT SYSDATE
FROM DUAL;

-- 10. **EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
SELECT EMPNO,ENAME,
    ROUND(SAL,-2) AS 급여
FROM EMP;

-- 11. **EMP테이블에서 사원번호가 홀수인 사원들을 조회**
SELECT EMPNO,ENAME
FROM EMP
WHERE MOD (EMPNO,2) !=0 ;

-- 12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**
SELECT ENAME,
EXTRACT(YEAR FROM HIREDATE) AS 입사년도,
EXTRACT(MONTH FROM HIREDATE) AS 입사월
FROM EMP;

-- 13. **EMP테이블에서 9월에 입사한 직원의 정보 조회**
SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM HIREDATE)=9;

-- 14. **EMP테이블에서 81년도에 입사한 직원 조회**
SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE)=1981;

-- 15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**
SELECT *
FROM EMP
WHERE ENAME LIKE '%E';

-- 16. **EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회**
-- - **LIKE 사용**
SELECT *
FROM EMP
WHERE ENAME LIKE '__R%';
-- 1. **EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회**
SELECT EMPNO,ENAME,
ADD_MONTHS(HIREDATE,480) 
FROM EMP;
-- 2. **EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회**
SELECT *
FROM EMP
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))>=456;

-- 3. **오늘 날짜에서 년도만 추출**
SELECT EXTRACT(YEAR FROM SYSDATE)
FROM DUAL;


------------------------------------------------------------------------------------------
-- 자료형을 변환하는 형 변환 함수
-- 자동 형변환 : NUMBER + 문자타입 = > NUMBER 타입으로 자동 변환
SELECT EMPNO, ENAME, EMPNO + '500' 
FROM EMP
WHERE ENAME = 'FORD';

SELECT EMPNO, ENAME, EMPNO + 'ABCD'
FROM EMP
WHERE ENAME = 'FORD';

-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수
-- 주로 날짜 데이터를 문자 데이터로 변환하는데 사용
-- 자바의 SimpleDateFormat() 유사 

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:MM') AS "현재"
FROM DUAL;

SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'CC') AS 세기,
    TO_CHAR(SYSDATE, 'YY') AS 연도,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD PM HH:MI:SS ') AS "년/월/일 시:분:초",
    TO_CHAR(SYSDATE, 'Q') AS 쿼터,
    TO_CHAR(SYSDATE, 'DD') AS 일,
    TO_CHAR(SYSDATE, 'DDD') AS 경과일,
    TO_CHAR(SYSDATE, 'HH') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH12') AS "12시간제",
    TO_CHAR(SYSDATE, 'HH24') AS "24시간제",
    TO_CHAR(SYSDATE, 'W') AS 몇주차
FROM DUAL;

SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'MM') AS MM,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MON_KOR,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN,
     TO_CHAR(SYSDATE, 'MON', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MON_ENG,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = KOREAN' ) AS MONTH_KOR,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MONTH_JPN,
     TO_CHAR(SYSDATE, 'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH' ) AS MONTH_ENG
FROM DUAL;


SELECT SYSDATE,
     TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
     TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
     TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
FROM DUAL;

SELECT SAL,
    TO_CHAR(SAL,'$999,9999') AS sal_$,
    TO_CHAR(SAL,'L999,9999') AS sal_L,
    TO_CHAR(SAL,'999,9999.00') AS sal_1,
    TO_CHAR(SAL,'000,9999999.00') AS sal_2,
    TO_CHAR(SAL,'0009999999.99') AS sal_3,
    TO_CHAR(SAL,'999,999.00') AS sal_4
FROM EMP;

--TO_NUMBER() : NUMBER타입으로 형변환 
SELECT TO_NUMBER( '1300') - '1200'
FROM DUAL;

-- TO_DATE() : 문자열로 명시된 날짜를 날짜 타입으로 형변환
SELECT TO_DATE('22/08/20', 'YY/MM/DD') 
FROM dual;

-- 1981년 6월 1일 이후에 입사한 사원 정보 출력하기
SELECT *
FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01', 'YY/MM/DD');

-- NULL 처리 함수 : NULL은 값이 없음 , 즉 할당되지 않음을 의미 
-- NULL은 0이나 공백과는 다른 의미, 연산불가
-- NVL(NULLD 인지를 검사할 열, 앞의 열  데이터가 NULL인 경우 반환할 데이터 )
SELECT EMPNO, ENAME, SAL, COMM,SAL+COMM,
    NVL(COMM, 0), SAL + NVL(COMM,0)
FROM EMP;

--NVL2 () : NULL이 아닌경우와 NULL인 경우 모두에 대해서 값을 출력할수있음
SELECT EMPNO, ENAME, COMM ,
    NVL2(COMM,'0','X'),
    NVL2(COMM,SAL*12+COMM,SAL*12) AS 연봉 
FROM EMP;

--NULLIF() : 두 값이 동일하면 NULL 반환 , 아니면 첫 번쨰 값 반환
SELECT NULLIF(10,10), NULLIF('A','B')
FROM DUAL;

-- DECODE : 주어진 데이터 값이 조건 값과  일치하는 값 출력
-- 일치하는 값이 없으면 기본값 출력
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE ( JOB,
        'MANAGER',SAL*1.1,
        'SALESMAN',SAL*1.05,
        'ANALYST', SAL,
                SAL*1.03) AS D연봉인상 
FROM EMP;

-- CASE 문 
SELECT EMPNO, ENAME, JOB ,SAL,
    CASE JOB
        WHEN 'MAGER' THEN SAL * 1.1
        WHEN 'SALESMAN' THEN SAL*1.05
        WHEN'ANALYST' THEN SAL
        ELSE SAL* 1.03
    END AS 연봉인상
FROM EMP;

-- 열 값에 따라서 출력 값이 달라지는 CASE DELETE 
SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '해당 사항 없음 '
        WHEN COMM = 0 THEN '수당없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS "성과급기준"
FROM EMP;

-------------------------------------------------------------------
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')AS MASKING_ENAME
FROM EMP;

--
SELECT EMPNO, ENAME,SAL,
    TRUNC(SAL/21.5,2) AS일급,
    ROUND(SAL/21.5/8,1) AS 시급
FROM EMP;

-- 3번
-- NEXT_DAY(기준일자, 찾을 요일) : 기준일자 다음에 오는 날짜를 구하는함수 
SELECT EMPNO, ENAME, HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS ( HIREDATE ,3 ), 'MON'), 'YYYY/MM/DD') AS "정직원 진급",
    NVL(TO_CHAR(COMM), 'N/A') AS COMM 
FROM EMP;


-- 4번
SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR,1,2)='78' THEN '8888'
        WHEN SUBSTR(MGR,1,2)='77' THEN '7777'
        WHEN SUBSTR(MGR,1,2)='76' THEN '6666'
        WHEN SUBSTR(MGR,1,2)='75' THEN '5555'
        ELSE TO_CHAR(MGR /*NCHAR NCHAR*/)
    END AS CHG_MGR
FROM EMP;

-- 다중행 함수 : 어러 행에 대해 함수가 정용되어 하나의 결과를 나타내는 함수( 집계 함수)
-- 여러 행이 입력되어 결과가 하나의 행으로 출력
SELECT SUM(SAL)
FROM EMP;

SELECT JOB,SUM(SAL)
FROM EMP
GROUP BY JOB;

SELECT DEPTNO, SUM(SAL),COUNT(*),ROUND(AVG(SAL),2),MAX(SAL),MIN(SAL)
FROM EMP
GROUP BY DEPTNO;
-- GROUP BY : 그룹으로 묶을떄 

-------------------------------------------------------
--------------연습장 ---------------------------------
--1
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKIN_EMPNO,
    ENAME,
    RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME ),'*') AS MASKIN_EMPNO
FROM EMP;
--2 
SELECT EMPNO, ENAME,SAL,
    TRUNC(SAL /21.5,2) AS DAY_PAY,
    ROUND((SAL/21.5)/8,1) AS TIME_PAY
FROM EMP;
--3
SELECT EMPNO,ENAME,HIREDATE,
    TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'MON'),'YYYY/MM/DD') AS "R_JOB",
    NVL(TO_CHAR(COMM), 'N/A') AS "COMM"
FROM EMP;

--4
SELECT EMPNO,ENAME,MGR,
    CASE
        WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
        WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
        WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
        WHEN SUBSTR(MGR,1,2) = '75' THEN '5555'
        WHEN MGR IS NULL THEN '0000'
        ELSE TO_CHAR(MGR /*NCHAR NCHAR*/)
    END AS CHG_MGR
FROM EMP;


-----------------------------------------------------
--GROUP BY : 여러 데이터에서 의미 있는  하나의 결과를 특정 열값별로 묶어서 출력할떄 사용
SELECT ROUND(AVG(SAL),2) AS  "사원전체 평균"
FROM EMP;


-- 부서별 사원 평균
SELECT DEPTNO,ROUND(AVG(SAL),2) AS  "부서별평균"
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 집합 연산자를 사용하여 
SELECT AVG(SAL) FROM EMP WHERE DEPTNO =10
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO =20
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO =30;

-- 부서코드, 급여 합계 , 부서 평균 , 부서 코드 순 정렬 
SELECT DEPTNO AS 부서코드,
    SUM(SAL) AS 합계,
    ROUND(AVG(SAL),2) AS 평균,
    COUNT(*)                     /*부서별 인원수*/
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- HAVING 절 : GROUP BY 절이 존재하는 경우에만 사용
-- GROUP BY 절을 통해 그룹화된 결과 값을 범위를 제한할 떄 사용
-- 먼저 부서별, 직책별로 그룹화하여 평균을 구함
-- 그다음 각 그룹별 급여 평균이 2000이 넘는 그룹을 출력 함 

SELECT DEPTNO, JOB, ROUND (AVG(SAL), 2)
FROM EMP
GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- WHERE 절을 사용하는 경우
-- 먼저 급여가 2000 이상인 사원들을 골라냄
-- 조건에 맞는 사원 중에서 부서별, 직책별 급여의 평균을 구해서 출력 

SELECT DEPTNO, JOB, ROUND (AVG(SAL), 2)
FROM EMP
WHERE SAL >=2000
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--1.
SELECT DEPTNO,JOB,
ROUND(AVG(SAL),2)
FROM EMP
GROUP BY DEPTNO,JOB
    HAVING AVG(SAL) >=500
ORDER BY DEPTNO,JOB;

--2.
SELECT DEPTNO,TRUNC(AVG(SAL)),MAX(SAL),MIN(SAL),
    COUNT(*) AS 사원수
FROM EMP
GROUP BY DEPTNO;
ORDER BY DEPTNO;

--3.
SELECT JOB,COUNT(*)
FROM EMP
GROUP BY JOB
    HAVING COUNT(*) >=3
ORDER BY JOB;

--4
SELECT DEPTNO,EXTRACT(YEAR FROM HIREDATE),
    COUNT(*)
FROM EMP
GROUP BY DEPTNO,EXTRACT(YEAR FROM HIREDATE)
ORDER BY DEPTNO,EXTRACT(YEAR FROM HIREDATE);

--5
SELECT  NVL2(COMM,'0','X'),COUNT(*)
FROM EMP
GROUP BY  NVL2(COMM,'0','X')
ORDER BY  NVL2(COMM,'0','X');

--6
SELECT EXTRACT(YEAR FROM HIREDATE),
    COUNT(*), MAX(SAL),SUM(SAL),TRUNC(AVG(SAL))
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY EXTRACT(YEAR FROM HIREDATE);


-- 그룹화와 관련된 여러 함수 : ROLLUP, CUBE ....
SELECT EXTRACT(YEAR FROM HIREDATE),
    COUNT(*), MAX(SAL),SUM(SAL),TRUNC(AVG(SAL))
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE)
ORDER BY EXTRACT(YEAR FROM HIREDATE);

-- ROLLUP : 명시한 열을 소그룹 부터 대그룹의 순서로 각 그룹별로 결과를 
-- 출력하고 마지막에 총 데이터 결과를 출력

SELECT EXTRACT(YEAR FROM HIREDATE),
    COUNT(*), MAX(SAL),SUM(SAL),TRUNC(AVG(SAL))
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIREDATE);

-- 조인 : 두 개 이상의 테이블에서 데이터를 가져와서 연결하는데 사용하는 SQL기능 
-- RDMS에서는 테이블 설계시 무결성 원칙으로 인해 동일한 정보가 여러군대 존재하면 안되기 떄문에 
-- 필연적으로 테이블을 관리 목적에 맞게 설계 함 .
SELECT *
FROM DEPT;

-- 열 이름을 비교하는 조건식으로 조인하기 
SELECT * 
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO  -- 조인의 기준 : 테이블.주소번호
ORDER BY EMPNO;

-- 테이블 별칭 사용하기
SELECT * 
FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO 
ORDER BY EMPNO;
-------------------------------------------------------------------------------------------------------------------------
-- 조인 종류 : 두 개 이상의 테이블을 하나의 테이블처럼 가로로 늘려서 출력하기 위해 사용
-- 조인은 대상 데이터를 어떻게 연결하는냐에 따라 등가, 비등가 자체, 외부 조인으로 구분
-- 등가 조인 : 테이블을 연결한 후 출력 행을 각 테이블의 특정 열에 일치한 데이터를 기준으로 선정하는 방법
-- 등가 조인에서는 안시(ANSI) 조인과 오라클 조인이 있음 
SELECT EMPNO,ENAME, D.DEPTNO, DNAME, LOC
    FROM EMP E, DEPT D 
    WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = 10
    ORDER BY D.DEPTNO ;


-- 테이블 JOIN 테이블  ON 주소번호 
SELECT EMPNO,ENAME, D.DEPTNO, DNAME, LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE E.EMPNO = 10
    ORDER BY D.DEPTNO;


SELECT EMPNO,ENAME, D.DEPTNO, SAL, DNAME, LOC
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL <= 3000
    ORDER BY D.DEPTNO;

--1
SELECT SAL, EMPNO, D.DEPTNO
    FROM EMP E JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO  -- 동등 조인, 이너 조인, 이퀄조인 
    WHERE SAL <=2500 
    AND EMPNO <=9999
    ORDER BY D.DEPTNO;


-- ANSI 조인
SELECT EMPNO,ENAME, D.DEPTNO, DNAME, LOC
    FROM EMP E JOIN DEPT D 
    ON E.DEPTNO = D.DEPTNO
    WHERE SAL<=2500
    AND EMPNO <=9999
    ORDER BY EMPNO;

-- 비등가 조인 : 동일 , 컬럼(열 , 레코드) 없이 다른 조건을 사용하여 조인 할 떄 사용 ( 일반적인경우 아님 )
SELECT *
FROM EMP;

SELECT *
FROM SALGRADE;

SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E , SALGRADE S --  두개의 테이블 연결 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL; -- 비등가 조인 

-- ANSI 조인으로 변경
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--자체 조인 : 셀프 조인이라고 함 , 같은 테이블을 두번 사용하여 자체 조인 
-- EMP 테이블에서 직속상관의 사원번호는 MGR에 있음
-- MGR 을 이요해서 상관의 이름을 알아내기 위해서 사용할수 있음
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
    E2.EMPNO AS MGR_EMPNO,
    E2.ENAME AS MGR_ENAME
FROM EMP E1,EMP E2
WHERE E1.MGR = E2.EMPNO;

--외부 조인 : 동등 조인의 경우 한쪽의 컬럼이 없으면 해당 행으로 표시 되지 않음
-- 외부 조인은 내부 조인과 다르게 다른 한쪽에 값이 없어도 출력됨 
-- 외부 조인은 동등 조인 조건을 만족하지 못해 누락되는 행을 출력하기 위해서 사용

INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES (9000, '유나', 'SALESMAN',7698,SYSDATE,2000,1000,NULL);

-- 왼쪽 외부 조인 사용하기
SELECT ENAME, E.DEPTNO,DNAME
FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO(+)
ORDER BY E.DEPTNO;

SELECT * FROM DEPT;

-- 오른쪽 외부 조인 사용하기
SELECT E.ENAME, E.DEPTNO,D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+)=D.DEPTNO
ORDER BY D.DEPTNO;
------------------------------------------------------------------------------------------------------
-- SQL -99 표준문법으로 배우는 ANSI 조인
-- NATURAL JOIN : 등가조인 대신 사용, 자동으로 같은 열을 찾아서 조인 해줌 
SELECT EMPNO, ENAME, DNAME
FROM EMP NATURAL JOIN DEPT;

-- JOIN ~ USING  : 등가 조인 대신 사용 , USING 키워드에 조인 기준 열을 명시하여 사용 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE,DEPTNO
FROM EMP E JOIN DEPT D
USING (DEPTNO); -- 여기에 조인할 주소 입력 

--JOIN ~ON : ANSI 등가 조인 
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE,E.DEPTNO
FROM EMP E JOIN DEPT D
ON E.DEPTNO=D.DEPTNO;

-- ANSI LEFT OUTER JOIN 
SELECT ENAME, E.DEPTNO,DNAME
FROM EMP E LEFT OUTER JOIN DEPT D 
ON E.DEPTNO=D.DEPTNO
ORDER BY E.DEPTNO;

--ANSI RIGHT OUTER JOIN
SELECT ENAME, E.DEPTNO,DNAME
FROM EMP E RIGHT OUTER JOIN DEPT D 
ON E.DEPTNO=D.DEPTNO
ORDER BY E.DEPTNO;

--1
SELECT D.DEPTNO,DNAME,EMPNO,ENAME,SAL
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE SAL <=2000
ORDER BY D.DEPTNO;

--2 
SELECT D.DEPTNO,
    TRUNC(AVG(SAL)),TRUNC(MAX(SAL)),TRUNC(MIN(SAL)),
    COUNT(*)
FROM DEPT D JOIN EMP E
ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO
ORDER BY D.DEPTNO;

--3
SELECT E.DEPTNO,DNAME,EMPNO,ENAME,JOB,SAL
FROM EMP E RIGHT OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
ORDER BY E.DEPTNO,E.ENAME;

-------------------------------------------------------------------------
-- 서브 쿼리 : 어떤 상황이나 조건에 따라 변할 수 있는 데이터 값을 비교하기 위해
-- SQL문 안에 작성하는 작은 SELECT 문을 의미 합니다 .
-- 킹 이라는 이름을 가진 사원의 부서 이름을 찾기위한 쿼리문 
SELECT DNAME FROM DEPT 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP
                                WHERE ENAME ='KING');

--사원 JONES 의 급여보다 높은 급여를 받는 사원 정보 출력 하기
SELECT EMPNO,ENAME,SAL 
FROM EMP
WHERE SAL>(SELECT SAL FROM EMP
                        WHERE ENAME='JONES');

-- EMP 테이블의 사원 정보 중에서 사원이름이 'ALLEN'인 사원의 추가 수당 보다 많은 추가 수당을 받는 사원출력
SELECT *
FROM EMP
WHERE  COMM > (SELECT COMM FROM EMP WHERE ENAME='ALLEN');


SELECT *
FROM EMP
WHERE HIREDATE<(SELECT HIREDATE FROM EMP WHERE ENAME ='JAMES');

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO,DNAME,LOC
FROM EMP E JOIN DEPT D
USING(DEPTNO)
WHERE DEPTNO = 20
AND SAL>(SELECT AVG(SAL) FROM EMP );

-- 다중행 서브쿼리 : 서브쿼리의 실행 결과가 여러개로 나오는 서브쿼리
-- IN : 메인 쿼리의 데이터가 서브쿼리의 겨과중 하나라도 일치하면 TRUE
-- 각부서별 최대 금여와 동일한 금여를 받는 사원 정보를 출력 
SELECT * 
FROM EMP
WHERE SAL IN(SELECT MAX (SAL)FROM EMP GROUP BY DEPTNO);   --같은조건 반환 

-- ANY : 메인 쿼리의 비교조건이 서브 퀄리의 여러 검색결과중 하나라도 만족하면 반환 

SELECT * 
FROM EMP
WHERE SAL = ANY(SELECT MAX (SAL) -- 한가지 조건 성립 하면 반환 
                                FROM EMP 
                                GROUP BY DEPTNO);

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > ANY (SELECT SAL      
                                FROM EMP 
                                WHERE JOB = 'SALESMAN');

-- ALL :  모든조건을 만족하는 경우에 성립 
SELECT *
FROM EMP
WHERE SAL  < ALL(SELECT SAL  -- 모든 조건을 만족하면 반환
                                FROM EMP 
                                WHERE DEPTNO = 30); 

SELECT EMPNO, ENAME, SAL 
FROM EMP
WHERE SAL > ALL (SELECT SAL 
                                FROM EMP 
                                WHERE JOB = 'MANAGER');

--EXISTS 연산자 :  서브쿼리의 결과 값이 하나 이상 존재하면 조건식이 모두 TRUE,  존재하지않으면 모두 FALSE
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME 
                        FROM DEPT  
                        WHERE DEPTNO = 50);

-- 다중 열 서브 쿼리 : 서브 쿼리의 결과가 두개이상의 컬럼으로 반환되어 메인 쿼리에 전달하는 쿼리
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO,SAL  
                                            FROM EMP 
                                            WHERE DEPTNO = 30 AND SAL > 1500);


-- GROUP BY 절이 포함된 다중열 서브 쿼리
SELECT *
FROM EMP
WHERE (DEPTNO, SAL)IN(SELECT DEPTNO,MAX(SAL) 
                                        FROM EMP
                                        GROUP BY DEPTNO);

-- FROM 절에 사용하는 서브 쿼리문 : 인라인뷰 
-- FROM 절에 직접 테이블을 명시하여 사용하기에는 테이블 내 데이터 규모가 너무 큰 경우 사용
-- 보안이나 특정 목적으로 정보를 제공하는 경우

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME,D.LOC
FROM(SELECT *FROM EMP WHERE DEPTNO = 10) E10 JOIN(SELECT * FROM DEPT) D
ON E10.DEPTNO =D.DEPTNO;

-- 먼저 정렬하고 해당 갯수만 가져오기 
--ROWNUM : 오라클에서 제공하는 문법으로 행 번호를 자동으로 매겨줌 DELETE
-- 정렬된 결과에서 상위 3개를 뽑을려면 테이블을 가져올 떄 정렬된 상태로 가져와야 DELETE
 -- 일반적인 SELECT문에서는 ORDER BY절이 맨 나중에 수행되기 떄문
SELECT ROWNUM, ENAME, SAL
FROM (SELECT * FROM EMP 
            ORDER BY SAL DESC)
WHERE ROWNUM <=3;

-- SELECT절에 사용하는 서브 쿼리 : 스칼라 서브쿼리라고도 부름 ( 반드시 하나의 결과만 나와야함 )
-- 단일행으로 와야 함 DELETE
SELECT EMPNO, ENAME, JOB, SAL, (SELECT GRADE 
                                                        FROM SALGRADE
                                                        WHERE E.SAL BETWEEN LOSAL AND HISAL) AS 급여등급,
                                                        DEPTNO,
                                                        (SELECT DNAME
                                                        FROM DEPT
                                                        WHERE E.DEPTNO = DEPT.DEPTNO)AS DNAME   
FROM EMP E;

-- 매 행마다 부서번호가 각 행의 부서번화와 동일한 사원들의 SAL 평균을 구해서 반환
SELECT ENAME, DEPTNO, SAL,
            (SELECT TRUNC(AVG(SAL))
            FROM EMP
            WHERE DEPTNO =E.DEPTNO) AS 부서별평균급여
FROM EMP E ;

-- 부서 위치가 NEW YORK 인 경우에 본사로, 그외부서는 분점으로 반환
SELECT EMPNO, ENAME,
    CASE WHEN DEPTNO =(SELECT DEPTNO FROM DEPT WHERE LOC ='NEW YORK')
    THEN '본사'
    ELSE '분점'
    END AS 소속
FROM EMP
ORDER BY 소속;

--1전체 사원 중 ALLEN과 같은 직책(JOB)인 사원들의 사원 정보, 
--부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
SELECT JOB,EMPNO,ENAME,SAL,(SELECT DEPTNO FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO)AS DEPTNO, 
(SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO)AS DNAME   
FROM EMP E
WHERE JOB = 'SALESMAN';


--2.전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 급여 등급 정보를 
--출력하는 SQL문을 작성하세요(단 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원 번호를 기준으로 오름차순으로 정렬하세요).
SELECT EMPNO,ENAME,DNAME,HIREDATE,LOC,SAL,(SELECT GRADE
                                                                                    FROM SALGRADE
                                                                                    WHERE E.SAL BETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP E JOIN DEPT D
ON D.DEPTNO = E.DEPTNO
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL DESC, E.EMPNO;

--3.10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원 정보, 
--부서 정보를 다음과 같이 출력하는 SQL문을 작성하세요.
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D
ON E.DEPTNO =D.DEPTNO
WHERE E.DEPTNO = 10 
AND E.JOB NOT IN (SELECT DISTINCT JOB FROM EMP 
                     WHERE DEPTNO = 30 );


--4. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보, 급여 등급 정보를 다음과 같이 출력하는
-- SQL문을 작성하세요(단 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원 번호를 기준으로 오름차순으로 정렬하세요).
SELECT EMPNO,ENAME,SAL,(SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL)AS GRADE
FROM EMP E
WHERE SAL >(SELECT MAX(SAL) FROM EMP WHERE JOB='SALESMAN')
ORDER BY EMPNO;

---------------------------------------------------------------------------------
-- DML(Data Manupulation language) :  데이터를 조회(SELECT), 삭제 (DELETE), 입력 (INSERT), 변경(UPDATE)
-- 테이블이 아니고 데이터를 조작하는 것 

-- DML을 하기위해서 임시 테이블 생성 
CREATE TABLE DEPT_TEMP -- 테이블 생성 
AS SELECT * FROM DEPT;  -- 기존의 DEPT 테이블을 복사해서 DEPT_TEMP 테이블 생성 

SELECT * FROM DEPT_TEMP; --테이블 조회

DROP TABLE DEPT_TEMP; --테이블 삭제 

-- 테이블에 데이터를 추가하기 
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES (50,'DATABASE','서울');
INSERT INTO DEPT_TEMP(DEPTNO,LOC,DNAME) VALUES (60, '부산','Devlopment');
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES (70,NULL,'인천');

-- 2번쨰 추가하는 방법
INSERT INTO DEPT_TEMP VALUES(80, '프론트' ,NULL);

--  테이블 만복사 (데이터 복사안함)
CREATE TABLE EMP_TEMP
AS SELECT * FROM EMP
WHERE 1 != 1; -- 테이블의 데이터가 맞는게 없음 테이블만 복사됨 GRADE

SELECT * FROM EMP_TEMP;
-- 테이블에 날짜 데이터 입력
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL, COMM,DEPTNO)
        VALUES(9003,'유나','SINGER',9000, TO_DATE('2023/09/23','YYYY/MM/DD'), 2000,1000,10);

-- 서브 쿼리를 이용한 INSERT DELETE
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL, COMM,DEPTNO)
    SELECT E.EMPNO,E.ENAME,E.JOB,E.MGR,E.HIREDATE,E.SAL,E.COMM,E.DEPTNO
    FROM EMP E JOIN SALGRADE S 
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    WHERE S.GRADE = 1; 

-- UPDATE : 행의 정보를 변경할때 사용
-- UPDATE '테이블이름' SET '변경할 열의 이름과 데이터' WHERE '조건식'
SELECT * FROM DEPT_TEMP2;

CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT_TEMP;


UPDATE DEPT_TEMP2 
    SET DNAME ='백앤드',
           LOC = '광주'
    WHERE DEPTNO = 30;

-- 테이블에 있는 데이터 삭제하기
CREATE TABLE EMP_TEMP2 
AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

--조건절없이 사용하면 모든 데이터 지워짐 
DELETE FROM EMP_TEMP2
WHERE JOB = 'SALESMAN';

CREATE TABLE DEPT_TCL 
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TCL;

INSER INTO DEPT_TCL VALUES(50,'DATABASE','SEOUL')

COMMIT;


---------------------------------------------------------------------------------
CREATE TABLE EMP_DDL(
    EMPNO   NUMBER(4),
    ENAME    VARCHAR2(10),
    JOB          VARCHAR2(9),
    MGR         NUMBER(4),
    HIREDATE  DATE,
    SAL           NUMBER(7, 2),
    COMM     NUMBER(7, 2),
    DEPTNO   NUMBER(2)   
);

INSERT INTO EMP_DDL VALUES(9000, '안유진', 'IVE', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9001, '장원영', 'IVE', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9002, '가을', 'IVE', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9003, '리즈', 'IVE', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9004, '레이', 'IVE', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9005, '이서', 'IVE', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9006, '민지', '뉴진스', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9007, '하니', '뉴진스', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9008, '해린', '뉴진스', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9009, '혜인', '뉴진스', 9000, SYSDATE, 10000, 2000, 10);
INSERT INTO EMP_DDL VALUES(9010, '다니엘', '뉴진스', 9000, SYSDATE, 10000, 2000, 10);

INSERT INTO EMP_DDL VALUES(9011, '유나', '있지', 9000, SYSDATE, 10000, 2000, 10, '+8210-3602-8509');

COMMIT;

DELETE FROM EMP_DDL;

SELECT * FROM EMP_DDL;
-- 테이블 변경하는 ALTER
-- ADD : 테이블에 열을 추가
-- RENAME : 열의 이름을 변경
-- MODIFY : 열의 데이터형을 변경
-- DROP : 열을 제거

-- 테이블에 열을 추가 : ADD
ALTER TABLE EMP_DDL
        ADD HP VARCHAR2(20);

-- 테이블의 열 이름 변경 : RENAME
ALTER TABLE EMP_DDL
        RENAME COLUMN HP TO TEL;

-- 테이블 열의 자료형 변경 : MODIFY
ALTER TABLE EMP_DDL
        MODIFY TEL VARCHAR2(16);

ALTER TABLE EMP_DDL
        MODIFY DEPTNO NUMBER(4);

ALTER TABLE EMP_DDL -- 열의 데이터가 있어도 삭제 함
        DROP COLUMN TEL;

-- 테이블 이름을 변경하는 RENAME
RENAME EMP_DDL TO EMP_RENAME;
SELECT * FROM EMP_RENAME;

-- 테이블의 데이틀 삭제하는 TRUNCATE
TRUNCATE TABLE EMP_RENAME; -- DDL 명령어, ROLLBACK 불가

DELETE FROM EMP_RENAME; -- DML

-- 테이블을 삭제하는 DROP
DROP TABLE EMP_RENAME;

-- 빈값을 허용하지 않는 NOT NULL
CREATE TABLE TABLE_NOTNULL (
        LOGIN_ID VARCHAR2(20) NOT NULL,
        LOGIN_PWD VARCHAR(20) NOT NULL,
        TEL VARCHAR2(20)
);

INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD, TEL) VALUES('HB8509', '1234', NULL);
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD, TEL) VALUES('HB8509', '1234', '010-3602-8509');
INSERT INTO TABLE_NOTNULL(LOGIN_ID, LOGIN_PWD, TEL) VALUES('HB8509', NULL, '010-3602-8509');

SELECT * FROM TABLE_NOTNULL;

DROP TABLE TABLE_NOTNULL;

-- 중복되지 않는 값 : UNIQUE, NULL은 허용, 테이블 내에 여러 열에 존재 가능
CREATE TABLE TABLE_UNIQUE (
        LOGIN_ID VARCHAR2(20) UNIQUE,
        LOGIN_PWD VARCHAR(20) NOT NULL,
        TEL VARCHAR2(20)
);

INSERT INTO TABLE_UNIQUE(LOGIN_ID, LOGIN_PWD, TEL) VALUES('HB8509', '1234', NULL);

SELECT * FROM TABLE_UNIQUE;
-- 다른 테이블과 관계를 맺는 FOREIGN KEY
-- 왜래키는 서로 다른 테이블관 관계를 정외하는데 사용하는 제약조건
-- 참조하고 있는 기본키의 데이터타입과 일치해야 하며 외래키에 참조되는 기본키는 삭제할 수 있습니다.
CREATE TABLE DEPT_FK (
        DEPTNO NUMBER(2) PRIMARY KEY,
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13)
);

CREATE TABLE EMP_FK (
        EMPNO NUMBER(4) PRIMARY KEY,
        ENAME VARCHAR2(10) NOT NULL,
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2) REFERENCES DEPT_FK(DEPTNO)
);

INSERT INTO DEPT_FK VALUES(10, '농구부', '서울');
INSERT INTO EMP_FK VALUES(9000, '강백호', '농구', 8000, 2300, 1200, 10);

SELECT * FROM
EMP_FK E JOIN DEPT_FK D
ON E.DEPTNO = D.DEPTNO;

-- 데이터 형태와 범위를 정하는 CHECK
-- EX) ID 및 PASSWORD 길이 제한
-- EX) 유효 값 범위 확인 (나이 / 성적 / 전화번호 / 이메일)
CREATE TABLE TABLE_CHECK (
        LOGIN_ID VARCHAR2(20) PRIMARY KEY,
        LOGIN_PWD VARCHAR2(20) CHECK(LENGTH(LOGIN_PWD) >= 5),
        TEL VARCHAR(20)
);

INSERT INTO TABLE_CHECK VALUES('HB8509', 'KHB8509', '010-3602-8509');

SELECT * FROM TABLE_CHECK;

-- DEFAULT 제약 조건 : 특정 열에 저장할 값이 지정되지 않은 경우 기본값을 지정

CREATE TABLE TABLE_DAFAULT (
        LOGIN_ID VARCHAR2(20) PRIMARY KEY,
        LOGIN_PWD VARCHAR(20) CHECK(LENGTH(LOGIN_PWD) >= 5),
        TEL VARCHAR2(15) DEFAULT '010-0000-0000'
);

INSERT INTO TABLE_DAFAULT(LOGIN_ID, LOGIN_PWD) VALUES('1HB8509', '1KHB8509');
SELECT * FROM TABLE_DAFAULT;

-- 시퀀스란? 오라클에서 특정 규칙에 맞는 연속적인 숫자를 생성하는 객체

DROP TABLE DEPT_SEQ;

CREATE TABLE DEPT_SEQ(
    DEPTNO NUMBER(2) PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC        VARCHAR2(13)
);

CREATE SEQUENCE SEQ_DEPT_SEQUENCE
INCREMENT BY 10 -- 증가값
START WITH 10 -- 시작값 
MAXVALUE 90 -- 최대값
MINVALUE 0 -- 최소값
NOCYCLE 
CACHE 2;

INSERT INTO DEPT_SEQ VALUES (SEQ_DEPT_SEQUENCE.NEXTVAL,'DATABASE','SEOUL');
SELECT * FROM DEPT_SEQ;

SELECT * 
FROM EMP
WHERE EXTRACT(YEAR FROM SYSDATE)  = EXTRACT(YEAR FROM HIREDATE)
ORDER BY HIREDATE;