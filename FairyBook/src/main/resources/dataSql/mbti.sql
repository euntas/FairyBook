--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MBTI
--------------------------------------------------------

  CREATE TABLE "FB"."MBTI" 
   (	"SELECTIONNUM" NUMBER, 
	"EI" VARCHAR2(1 BYTE), 
	"SN" VARCHAR2(1 BYTE), 
	"TF" VARCHAR2(1 BYTE), 
	"JP" VARCHAR2(1 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "FB"."MBTI"."EI" IS '유형 E, I';
   COMMENT ON COLUMN "FB"."MBTI"."SN" IS '유형 S, N';
   COMMENT ON COLUMN "FB"."MBTI"."TF" IS '유형 T, F';
   COMMENT ON COLUMN "FB"."MBTI"."JP" IS '유형 J, P';
REM INSERTING into FB.MBTI
SET DEFINE OFF;
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (445,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (464,'e','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (459,'i','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (366,'i','n','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (461,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (447,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (447,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (463,'i','n','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (469,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (465,'i','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (472,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (471,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (470,'i','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (475,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (481,'e','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (485,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (486,'i','n','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (490,'e','n','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (489,'e','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (466,'i','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (493,'e','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (502,'e','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (503,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (505,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (483,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (506,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (511,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (510,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (543,'e','s','t','p');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (546,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (544,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (581,'e','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (602,'i','s','t','j');
Insert into FB.MBTI (SELECTIONNUM,EI,SN,TF,JP) values (622,'e','s','t','j');
--------------------------------------------------------
--  Constraints for Table MBTI
--------------------------------------------------------

  ALTER TABLE "FB"."MBTI" MODIFY ("SELECTIONNUM" NOT NULL ENABLE);
