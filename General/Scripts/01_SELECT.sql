/* SELECT
 * - 지정된 테이블에서 원하는 데이터가 존재하는
 * 행, 열을 선택해서 조회하는 SQL (구조적 질의 언어)
 *
 *- 선택된 데이터 == 조회 결과 묶음 == RESULT SET
 *
 * - 조회 결과는 0행 이상
 * (조건에 맞는 행이 없을 수 있다)
 */

/* [SELECT 작성법 -1]
 * 
 * 2) SELECT * || 컬럼명, ...
 * 1) FROM 테이블명;
 * 
 * - 지정된 테이블의 모든 행에서 특정 열(컬럼)만 조회하기
 */

-- EMPLOYEE 테이블에서
-- 모든 행의 이름 (EMP_NAME), 급여(SALARY) 컬럼 조회
SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

-- EMPLOYEE 테이블에서
-- 모든 행(== 모든 사원)의 사번, 이름, 급여, 입사일 조회
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE;

-- EMPLOYEE 테이블의
-- 모든 행, 모든 열 (컬럼) 조회
--> *(asterisk) : "모든", "포함"을 나타내는 기호
SELECT *
FROM EMPLOYEE;

-- DEPARTMENT 테이블에서 
-- 부서코드, 부서명 조회
SELECT DEPT_ID, DEPT_TITLE 
FROM DEPARTMENT;

-- EMPLOYEE 테이블에서
-- 




