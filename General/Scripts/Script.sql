-- 한 줄 주석 (Cctrl + /)
/* 범위주석 (ctrl + shift + / )*/

/* SQL 실행
 * 1개 실행 : CTRL + ENTER
 * 여러개 실행 : (블록 지정 후) ALT + X
 * */

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

/* 사용자 계정 생성*/
CREATE USER KH09_KHS
IDENTIFIED BY "KH1234";

/*생성된 사용자 계정 사용 용량 지정*/
ALTER USER KH09_KHS
DEFAULT TABLESPACE "USERS"
QUOTA 200M ON "USERS";