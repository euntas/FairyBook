--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COVERRESOURCES
--------------------------------------------------------

  CREATE TABLE "FB"."COVERRESOURCES" 
   (	"STORYNUM" NUMBER, 
	"TYPE" VARCHAR2(20 BYTE), 
	"PATH" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "FB"."COVERRESOURCES"."STORYNUM" IS '동화번호';
   COMMENT ON COLUMN "FB"."COVERRESOURCES"."TYPE" IS '표지,타이틀,캐릭터';
   COMMENT ON COLUMN "FB"."COVERRESOURCES"."PATH" IS '경로';
REM INSERTING into FB.COVERRESOURCES
SET DEFINE OFF;
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'background','../resources/img/coverResources/background1.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'background','../resources/img/coverResources/background2.jpg');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'title','../resources/img/coverResources/title2.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'title','../resources/img/coverResources/title3.PNG');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'title','../resources/img/coverResources/title4.PNG');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'title','../resources/img/coverResources/title5.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'title','../resources/img/coverResources/title1.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'character','../resources/img/coverResources/dad.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'character','../resources/img/coverResources/gretel.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'character','../resources/img/coverResources/hansel.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'character','../resources/img/coverResources/mom.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'character','../resources/img/coverResources/perion.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'background','../resources/img/coverResources/background3.png');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'background','../resources/img/coverResources/background5.jpg');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'background','../resources/img/coverResources/background6.jpg');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'background','../resources/img/coverResources/background7.jpg');
Insert into FB.COVERRESOURCES (STORYNUM,TYPE,PATH) values (1,'title','../resources/img/coverResources/title6.png');
--------------------------------------------------------
--  Constraints for Table COVERRESOURCES
--------------------------------------------------------

  ALTER TABLE "FB"."COVERRESOURCES" MODIFY ("PATH" NOT NULL ENABLE);
  ALTER TABLE "FB"."COVERRESOURCES" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "FB"."COVERRESOURCES" MODIFY ("STORYNUM" NOT NULL ENABLE);
