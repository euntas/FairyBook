--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-16-2017   
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
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (112,'test','강아지 한마리 입양했어요.','게시판ㅁㄻㄴ&lt;/p&gt;
&lt;p&gt;&nbsp;&lt;/p&gt;
&lt;p&gt;ㄴㅁㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹㄴ!!!',to_date('17/03/28 19:31:32','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (99,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:16','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (113,'ryan','맛있는 삼계탕집 추천해드릴게요. 애들도 맛있다고 좋아하네요.','asdfasdf',to_date('17/03/28 19:33:20','RR/MM/DD HH24:MI:SS'),2);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (101,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:17','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (102,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:17','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (103,'ryan','sampleT','sampleC',to_date('17/03/28 12:03:18','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (111,'aaa','애아빠가 요즘 많이 지쳤나봅니다...','sdfsdfsfsdfsdfdfsd',to_date('17/03/28 18:13:34','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (105,'ssss','주말에 아들래미랑 같이 촛불 들고 왔습니다.','sampleC',to_date('17/03/28 12:03:19','RR/MM/DD HH24:MI:SS'),3);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (106,'ryan','결국 탄핵됐네요!','sampleC',to_date('17/03/28 12:03:19','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (107,'abcdefg','병원에 다녀왔습니다...','sampleC',to_date('17/03/28 12:03:20','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (114,'iiii','곧 태어날 둘째의 이름으로 뭐가 좋을까요???','asdfasdf&lt;/p&gt;
&lt;p&gt;&nbsp;&lt;/p&gt;
&lt;p&gt;dsaf',to_date('17/03/28 19:34:29','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (109,'ryan','오늘 나온 정준일 신곡 들어보셨나요???','sampleC',to_date('17/03/28 12:03:21','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (110,'zzzz','페어리북 감사합니다~~ 번창하세요!','sampleCuuuu',to_date('17/03/28 12:03:22','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (115,'wwww','이 사이트 분석결과 소름돋게 정확하네요.','a',to_date('17/03/28 19:36:17','RR/MM/DD HH24:MI:SS'),2);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (116,'ryan','김 잘 굽는 방법이 있나요? 자꾸 태워먹어요ㅠㅜ','rtyurtu',to_date('17/03/28 19:37:01','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (123,'orion','애기 아빠랑 성시경 콘서트 다녀왔네요.','asdf',to_date('17/03/28 19:48:24','RR/MM/DD HH24:MI:SS'),10);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (181,'eunji','우리 아이가 전철을 너무 좋아해요','지하철을 하루에 세시간이나 타요',to_date('17/05/01 14:44:53','RR/MM/DD HH24:MI:SS'),4);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (119,'ssss','조던으로 패밀리슈 장만했습니다:)','a',to_date('17/03/28 19:39:20','RR/MM/DD HH24:MI:SS'),0);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (125,'eunji','은지가 처음으로 받아쓰기 100점을 받았어요!!!','근데 은지 26살임&nbsp;',to_date('17/03/28 19:49:45','RR/MM/DD HH24:MI:SS'),11);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (121,'iiii','둘째가 태어났어요. 축하해주세요!','asdfasdfasdf',to_date('17/03/28 19:42:52','RR/MM/DD HH24:MI:SS'),1);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (122,'hossang','ㅠㅠㅠㅠ','왜안돼?&lt;/p&gt;
&lt;p&gt;&nbsp;',to_date('17/03/28 19:43:43','RR/MM/DD HH24:MI:SS'),4);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (128,'wwww','아이가 오늘 친구랑 싸웠는데 맞고 왔네요.','태권도라도 가르쳐야 할까봐요... 너무 속상해서 마음이 찢어지네요. 얼마나 아팠을까',to_date('17/03/28 19:56:04','RR/MM/DD HH24:MI:SS'),9);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (138,'prodo','오늘 새로 가입했습니다. 잘부탁드려요~','강남사는 프로도 엄마예요!!',to_date('17/04/29 00:00:00','RR/MM/DD HH24:MI:SS'),10);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (130,'asda','홍대에 맛있는 찌개집을 발견했어요!','wert',to_date('17/03/28 19:56:25','RR/MM/DD HH24:MI:SS'),4);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (132,'orion','잠실에 소아전문으로 하는 치과 추천부탁드려요.','eryeryety',to_date('17/03/28 19:57:14','RR/MM/DD HH24:MI:SS'),6);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (135,'test','곧 야구가 개막하네요!!!','etu',to_date('17/03/28 19:59:26','RR/MM/DD HH24:MI:SS'),9);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (136,'ryan','이언이아빠랑 이언이랑 거제도에 다녀왔어요.','werywery',to_date('17/03/28 20:00:36','RR/MM/DD HH24:MI:SS'),8);
Insert into FB.PBOARD (BOARDNUM,ID,TITLE,CONTENT,INPUTDATE,HIT) values (137,'ryan','아이의 학습태도가 늘 불만입니다.','erty',to_date('17/03/28 20:01:10','RR/MM/DD HH24:MI:SS'),11);
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
