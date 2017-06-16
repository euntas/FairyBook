--------------------------------------------------------
--  ������ ������ - �ݿ���-6��-16-2017   
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

   COMMENT ON COLUMN "FB"."QUIZ"."QUIZNUM" IS '���� ������ȣ';
   COMMENT ON COLUMN "FB"."QUIZ"."QUESTION" IS '���� ����';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT1" IS '����1';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT2" IS '����2';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT3" IS '����3';
   COMMENT ON COLUMN "FB"."QUIZ"."SELECT4" IS '����4';
   COMMENT ON COLUMN "FB"."QUIZ"."ANSWER" IS '��¥ ��';
REM INSERTING into FB.QUIZ
SET DEFINE OFF;
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (22,'�ƺ��� ����;�...','<img src="../resources/img/quiz/1.png" style="width:100px;height:100px;">','<img src="../resources/img/quiz/2.png" style="width:100px;height:100px;display:inline;">','<img src="../resources/img/quiz/3.png" style="width:100px;height:100px;">','<img src="../resources/img/quiz/4.png" style="width:100px;height:100px;display:inline;">',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (23,'������ �׷����� � ���̵��ϱ��?','ģ������ ���� ���̵�','�����ϰ� ������ ���̵�','Ȱ���ϰ� �������� ���̵�','å �д� ���� �����ϴ� ���̵�',-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (1,'������ ������ �����.','����','����','������','����',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (2,'100 - 60 = ?','10��','40��','50��','70��',2,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (3,'���׸��� ���� ����Ű�� ���̾�. ��Ȯ�� ǥ�Ⱑ ����?','������','������','������','������',4,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (4,'ª�� �ٴ��� 8�� 9 ���̸� ����Ű��, �� �ٴ��� 10�� ����Ű�� �־� ���� �� ������ �����.','8�� 10��','8�� 50��','9�� 10��','9�� 50��',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (5,'���� ������ ì�ܰ��� ������?','����������','�� ����','�ƺ� ����','�ƹ��͵� �������� �ʴ´�.',-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (6,'��ȭ�� ��¡�� �� ���� �̸��� ���纸��.','����','��ѱ�','���ٱ�','������',2,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (7,'�������� ���� �� ������ ��ϸ� ������?','����','���� �ʴ´�',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (8,'���ܸ��� ���� ���� ����?','��','�ƴϿ�',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (9,'���� ����� ����?','moon','sun','star','cloud',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (10,'���� ������?','��','�ƴϿ�',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (11,'9 �� 3 = ?','1��','2��','3��','4��',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (12,'�ҸӴ϶� ���� �췡?','��','�ƴϿ�',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (13,'9���� �󸶸� ���� 3�� �ɱ�?','2��','4��','6��','8��',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (14,'� ������ �ָ� ������ ����.','������������ ���࿡�� �ش�.','������ ���࿡�� �ش�.','�ƺ� ������ ���࿡�� �ش�.','�ƹ� �͵� ���� �ʴ´�.',-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (15,'���ϴٴ� ���� ���� �ܾ ����.','Dirty','Good','Strange','Bad',2,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (16,'û�Ҹ� �ϴµ� �ʿ� ���� ������ �����ϱ�?','��ġ','���ڷ�','�ɷ�','��������',1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (17,null,'���ٱ͸� ���δ�.','���� ���δ�.',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (18,'������ ��Ȳ�� ������ ��ȣ��?','SES','SBS','SOS','SCIT',3,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (19,'���� ���� �µ���?','70��','80��','90��','100��',4,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (20,null,'������ ����.','������ ���� �ʴ´�.',null,null,-1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (21,'���� �Ҿ������ �� ���� �ùٸ� ǥ����?','��Ű��','��Ÿ�','�����','���߸�',2,1);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (100,'�����׽�Ʈ�� �����Դϴ�.','�Ϲ�������','�̹�������','���������','���������',1,0);
Insert into FB.QUIZ (QUIZNUM,QUESTION,SELECT1,SELECT2,SELECT3,SELECT4,ANSWER,DIVISION) values (101,'�ι�° �׽�Ʈ�� �����Դϴ�.','�Ϲ��̴�','�̹��̴�','����̴�','����̴�',2,0);
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
