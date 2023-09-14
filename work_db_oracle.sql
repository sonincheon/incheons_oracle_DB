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














