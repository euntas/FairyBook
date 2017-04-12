
/* Drop Tables */

DROP TABLE COLORCOUNT CASCADE CONSTRAINTS;
DROP TABLE ETC CASCADE CONSTRAINTS;
DROP TABLE ITEMS CASCADE CONSTRAINTS;
DROP TABLE MADEAVATAR CASCADE CONSTRAINTS;
DROP TABLE MADEHOUSE CASCADE CONSTRAINTS;
DROP TABLE SELECTIONDETAIL CASCADE CONSTRAINTS;
DROP TABLE MYSELECTION CASCADE CONSTRAINTS;
DROP TABLE SCENE CASCADE CONSTRAINTS;
DROP TABLE FAIRYTALE CASCADE CONSTRAINTS;
DROP TABLE FBRESOURCE CASCADE CONSTRAINTS;
DROP TABLE PREPLY CASCADE CONSTRAINTS;
DROP TABLE PBOARD CASCADE CONSTRAINTS;
DROP TABLE QUIZ CASCADE CONSTRAINTS;
DROP TABLE STORYMAKER CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE BOARDNUM_SEQ;
DROP SEQUENCE QUIZNUM_SEQ;
DROP SEQUENCE REPLYNUM_SEQ;
DROP SEQUENCE RESOURCENUM_SEQ;
DROP SEQUENCE SCENENUM_SEQ;
DROP SEQUENCE SELECTIONNUM_SEQ;
DROP SEQUENCE STORYNUM_SEQ;




/* Create Sequences */

CREATE SEQUENCE BOARDNUM_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE QUIZNUM_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE REPLYNUM_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE RESOURCENUM_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SCENENUM_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SELECTIONNUM_SEQ INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE STORYNUM_SEQ INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE COLORCOUNT
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 색 이름
	COLORNAME varchar2(20),
	-- 해당 색을 센다
	COLORCOUNT number
);


CREATE TABLE ETC
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 자료 고유 번호
	RESOURCENUM number NOT NULL
);


CREATE TABLE FAIRYTALE
(
	-- 동화책 고유번호
	-- 
	STORYNUM number NOT NULL,
	-- 동화책 제목
	STORYTITLE varchar2(100) NOT NULL,
	PRIMARY KEY (STORYNUM)
);


CREATE TABLE FBRESOURCE
(
	-- 자료 고유 번호
	RESOURCENUM number NOT NULL,
	-- 자료 이름
	NAME varchar2(100),
	-- 자료 분석 텍스트
	ANALYSIS varchar2(1000),
	-- 이미지 파일 경로
	PATH varchar2(200),
	PRIMARY KEY (RESOURCENUM)
);


CREATE TABLE ITEMS
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 아이템 이름
	ITEMNAME varchar2(50),
	-- 아이템 상세 설명
	ITEMDETAIL varchar2(200)
);


CREATE TABLE MADEAVATAR
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 자료 고유 번호
	RESOURCENUM number NOT NULL
);


CREATE TABLE MADEHOUSE
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 자료 고유 번호
	RESOURCENUM number NOT NULL
);


CREATE TABLE MYSELECTION
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 회원 아이디
	ID varchar2(20) NOT NULL,
	-- 동화책 고유번호
	-- 
	STORYNUM number NOT NULL,
	-- 시작 날짜
	STARTDATE date DEFAULT SYSDATE,
	-- 끝날짜
	ENDDATE date DEFAULT SYSDATE,
	-- 완료 여부
	FINISHED varchar2(10),
	PRIMARY KEY (SELECTIONNUM)
);


CREATE TABLE PBOARD
(
	-- 게시판 글 고유 번호
	BOARDNUM number NOT NULL,
	-- 회원 아이디
	ID varchar2(20) NOT NULL,
	-- 게시글 제목
	TITLE varchar2(100) NOT NULL,
	-- 게시글 내용
	CONTENT varchar2(4000) NOT NULL,
	-- 글 쓴 시간
	INPUTDATE date DEFAULT SYSDATE,
	-- 게시판 조회수
	-- 
	HIT number DEFAULT 0,
	PRIMARY KEY (BOARDNUM)
);


