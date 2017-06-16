--------------------------------------------------------
--  ������ ������ - �ݿ���-6��-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PBOARD
--------------------------------------------------------

  CREATE TABLE "FB"."PBOARD" 
   (	"BOARDNUM" NUMBER, 
	"ID" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"INPUTDATE" DATE DEFAULT SYSDATE, 
	"HIT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into FB.PBOARD
SET DEFINE OFF;
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (1,'ryan','tt','ccc',to_date('17/03/27 12:16:35','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (2,'ryan','title','content',to_date('17/03/27 12:18:37','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (3,'ryan','title','content',to_date('17/03/27 12:18:51','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (4,'ryan','title','content',to_date('17/03/27 12:18:52','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (5,'ryan','title','content',to_date('17/03/27 12:18:53','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (6,'ryan','title','content',to_date('17/03/27 12:18:53','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (7,'ryan','title','content',to_date('17/03/27 12:18:54','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (8,'ryan','title','content',to_date('17/03/27 12:18:54','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (9,'ryan','title','content',to_date('17/03/27 12:18:54','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (10,'ryan','title','content',to_date('17/03/27 12:18:54','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (11,'ryan','title','content',to_date('17/03/27 12:18:54','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (12,'ryan','title','content',to_date('17/03/27 12:18:55','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (13,'ryan','title','content',to_date('17/03/27 12:18:55','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (14,'ryan','title','content',to_date('17/03/27 12:18:55','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (15,'ryan','title','content',to_date('17/03/27 12:18:55','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (16,'ryan','title','content',to_date('17/03/27 12:18:55','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (17,'ryan','title','content',to_date('17/03/27 12:18:56','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (18,'ryan','title','content',to_date('17/03/27 12:18:56','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (19,'ryan','title','content',to_date('17/03/27 12:18:56','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (20,'ryan','title','content',to_date('17/03/27 12:18:56','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (21,'ryan','title','content',to_date('17/03/27 12:18:57','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (22,'ryan','title','content',to_date('17/03/27 12:18:57','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (23,'ryan','title','content',to_date('17/03/27 12:18:57','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (24,'ryan','title','content',to_date('17/03/27 12:18:57','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (25,'ryan','title','content',to_date('17/03/27 12:18:58','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (26,'ryan','title','content',to_date('17/03/27 12:18:58','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (27,'ryan','title','content',to_date('17/03/27 12:18:58','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (28,'ryan','title','content',to_date('17/03/27 12:18:58','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (29,'ryan','title','content',to_date('17/03/27 12:18:59','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (30,'ryan','title','content',to_date('17/03/27 12:18:59','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (31,'ryan','title','content',to_date('17/03/27 12:18:59','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (32,'ryan','title','content',to_date('17/03/27 12:19:00','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (33,'ryan','title','content',to_date('17/03/27 12:19:00','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (34,'ryan','title','content',to_date('17/03/27 12:19:00','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (35,'ryan','title','content',to_date('17/03/27 12:19:01','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (36,'ryan','title','content',to_date('17/03/27 12:19:02','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (37,'ryan','title','content',to_date('17/03/27 12:19:02','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (38,'ryan','title','content',to_date('17/03/27 12:19:02','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (39,'ryan','title','content',to_date('17/03/27 12:19:03','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (40,'ryan','title','content',to_date('17/03/27 12:19:03','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (41,'ryan','title','content',to_date('17/03/27 12:19:03','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (61,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:33','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (62,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:35','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (63,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:37','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (64,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:38','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (65,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:38','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (66,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:38','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (67,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:39','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (68,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:39','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (69,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:39','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (70,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:39','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (71,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:40','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (72,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:40','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (73,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:40','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (74,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:40','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (75,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:41','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (76,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:41','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (77,'ryan','sampleT','sampleC',to_date('17/03/28 12:02:41','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (78,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:04','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (79,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:05','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (80,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:06','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (81,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:06','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (82,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:07','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (83,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:07','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (84,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:08','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (85,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:08','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (86,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:09','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (87,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:09','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (88,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:10','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (89,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:10','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (90,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:11','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (91,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:11','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (92,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:12','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (93,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:13','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (94,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:13','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (95,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:14','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (96,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:14','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (97,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:15','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (112,'test','������ �Ѹ��� �Ծ��߾��.','�Խ��Ǥ�����&lt;/p&gt;
&lt;p&gt;&nbsp;&lt;/p&gt;
&lt;p&gt;��������������������������!!!',to_date('17/03/28 19:31:32','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (99,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:16','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (113,'ryan','���ִ� ������� ��õ�ص帱�Կ�. �ֵ鵵 ���ִٰ� �����ϳ׿�.','asdfasdf',to_date('17/03/28 19:33:20','RR/MM/DD HH24:MI:SS'),2);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (101,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:17','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (102,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:17','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (103,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:18','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (111,'aaa','�־ƺ��� ���� ���� ���Ƴ����ϴ�...','sdfsdfsfsdfsdfdfsd',to_date('17/03/28 18:13:34','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (105,'ssss','�ָ��� �Ƶ鷡�̶� ���� �к� ��� �Խ��ϴ�.','sampleC',to_date('17/03/28 12:03:19','RR/MM/DD HH24:MI:SS'),3);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (106,'ryan','�ᱹ ź�ٵƳ׿�!','sampleC',to_date('17/03/28 12:03:19','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (107,'abcdefg','������ �ٳ�Խ��ϴ�...','sampleC',to_date('17/03/28 12:03:20','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (114,'iiii','�� �¾ ��°�� �̸����� ���� �������???','asdfasdf&lt;/p&gt;
&lt;p&gt;&nbsp;&lt;/p&gt;
&lt;p&gt;dsaf',to_date('17/03/28 19:34:29','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (109,'ryan','���� ���� ������ �Ű� ���̳���???','sampleC',to_date('17/03/28 12:03:21','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (110,'zzzz','���� �����մϴ�~~ ��â�ϼ���!','sampleCuuuu',to_date('17/03/28 12:03:22','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (115,'wwww','�� ����Ʈ �м���� �Ҹ����� ��Ȯ�ϳ׿�.','a',to_date('17/03/28 19:36:17','RR/MM/DD HH24:MI:SS'),2);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (116,'ryan','�� �� ���� ����� �ֳ���? �ڲ� �¿��Ծ��Ф�','rtyurtu',to_date('17/03/28 19:37:01','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (123,'orion','�ֱ� �ƺ��� ���ð� �ܼ�Ʈ �ٳ�Գ׿�.','asdf',to_date('17/03/28 19:48:24','RR/MM/DD HH24:MI:SS'),10);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (181,'eunji','�츮 ���̰� ��ö�� �ʹ� �����ؿ�','����ö�� �Ϸ翡 ���ð��̳� Ÿ��',to_date('17/05/01 14:44:53','RR/MM/DD HH24:MI:SS'),4);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (119,'ssss','�������� �йи��� �常�߽��ϴ�:)','a',to_date('17/03/28 19:39:20','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (125,'eunji','������ ó������ �޾ƾ��� 100���� �޾Ҿ��!!!','�ٵ� ���� 26����&nbsp;',to_date('17/03/28 19:49:45','RR/MM/DD HH24:MI:SS'),11);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (121,'iiii','��°�� �¾���. �������ּ���!','asdfasdfasdf',to_date('17/03/28 19:42:52','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (122,'hossang','�ФФФ�','�־ȵ�?&lt;/p&gt;
&lt;p&gt;&nbsp;',to_date('17/03/28 19:43:43','RR/MM/DD HH24:MI:SS'),4);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (128,'wwww','���̰� ���� ģ���� �ο��µ� �°� �Գ׿�.','�±ǵ��� �����ľ� �ұ����... �ʹ� �ӻ��ؼ� ������ �������׿�. �󸶳� ��������',to_date('17/03/28 19:56:04','RR/MM/DD HH24:MI:SS'),9);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (138,'prodo','���� ���� �����߽��ϴ�. �ߺ�Ź�����~','������� ���ε� ��������!!',to_date('17/04/29 00:00:00','RR/MM/DD HH24:MI:SS'),10);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (130,'asda','ȫ�뿡 ���ִ� ����� �߰��߾��!','wert',to_date('17/03/28 19:56:25','RR/MM/DD HH24:MI:SS'),4);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (132,'orion','��ǿ� �Ҿ��������� �ϴ� ġ�� ��õ��Ź�����.','eryeryety',to_date('17/03/28 19:57:14','RR/MM/DD HH24:MI:SS'),6);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (135,'test','�� �߱��� �����ϳ׿�!!!','etu',to_date('17/03/28 19:59:26','RR/MM/DD HH24:MI:SS'),9);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (136,'ryan','�̾��̾ƺ��� �̾��̶� �������� �ٳ�Ծ��.','werywery',to_date('17/03/28 20:00:36','RR/MM/DD HH24:MI:SS'),8);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (137,'ryan','������ �н��µ��� �� �Ҹ��Դϴ�.','erty',to_date('17/03/28 20:01:10','RR/MM/DD HH24:MI:SS'),11);
--------------------------------------------------------
--  DDL for Index SYS_C007314
--------------------------------------------------------

  CREATE UNIQUE INDEX "FB"."SYS_C007314" ON "FB"."PBOARD" ("BOARDNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table PBOARD
--------------------------------------------------------

  ALTER TABLE "FB"."PBOARD" ADD PRIMARY KEY ("BOARDNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FB"."PBOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FB"."PBOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "FB"."PBOARD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FB"."PBOARD" MODIFY ("BOARDNUM" NOT NULL ENABLE);
