--------------------------------------------------------
--  ������ ������ - �ݿ���-6��-16-2017   
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
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (1,'����','����','�츮�麴��','������','02-458-3215','junggigo@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (2,'����','����','jnLee�Ƶ��������а�','������','02-749-2511','jnlee@gmail.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (3,'����','����','ũ�¾��̺���','������','02-6656-8123','scmaster01@softengineer.school');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (4,'����','����','�����Ƶ����Ű�����','������','02-337-5634','woo3point@hanmail.net');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (5,'�����õ','��õ','�۵���������','������','032-796-1902','eunta@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (6,'�����õ','����','����Ƶ����Ű�����','�����','031-592-9012','kkh9012@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (7,'�����õ','������','ưư����','�����','031-2291-2910','swallow@chosun.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (8,'����','����','�����Ƶ����Ű�����','������','033-972-0438','soondae@hotmail.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (9,'��û','����','���ɼҾ����Ű�','���ɴ�','042-582-3952','soboro@nate.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (10,'��û','����','ȣ���ǿ�','��ٿ�','043-433-4333','lakecity@nate.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (11,'��û','õ��','��Ÿ��������а�','õ�Ȼ�','041-290-6821','hodoo@yahoo.co.kr');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (12,'����','����','�����������а�','��ȫ��','062-902-6729','pumpthisparty@nate.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (13,'����','����','�������̺���','������','063-673-5424','bibimbap@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (14,'����','����','�ϼ����ǿ�','�ϼ���','061-529-4230','drfrog@hanmail.net');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (15,'���','�뱸','�뱸ī�縯����','�踶����','053-554-1243','amen@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (16,'���','����','���Ѱ��ǿ�','���Ѱ�','054-455-1923','kstylez3@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (17,'���','����','����i-����','�̽¿�','054-728-1901','homerun@naver.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (18,'���','�λ�','�����������а�','�輮��','051-834-0042','sjkim@gmail.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (19,'���','���','���뺴��','���ֿ�','052-492-1820','sonata@hyundai.co.kr');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (20,'���','â��','�츮�����������а�','�Ȼ��','055-931-1818','bottlebomb@saenuri.com');
Insert into FB.COUNSELOR (HOSPID,REGION,COUNTRY,HOSPITAL,DOCTOR,PHONENUM,EMAIL) values (21,'����','����','�������ǿ�','������','064-583-9345','hanganggyo@nate.com');
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