CREATE TABLE PREPLY
(
	-- 댓글 고유 번호
	REPLYNUM number NOT NULL,
	-- 회원 아이디
	ID varchar2(20) NOT NULL,
	-- 게시판 글 고유 번호
	BOARDNUM number NOT NULL,
	-- 댓글 내용
	TEXT varchar2(500) NOT NULL,
	-- 댓글 작성 시간
	INPUTDATE date DEFAULT SYSDATE,
	PRIMARY KEY (REPLYNUM)
);


CREATE TABLE QUIZ
(
	-- 퀴즈 고유번호
	QUIZNUM number NOT NULL,
	-- 문제 질문
	QUESTION varchar2(500),
	-- 보기1
	SELECT1 varchar2(100),
	-- 보기2
	SELECT2 varchar2(100),
	-- 보기3
	SELECT3 varchar2(100),
	-- 보기4
	SELECT4 varchar2(100),
	-- 진짜 답
	ANSWER number,
	PRIMARY KEY (QUIZNUM)
);


CREATE TABLE SCENE
(
	-- 동화책 장면 고유 번호
	SCENENUM number NOT NULL,
	-- 동화책 고유번호
	-- 
	STORYNUM number NOT NULL,
	-- 퀴즈 고유번호
	QUIZNUM number NOT NULL,
	-- 선택1을 했을시 다음 장면
	NEXTSCENE1 number,
	-- 선택2을 했을시 다음 장면
	NEXTSCENE2 number,
	-- 선택3을 했을시 다음 장면
	NEXTSCENE3 number,
	-- 선택4을 했을시 다음 장면
	NEXTSCENE4 number,
	-- 아바타 설명
	FBEXPLAIN varchar2(500),
	-- 스토리 텍스트 1
	STORYTEXT1 varchar2(1000),
	-- 스토리텍스트2
	STORYTEXT2 varchar2(1000),
	PRIMARY KEY (SCENENUM)
);


CREATE TABLE SELECTIONDETAIL
(
	-- 내선택 고유번호
	SELECTIONNUM number NOT NULL,
	-- 동화책 장면 고유 번호
	SCENENUM number NOT NULL,
	-- 내가 선택한 답
	MYANSWER number,
	-- 해당 씬을 진행한 날짜
	INPUTDATE date DEFAULT SYSDATE,
	-- 기타 스토리에 영향을 미치는 아이템
	ITEM varchar2(200)
);


CREATE TABLE STORYMAKER
(
	-- 회원 아이디
	ID varchar2(20) NOT NULL,
	-- 아동용 비밀번호
	PASSWORD1 varchar2(20) NOT NULL,
	-- 부모 전용 비밀번호
	PASSWORD2 varchar2(20) NOT NULL,
	-- 부모 이름
	PNAME varchar2(20) NOT NULL,
	-- 아동 이름
	CNAME varchar2(20) NOT NULL,
	-- 아동의 생일
	CBIRTH date NOT NULL,
	-- EMAIL
	-- 
	EMAIL varchar2(50) NOT NULL,
	-- 집 주소
	ADDRESS varchar2(100) NOT NULL,
	-- 핸드폰 번호
	PHONE varchar2(20) NOT NULL,
	-- 부모 닉네임
	PNICKNAME varchar2(20) DEFAULT 'ID' UNIQUE,
	-- 아동용 닉네임
	CNICKNAME varchar2(20) DEFAULT 'ID' UNIQUE,
	-- 유저가 올리는 프로필 사진 경로
	-- 
	ORIGINALPROFILE varchar2(100),
	-- 서버에 저장되는 프로필사진 경로
	SAVEDPROFILE varchar2(100),
	PRIMARY KEY (ID)
);

--병원 테이블
create table counselor(
	--병원고유번호
	hospId number primary key,
	--지역구분(시,도)
	region varchar2(30) not null,
	--지역구분(시,군,구)
	country varchar2(30) not null,
	--병원명
	hospital varchar2(30) not null,
	--담당의사
	doctor  varchar2(20) not null,
	--전화번호
	phoneNum varchar2(30) not null,
	--이메일
	email varchar2(50) not null
);

-- 씬 번호와 실제 페이지 번호 확인을 위한 테이블(페이지번호는 flipbook 안의 페이지 번호를 뜻함. 0번부터 시작됨)
create table pagelist(
	-- 씬 번호
	scenenum number references scene,
	-- 페이지 번호
	pagenum number
);


create sequence seq_counselor start with 1 increment by 1;

