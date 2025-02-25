/* 1번 O
 * 학생이름과 주소지를 조회하시오
 * 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 정렬 */
SELECT 
	STUDENT_NAME "학생 이름",
	STUDENT_ADDRESS "주소지"
FROM 
	TB_STUDENT
ORDER BY
	"학생 이름" ASC;

/* 2번 O
 * 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서 조회하시오.
 */
SELECT 
	STUDENT_NAME,
	STUDENT_SSN 
FROM 
	TB_STUDENT
WHERE
	ABSENCE_YN = 'Y'
ORDER BY
	STUDENT_SSN DESC;

/* 3번 O
 * 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의
 * 이름과 학번, 주소를 이름 오름차순으로 조회하시오.
 * 단, 출력헤더에는 "학생이름", "학번", "거주지 주소"가 출력되도록 한다. */
SELECT 
	STUDENT_NAME 학생이름,
	STUDENT_NO 학번,
	STUDENT_ADDRESS "거주지 주소"
FROM 
	TB_STUDENT
WHERE 
	(STUDENT_ADDRESS LIKE '경기도%'
OR
	STUDENT_ADDRESS LIKE '강원도%')
AND
	STUDENT_NO LIKE '9%'
ORDER BY
	STUDENT_NAME ASC;
	
/* 4번 O
 * 현재 법학과 교수의 이름, 주민등록 번호를 나이가 많은 순서부터 조회하시오. 
 * */
SELECT 
	PROFESSOR_NAME,
	PROFESSOR_SSN
FROM 
	TB_PROFESSOR P
JOIN 
	TB_DEPARTMENT D ON (P.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE 
	DEPARTMENT_NAME = '법학과'
ORDER BY 
	PROFESSOR_SSN ASC;
	
/* 5번 O
 * 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다.
 * 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 조회하시오.
 * (참고) 소수점 아래 2자리까지 0으로 표현 : TO_CHAR(NUMBER, 'FM9.00')
 * (FM : 조회 결과 양쪽 공백 제거) 
 * */
SELECT 
	STUDENT_NO,
	TO_CHAR(POINT, 'FM9.00') 학점
FROM
	TB_GRADE
WHERE 
	TERM_NO = '200402'
AND
	CLASS_NO = 'C3118100'
ORDER BY
	POINT DESC, STUDENT_NO ASC;

/* 6번 O
 * 학생 번호, 학생 이름, 학과 이름을 학생 이름 오름차순으로 조회하시오.
 * */
SELECT 
	S.STUDENT_NO,
	S.STUDENT_NAME,
	D.DEPARTMENT_NAME
FROM 
	TB_STUDENT S
JOIN
	TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
ORDER BY 
	S.STUDENT_NAME ASC;

/* 7번 O
 * 춘 기술대학교의 과목 이름, 해당 과목을 수업하는 학과 이름을 조회하시오.
 * */
SELECT
	C.CLASS_NAME,
	D.DEPARTMENT_NAME 
FROM 
	TB_DEPARTMENT D
JOIN 
	TB_CLASS C ON (D.DEPARTMENT_NO = C.DEPARTMENT_NO);

/* 8번 ----------JOIN  잘 모르겠음
 * 과목, 해당 과목 교수 이름을 조회하시오
 * */
SELECT
	C.CLASS_NAME,
	P.PROFESSOR_NAME
FROM
	TB_CLASS C 
RIGHT JOIN 
	TB_PROFESSOR P ON (C.DEPARTMENT_NO = P.DEPARTMENT_NO);

/* 9번
 *  8번의 결과 중 '인문 사회' 계열에 속한
 * 과목명, 교수이름을 과목명 오름차순으로 조회하시오. 
 * */



/* 10번 ------------------ 모르겠음
 * 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 조회하시오.
 * (단, 평점은 소수점 1자리까지만 반올림하여 표시한다.)
 * */

SELECT 
	S.STUDENT_NO,
	S.STUDENT_NAME
FROM 
	TB_STUDENT S
JOIN 
	TB_GRADE G ON (S.STUDENT_NO = G.STUDENT_NO)
JOIN 
	TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
WHERE
	D.DEPARTMENT_NAME = '음악학과';
	
/* 11번
 *  학번이 A313047인 학생의 학과이름, 학생이름, 지도교수 이름을 조회하시오.
 * */
SELECT 
	D.DEPARTMENT_NAME,	
	S.STUDENT_NAME
	P.PROFESSOR_NAME
FROM 
	TB_STUDENT S
JOIN
	TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
--JOIN 
	TB_PROFESSOR P ON (S.COACH_PROFESSOR_NO = P.)
WHERE 
	S.STUDENT_NO = 'A313047';

/* 12번 -? 14행 맞는지? 답에는 3행까지만 나옴
 * 2007년도에 '인간관계론' 과목을 수강한 학생을 찾아 
 * 학생이름과 수강학기를 조회하는 SQL을 작성하시오.
 * */
SELECT 
	S.STUDENT_NAME,
	G.TERM_NO
FROM
	TB_STUDENT S
JOIN 
	TB_GRADE G ON (S.STUDENT_NO = G.STUDENT_NO)
JOIN 
	TB_CLASS C ON (S.DEPARTMENT_NO = C.DEPARTMENT_NO)
WHERE 
	G.TERM_NO LIKE '2007%'
AND 
	C.CLASS_NAME = '인간관계론'; 

/* 13번
 * 예체능 계열 과목 중 과목 담당교수를 한 명도 배정받지 못한 과목을 찾아
 * 과목 이름, 학과 이름을 조회하시오.
 * */
SELECT 
	C.CLASS_NAME,
	D.DEPARTMENT_NAME 
FROM 
	TB_DEPARTMENT D
JOIN
	TB_CLASS C ON (D.DEPARTMENT_NO = C.DEPARTMENT_NO)
HAVING
	D.CATEGORY = '예체능';

/* 14번
 * 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 한다.
 * 학생이름, 지도교수이름 학번이 높은 순서로 조회하는 SQL을 작성하시오.
 * 단, 지도교수가 없을 경우 "지도교수 미지정"으로 표시 
 * */

/* 15번
 * 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아
 * 학생의 학번, 이름, 학과, 이름, 평점을 조회하시오
 * */













