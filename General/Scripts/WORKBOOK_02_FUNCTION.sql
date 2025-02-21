/*1번 O
 * 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를
 * 입학 년도가 빠른 순으로 표시하는 SQL을 작성하시오.
 * (단, 헤더는 "학번", "이름", "입학년도" 가 표시되도록 한다.*/
SELECT
	STUDENT_NO 학번,
	STUDENT_NAME 이름,
	TO_CHAR(ENTRANCE_DATE, 'YYYY-MM-DD') AS 입학년도
FROM
	TB_STUDENT
WHERE 
	DEPARTMENT_NO = 002
ORDER BY
	입학년도 ASC;

/* 2번 O
 * 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 두 명 있다고 한다. 
 * 그 교수의 이름과 주민번호를 조회하는 SQL을 작성하시오.*/
SELECT 
	PROFESSOR_NAME,
	PROFESSOR_SSN 
FROM
	TB_PROFESSOR
WHERE 
	LENGTH(PROFESSOR_NAME) != 3;

/* 3번 -----------나이 구하는 거 모르겠음!!!
 * 춘 기술대학교의 남자 교수들의 이름과 나이를 나이 오름차순으로 조회하시오.
 * (단, 교수 중 2000년 이후 출생자는 없으며 출력 헤더는 "교수이름"으로 한다.
 * 나이는 '만'으로 계산한다.)*/
SELECT 
	PROFESSOR_NAME 교수이름
FROM 
	TB_PROFESSOR
WHERE 
	SUBSTR(PROFESSOR_SSN ,8,1) = '1'
ORDER BY 
	나이 ASC;

/* 4번 O
 * 교수들의 이름 중 성을 제외한 이름만 조회하시오.
 * 출력 헤더는 "이름"이 찍히도록 한다.
 * (성이 2자인 경우의 교수는 없다고 가정) */
SELECT 
	SUBSTR(PROFESSOR_NAME, 0, 2) AS 이름
FROM
	TB_PROFESSOR;

/* 5번
 * 춘 기술대학교의 재수생 입학자를 조회하시오
 * (19살에 입학하면 재수를 하지 않은 것!) */

/* 6번 -- A로 시작하는 것 까지는 했는데 시작하지 않는 거는 모르겠음
 * 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작하게 되어있다.
 * 2000년도 이전 학번을 받은 학생들의 학번과 이름 조회하는 SQL을 작성하시오. */
SELECT 
	STUDENT_NO,
	STUDENT_NAME 
FROM
	TB_STUDENT 
WHERE 
	STUDENT_NO LIKE 'A%';

/* 7번 O
 * 학번이 A517178인 한아름 학생의 학점 총 평점을 구하는 SQL문을 작성하시오.
 * 단, 이때 출력 화면의 헤더는 "평점"이라고 찍히게 하고, 
 * 점수는 반올림하여 소수점 이하 한자리까지만 표시한다.*/
SELECT 
	ROUND(AVG(POINT),1) AS 평점
FROM 
	TB_GRADE 
WHERE 
 STUDENT_NO = 'A517178';

/* 8번
 * 학과별 학생 수를 구하여 "학과번호", "학생수(명)"의 형태로 조회하시오.*/
SELECT 
	DEPARTMENT_NO 학과번호,
	COUNT(*) 학생수(명)
FROM 
	TB_DEPARTMENT;

/* 9번
 * 지도 교수를 배정받지 못한 학생의 수를 조회하시오.*/

/* 10번
 * 학번이 A112113인 김고운 학생의 년도 별 평점을 구하는 SQL문을 작성하시오.
 * 단, 이때 출력화면의 헤더는 "년도", "년도 별 평점"이라고 찍히게 하고,
 * 점수는 반올림하여 소수점 이하 한자리까지만 표시한다. */