--책 주문 정보
create table ORDERBOOK(
	--선택 동화
	selectionnum number not null,
	--주문한 날짜
	orderdate date not null,
	--책 표지(경로저장)
	bookcover varchar2(100) not null,
	--주문 상황
	currentstate varchar2(50),
	foreign key (selectionnum) references MYSELECTION(selectionnum)
);

insert into counselor values (seq_counselor.nextval, '서울', '마포' , '우리들병원', '고정기', '02-458-3215', 'junggigo@naver.com');
insert into counselor values (seq_counselor.nextval, '서울', '강동', 'jnLee아동정신의학과', '이지나', '02-749-2511', 'jnlee@gmail.com');
insert into counselor values (seq_counselor.nextval, '서울', '강남', '크는아이병원', '김태준', '02-6656-8123', 'scmaster01@softengineer.school');
insert into counselor values (seq_counselor.nextval, '서울', '관악', '연세아동정신과병원', '우지원', '02-337-5634', 'woo3point@hanmail.net');
insert into counselor values (seq_counselor.nextval, '경기인천', '인천', '송도은지병원', '이은지', '032-796-1902', 'eunta@naver.com');
insert into counselor values (seq_counselor.nextval, '경기인천', '수원', '경희아동정신과병원', '김경희', '031-592-9012', 'kkh9012@naver.com');
insert into counselor values (seq_counselor.nextval, '경기인천', '의정부', '튼튼병원', '박흥부', '031-2291-2910', 'swallow@chosun.com');
insert into counselor values (seq_counselor.nextval, '강원', '원주', '연세아동정신과병원', '전원주', '033-972-0438', 'soondae@hotmail.com');
insert into counselor values (seq_counselor.nextval, '충청', '대전', '성심소아정신과', '성심당', '042-582-3952', 'soboro@nate.com');
insert into counselor values (seq_counselor.nextval, '충청', '충주', '호반의원', '고바우', '043-433-4333', 'lakecity@nate.com');
insert into counselor values (seq_counselor.nextval, '충청', '천안', '삼거리정신의학과', '천안삼', '041-290-6821', 'hodoo@yahoo.co.kr');
insert into counselor values (seq_counselor.nextval, '전라', '광주', '민주정신의학과', '김홍걸', '062-902-6729', 'pumpthisparty@nate.com');
insert into counselor values (seq_counselor.nextval, '전라', '전주', '쑥쑥아이병원', '전동성', '063-673-5424', 'bibimbap@naver.com');
insert into counselor values (seq_counselor.nextval, '전라', '목포', '하성걸의원', '하성걸', '061-529-4230', 'drfrog@hanmail.net');
insert into counselor values (seq_counselor.nextval, '경상', '대구', '대구카톨릭병원', '김마리아', '053-554-1243', 'amen@naver.com');
insert into counselor values (seq_counselor.nextval, '경상', '구미', '이한건의원', '이한건', '054-455-1923', 'kstylez3@naver.com');
insert into counselor values (seq_counselor.nextval, '경상', '포항', '포항i-병원', '이승엽', '054-728-1901', 'homerun@naver.com');
insert into counselor values (seq_counselor.nextval, '경상', '부산', '석진정신의학과', '김석진', '051-834-0042', 'sjkim@gmail.com');
insert into counselor values (seq_counselor.nextval, '경상', '울산', '현대병원', '정주영', '052-492-1820', 'sonata@hyundai.co.kr');
insert into counselor values (seq_counselor.nextval, '경상', '창원', '우리아이정신의학과', '안상수', '055-931-1818', 'bottlebomb@saenuri.com');
insert into counselor values (seq_counselor.nextval, '제주', '제주', '감수광의원', '혜은이', '064-583-9345', 'hanganggyo@nate.com');
--임시방편의 가입절차
insert into STORYMAKER values ('ryan', '1234', '12345', '라훈아', '라이언', (TO_DATE('2012-12-12','YYYY-MM-DD')), 'ryan@naver.com', '송파구 삼전동', '010-1111-1111', '라이언맘', '라이언', null, null);


/* Create Foreign Keys */

ALTER TABLE MYSELECTION
	ADD FOREIGN KEY (STORYNUM)
	REFERENCES FAIRYTALE (STORYNUM)
;


ALTER TABLE SCENE
	ADD FOREIGN KEY (STORYNUM)
	REFERENCES FAIRYTALE (STORYNUM)
;


ALTER TABLE ETC
	ADD FOREIGN KEY (RESOURCENUM)
	REFERENCES FBRESOURCE (RESOURCENUM)
