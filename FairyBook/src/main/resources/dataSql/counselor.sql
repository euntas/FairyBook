--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table COUNSELOR
--------------------------------------------------------

  CREATE TABLE "FB"."COUNSELOR" 
   (	"HOSPID" NUMBER, 
	"REGION" VARCHAR2(30 BYTE), 
	"COUNTRY" VARCHAR2(30 BYTE), 
	"HOSPITAL" VARCHAR2(30 BYTE), 
	"DOCTOR" VARCHAR2(20 BYTE), 
	"PHONENUM" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into FB.COUNSELOR
SET DEFINE OFF;
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (1,'서울','마포','우리들병원','고정기','02-458-3215','junggigo@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (2,'서울','강동','jnLee아동정신의학과','이지나','02-749-2511','jnlee@gmail.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (3,'서울','강남','크는아이병원','김태준','02-6656-8123','scmaster01@softengineer.school');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (4,'서울','관악','연세아동정신과병원','우지원','02-337-5634','woo3point@hanmail.net');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (5,'경기인천','인천','송도은지병원','이은지','032-796-1902','eunta@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (6,'경기인천','수원','경희아동정신과병원','김경희','031-592-9012','kkh9012@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (7,'경기인천','의정부','튼튼병원','박흥부','031-2291-2910','swallow@chosun.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (8,'강원','원주','연세아동정신과병원','전원주','033-972-0438','soondae@hotmail.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (9,'충청','대전','성심소아정신과','성심당','042-582-3952','soboro@nate.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (10,'충청','충주','호반의원','고바우','043-433-4333','lakecity@nate.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (11,'충청','천안','삼거리정신의학과','천안삼','041-290-6821','hodoo@yahoo.co.kr');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (12,'전라','광주','민주정신의학과','김홍걸','062-902-6729','pumpthisparty@nate.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (13,'전라','전주','쑥쑥아이병원','전동성','063-673-5424','bibimbap@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (14,'전라','목포','하성걸의원','하성걸','061-529-4230','drfrog@hanmail.net');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (15,'경상','대구','대구카톨릭병원','김마리아','053-554-1243','amen@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (16,'경상','구미','이한건의원','이한건','054-455-1923','kstylez3@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (17,'경상','포항','포항i-병원','이승엽','054-728-1901','homerun@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (18,'경상','부산','석진정신의학과','김석진','051-834-0042','sjkim@gmail.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (19,'경상','울산','현대병원','정주영','052-492-1820','sonata@hyundai.co.kr');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (20,'경상','창원','우리아이정신의학과','안상수','055-931-1818','bottlebomb@saenuri.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (21,'제주','제주','감수광의원','혜은이','064-583-9345','hanganggyo@nate.com');
--------------------------------------------------------
--  DDL for Index SYS_C007323
--------------------------------------------------------

  CREATE UNIQUE INDEX "FB"."SYS_C007323" ON "FB"."COUNSELOR" ("HOSPID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table COUNSELOR
--------------------------------------------------------

  ALTER TABLE "FB"."COUNSELOR" ADD PRIMARY KEY ("HOSPID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FB"."COUNSELOR" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FB"."COUNSELOR" MODIFY ("PHONENUM" NOT NULL ENABLE);
  ALTER TABLE "FB"."COUNSELOR" MODIFY ("DOCTOR" NOT NULL ENABLE);
  ALTER TABLE "FB"."COUNSELOR" MODIFY ("HOSPITAL" NOT NULL ENABLE);
  ALTER TABLE "FB"."COUNSELOR" MODIFY ("COUNTRY" NOT NULL ENABLE);
  ALTER TABLE "FB"."COUNSELOR" MODIFY ("REGION" NOT NULL ENABLE);
