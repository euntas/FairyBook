--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table QUIZ
--------------------------------------------------------

  CREATE TABLE "FB"."QUIZ" 
   (	"QUIZNUM" NUMBER, 
	"QUESTION" VARCHAR2(500 BYTE), 
	"SELECT1" VARCHAR2(100 BYTE), 
	"SELECT2" VARCHAR2(100 BYTE), 
	"SELECT3" VARCHAR2(100 BYTE), 
	"SELECT4" VARCHAR2(100 BYTE), 
	"ANSWER" NUMBER, 
	"DIVISION" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "FB"."QUIZ"."QUIZNUM" IS '퀴즈 고유번호';
   COMMENT ON COLUMN "FB"."QUIZ"."QUESTION" IS '문제 질문';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT1" IS '보기1';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT2" IS '보기2';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT3" IS '보기3';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT4" IS '보기4';
   COMMENT ON COLUMN "FB"."QUIZ"."ANSWER" IS '진짜 답';
REM INSERTING into FB.QUIZ
SET DEFINE OFF;
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (22,'아빠가 보고싶어...','<img src="../resources/img/quiz/1.png" style="width:100px;height:100px;">','<img src="../resources/img/quiz/2.png" style="width:100px;height:100px;display:inline;">','<img src="../resources/img/quiz/3.png" style="width:100px;height:100px;">','<img src="../resources/img/quiz/4.png" style="width:100px;height:100px;display:inline;">',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (23,'헨젤과 그레텔은 어떤 아이들일까요?','친구들이 많은 아이들','조용하고 차분한 아이들','활발하고 적극적인 아이들','책 읽는 것을 좋아하는 아이들',-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (1,'독일의 수도를 맞춰봐.','서울','뉴욕','베를린','도쿄',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (2,'100 - 60 = ?','10개','40개','50개','70개',2,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (3,'조그마한 돌을 가리키는 말이야. 정확한 표기가 뭘까?','돌뱅이','돌벵이','돌맹이','돌멩이',4,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (4,'짧은 바늘이 8과 9 사이를 가리키고, 긴 바늘이 10을 가리키고 있어 지금 몇 시인지 맞춰봐.','8시 10분','8시 50분','9시 10분','9시 50분',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (5,'무슨 물건을 챙겨가면 좋을까?','돼지저금통','곰 인형','아빠 지갑','아무것도 가져가지 않는다.',-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (6,'평화의 상징인 이 새의 이름을 맞춰보자.','참새','비둘기','뻐꾸기','독수리',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (7,'집주인이 없는 것 같은데 어떡하면 좋을까?','들어간다','들어가지 않는다',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (8,'아줌마를 따라 같이 갈까?','예','아니오',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (9,'별은 영어로 뭘까?','moon','sun','star','cloud',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (10,'과자 먹을까?','예','아니오',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (11,'9 ÷ 3 = ?','1개','2개','3개','4개',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (12,'할머니랑 같이 살래?','예','아니오',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (13,'9에서 얼마를 빼야 3이 될까?','2개','4개','6개','8개',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (14,'어떤 물건을 주면 좋을지 골라봐.','돼지저금통을 마녀에게 준다.','인형을 마녀에게 준다.','아빠 지갑을 마녀에게 준다.','아무 것도 주지 않는다.',-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (15,'착하다는 뜻의 영어 단어를 골라봐.','Dirty','Good','Strange','Bad',2,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (16,'청소를 하는데 필요 없는 물건은 무엇일까?','망치','빗자루','걸레','먼지떨이',1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (17,null,'뼈다귀를 내민다.','손을 내민다.',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (18,'위급한 상황에 보내는 신호는?','SES','SBS','SOS','SCIT',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (19,'물이 끓는 온도는?','70도','80도','90도','100도',4,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (20,null,'집으로 간다.','집으로 가지 않는다.',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (21,'길을 잃어버렸을 때 쓰는 올바른 표현은?','지키면','헤매면','누우면','춤추면',2,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (100,'샘플테스트용 문제입니다.','일번선택지','이번선택지','삼번선택지','사번선택지',1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (101,'두번째 테스트용 문제입니다.','일번이다','이번이다','삼번이다','사번이다',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (-1,null,null,null,null,null,null,0);
--------------------------------------------------------
--  DDL for Index SYS_C007235
--------------------------------------------------------

  CREATE UNIQUE INDEX "FB"."SYS_C007235" ON "FB"."QUIZ" ("QUIZNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table QUIZ
--------------------------------------------------------

  ALTER TABLE "FB"."QUIZ" ADD PRIMARY KEY ("QUIZNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FB"."QUIZ" MODIFY ("QUIZNUM" NOT NULL ENABLE);