;


ALTER TABLE MADEAVATAR
	ADD FOREIGN KEY (RESOURCENUM)
	REFERENCES FBRESOURCE (RESOURCENUM)
;


ALTER TABLE MADEHOUSE
	ADD FOREIGN KEY (RESOURCENUM)
	REFERENCES FBRESOURCE (RESOURCENUM)
;


ALTER TABLE COLORCOUNT
	ADD FOREIGN KEY (SELECTIONNUM)
	REFERENCES MYSELECTION (SELECTIONNUM)
;


ALTER TABLE ETC
	ADD FOREIGN KEY (SELECTIONNUM)
	REFERENCES MYSELECTION (SELECTIONNUM)
;


ALTER TABLE ITEMS
	ADD FOREIGN KEY (SELECTIONNUM)
	REFERENCES MYSELECTION (SELECTIONNUM)
;


ALTER TABLE MADEAVATAR
	ADD FOREIGN KEY (SELECTIONNUM)
	REFERENCES MYSELECTION (SELECTIONNUM)
;


ALTER TABLE MADEHOUSE
	ADD FOREIGN KEY (SELECTIONNUM)
	REFERENCES MYSELECTION (SELECTIONNUM)
;


ALTER TABLE SELECTIONDETAIL
	ADD FOREIGN KEY (SELECTIONNUM)
	REFERENCES MYSELECTION (SELECTIONNUM)
;


ALTER TABLE PREPLY
	ADD FOREIGN KEY (BOARDNUM)
	REFERENCES PBOARD (BOARDNUM)
;


ALTER TABLE SCENE
	ADD FOREIGN KEY (QUIZNUM)
	REFERENCES QUIZ (QUIZNUM)
;


ALTER TABLE SELECTIONDETAIL
	ADD FOREIGN KEY (SCENENUM)
	REFERENCES SCENE (SCENENUM)
;


ALTER TABLE MYSELECTION
	ADD FOREIGN KEY (ID)
	REFERENCES STORYMAKER (ID)
;


ALTER TABLE PBOARD
	ADD FOREIGN KEY (ID)
	REFERENCES STORYMAKER (ID)
;


ALTER TABLE PREPLY
	ADD FOREIGN KEY (ID)
	REFERENCES STORYMAKER (ID)
;



/* Comments */

COMMENT ON COLUMN COLORCOUNT.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN COLORCOUNT.COLORNAME IS '색 이름';
COMMENT ON COLUMN COLORCOUNT.COLORCOUNT IS '해당 색을 센다';
COMMENT ON COLUMN ETC.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN ETC.RESOURCENUM IS '자료 고유 번호';
COMMENT ON COLUMN FAIRYTALE.STORYNUM IS '동화책 고유번호
';
COMMENT ON COLUMN FAIRYTALE.STORYTITLE IS '동화책 제목';
COMMENT ON COLUMN FBRESOURCE.RESOURCENUM IS '자료 고유 번호';
COMMENT ON COLUMN FBRESOURCE.NAME IS '자료 이름';
COMMENT ON COLUMN FBRESOURCE.ANALYSIS IS '자료 분석 텍스트';
COMMENT ON COLUMN FBRESOURCE.PATH IS '이미지 파일 경로';
COMMENT ON COLUMN ITEMS.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN ITEMS.ITEMNAME IS '아이템 이름';
COMMENT ON COLUMN ITEMS.ITEMDETAIL IS '아이템 상세 설명';
COMMENT ON COLUMN MADEAVATAR.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN MADEAVATAR.RESOURCENUM IS '자료 고유 번호';
COMMENT ON COLUMN MADEHOUSE.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN MADEHOUSE.RESOURCENUM IS '자료 고유 번호';
COMMENT ON COLUMN MYSELECTION.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN MYSELECTION.ID IS '회원 아이디';
COMMENT ON COLUMN MYSELECTION.STORYNUM IS '동화책 고유번호
';
COMMENT ON COLUMN MYSELECTION.STARTDATE IS '시작 날짜';
COMMENT ON COLUMN MYSELECTION.ENDDATE IS '끝날짜';
COMMENT ON COLUMN MYSELECTION.FINISHED IS '완료 여부';
COMMENT ON COLUMN PBOARD.BOARDNUM IS '게시판 글 고유 번호';
COMMENT ON COLUMN PBOARD.ID IS '회원 아이디';
COMMENT ON COLUMN PBOARD.TITLE IS '게시글 제목';
COMMENT ON COLUMN PBOARD.CONTENT IS '게시글 내용';
COMMENT ON COLUMN PBOARD.INPUTDATE IS '글 쓴 시간';
COMMENT ON COLUMN PBOARD.HIT IS '게시판 조회수
';
COMMENT ON COLUMN PREPLY.REPLYNUM IS '댓글 고유 번호';
COMMENT ON COLUMN PREPLY.ID IS '회원 아이디';
COMMENT ON COLUMN PREPLY.BOARDNUM IS '게시판 글 고유 번호';
COMMENT ON COLUMN PREPLY.TEXT IS '댓글 내용';
COMMENT ON COLUMN PREPLY.INPUTDATE IS '댓글 작성 시간';
COMMENT ON COLUMN QUIZ.QUIZNUM IS '퀴즈 고유번호';
COMMENT ON COLUMN QUIZ.QUESTION IS '문제 질문';
COMMENT ON COLUMN QUIZ.SELECT1 IS '보기1';
COMMENT ON COLUMN QUIZ.SELECT2 IS '보기2';
COMMENT ON COLUMN QUIZ.SELECT3 IS '보기3';
COMMENT ON COLUMN QUIZ.SELECT4 IS '보기4';
COMMENT ON COLUMN QUIZ.ANSWER IS '진짜 답';
COMMENT ON COLUMN SCENE.SCENENUM IS '동화책 장면 고유 번호';
COMMENT ON COLUMN SCENE.STORYNUM IS '동화책 고유번호
';
COMMENT ON COLUMN SCENE.QUIZNUM IS '퀴즈 고유번호';
COMMENT ON COLUMN SCENE.NEXTSCENE1 IS '선택1을 했을시 다음 장면';
COMMENT ON COLUMN SCENE.NEXTSCENE2 IS '선택2을 했을시 다음 장면';
COMMENT ON COLUMN SCENE.NEXTSCENE3 IS '선택3을 했을시 다음 장면';
COMMENT ON COLUMN SCENE.NEXTSCENE4 IS '선택4을 했을시 다음 장면';
COMMENT ON COLUMN SCENE.FBEXPLAIN IS '아바타 설명';
COMMENT ON COLUMN SCENE.STORYTEXT1 IS '스토리 텍스트 1';
COMMENT ON COLUMN SCENE.STORYTEXT2 IS '스토리텍스트2';
COMMENT ON COLUMN SELECTIONDETAIL.SELECTIONNUM IS '내선택 고유번호';
COMMENT ON COLUMN SELECTIONDETAIL.SCENENUM IS '동화책 장면 고유 번호';
COMMENT ON COLUMN SELECTIONDETAIL.MYANSWER IS '내가 선택한 답';
COMMENT ON COLUMN SELECTIONDETAIL.INPUTDATE IS '해당 씬을 진행한 날짜';
COMMENT ON COLUMN SELECTIONDETAIL.ITEM IS '기타 스토리에 영향을 미치는 아이템';
COMMENT ON COLUMN STORYMAKER.ID IS '회원 아이디';
COMMENT ON COLUMN STORYMAKER.PASSWORD1 IS '아동용 비밀번호';
COMMENT ON COLUMN STORYMAKER.PASSWORD2 IS '부모 전용 비밀번호';
COMMENT ON COLUMN STORYMAKER.PNAME IS '부모 이름';
COMMENT ON COLUMN STORYMAKER.CNAME IS '아동 이름';
COMMENT ON COLUMN STORYMAKER.CBIRTH IS '아동의 생일';
COMMENT ON COLUMN STORYMAKER.EMAIL IS 'EMAIL
';
COMMENT ON COLUMN STORYMAKER.ADDRESS IS '집 주소';
COMMENT ON COLUMN STORYMAKER.PHONE IS '핸드폰 번호';
COMMENT ON COLUMN STORYMAKER.PNICKNAME IS '부모 닉네임';
COMMENT ON COLUMN STORYMAKER.CNICKNAME IS '아동용 닉네임';
COMMENT ON COLUMN STORYMAKER.ORIGINALPROFILE IS '유저가 올리는 프로필 사진 경로
';
COMMENT ON COLUMN STORYMAKER.SAVEDPROFILE IS '서버에 저장되는 프로필사진 경로';



