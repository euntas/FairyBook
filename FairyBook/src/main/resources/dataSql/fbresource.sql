--------------------------------------------------------
--  ������ ������ - �ݿ���-6��-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FBRESOURCE
--------------------------------------------------------

  CREATE TABLE "FB"."FBRESOURCE" 
   (	"RESOURCENUM" NUMBER, 
	"NAME" VARCHAR2(100 BYTE), 
	"ANALYSIS" VARCHAR2(1000 BYTE), 
	"PATH" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "FB"."FBRESOURCE"."RESOURCENUM" IS '�ڷ� ���� ��ȣ';
   COMMENT ON COLUMN "FB"."FBRESOURCE"."NAME" IS '�ڷ� �̸�';
   COMMENT ON COLUMN "FB"."FBRESOURCE"."ANALYSIS" IS '�ڷ� �м� �ؽ�Ʈ';
   COMMENT ON COLUMN "FB"."FBRESOURCE"."PATH" IS '�̹��� ���� ���';
REM INSERTING into FB.FBRESOURCE
SET DEFINE OFF;
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (4,'hair01','�̼������̳� ����� Ȥ�� �ڽŰ��� �Ῡ �� �ڱ� ���ϸ� ��Ÿ�� �� �ֽ��ϴ�.','../resources/img/avatar/hair/hair01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (5,'hair02','�̼������̳� ����� Ȥ�� �ڽŰ��� �Ῡ �� �ڱ� ���ϸ� ��Ÿ�� �� �ֽ��ϴ�.','../resources/img/avatar/hair/hair02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (6,'eye01','���� ũ�� ���� ���ٴ� �Ͱ� �ϸƻ����մϴ�. ������ ����ϰų� �ҾȰ��� ���� ����� ���� ū ��찡 �����ϴ�. Ȥ�� ���� �۴ٰ� � ���� ����̶�� ū ���� ���� �������� ���� ���� ũ�� �׸� ���� �ֽ��ϴ�.','../resources/img/avatar/eye/eye01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (7,'nose01','��̵��� �׸��� ��ȭó�� �׸��Ƿ� �ڸ� �����ϰ� �׸��� ��찡 �����ϴ�. 
������ �ڸ� ��ü������ �׸� ��쿡�� ���� ���� ���ɼ��� �����ؾ� �� ���Դϴ�.','../resources/img/avatar/nose/nose01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (8,'mouth01','�� ������ �����ϴ�. ��, �� ��ü�� ������ ǥ���ε� �Ը� ���� �ִٸ�, 
� ������ ū ����� ����� �ְų� �����ϰ��� �ϴ� �屸�� �ִٰ� �� �� �ֽ��ϴ�. 
','../resources/img/avatar/mouth/mouth01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (9,'ear01','��� ���� �ʴٴ� �ǹ̷� �ؼ��� �� ������, �����̳� �� �Ӹ��� ��ȣ�ϴ� ������ ��� 
�Ӹ�ī���� �͸� ���� �׷ȴٸ� �ڿ������� ���̴� ū �ǹ̸� ������ �ʽ��ϴ�. 
���� �� �Ӹ����� ���� �͸� ����Ǿ� �ִٸ� ���� ������ �򰡸� ������ �մϴ�. ','../resources/img/avatar/ear/ear01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (11,'body01','ù���� ���̴�','../resources/img/avatar/body/body01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (62,'hair03','�Ӹ�ī���� �����Ǿ� ������ ����ϰ� �����Ǿ� �ִٸ� �ܸ� �ڽ��� �ְų� 
�Ƹ��ٿ��� �߱��ϴ� ������ ���Դϴ�.','../resources/img/avatar/hair/hair03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (21,'eye02','���� �ƹ��� �۴� �ϴ��� ��� ���� �� �� �ֵ���, ������ ������ ���ٺ�������� �ܺο� �ڽ��� �����̰� ������ �ʴٴ� ���� �ǹ��մϴ�. ','../resources/img/avatar/eye/eye02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (22,'eye03','����Ǯ, ����, �Ӵ��� ���� �ڽ��� ���õʰ� �������� ��Ÿ������ �������� �� �� �ֽ��ϴ�.
','../resources/img/avatar/eye/eye03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (42,'roof02','������ ����ġ�� ũ�� �׷ȴٸ� ������ �������� ������� ������ �ھƿ� ���� �ν��� ���� ���� ������� ����� �ڱ� ������ �������Դϴ�.','../resources/img/house/roof/roof02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (43,'door01','���ΰ��踦 �� �����ϰ� ������ �������� �źΰ��̳� �η����� ���� �� �ֽ��ϴ�. Ÿ���� �ٰ����� ���� �ηƱ⵵ �ϰ� ��ȸ���� ���谡 ����Ǿ� �ְų� ���ΰ��� �ɷ��� ������ ��찡 �����ϴ�.','../resources/img/house/door/door01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (48,'wall01','��01','../resources/img/house/wall/wall01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (63,'hair04','�Ӹ�ī���� �����Ǿ� ������ ����ϰ� �����Ǿ� �ִٸ� �ܸ� �ڽ��� �ְų� 
�Ƹ��ٿ��� �߱��ϴ� ������ ���Դϴ�.','../resources/img/avatar/hair/hair04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (64,'yard01','ǳ���� ���Ÿ� �ΰ� ���� �屸�� ���Դϴ�. ���� ���Ŵ� ������ ���� ������ ���� ���ų� ����� ���� ���δٸ�, ����� ������ ���������� ��� ������ �ؾ� �� �� �𸣴� ���� ����� ��ǥ�� ����� ���� �� �ֽ��ϴ�. ������ ��ȹ�̳� ������ ǳ���� ������ ���� �� ������ �ʾƼ� �߱��� �͵��� �̷��� ���ϰ� ������ ���ɼ��� �ֽ��ϴ�. ','../resources/img/house/yard/yard01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (65,'yard02','����� �׸���� ���� �� ��ȭ ĳ���͸� �׸��� ����� ���� �ɸ��Դϴ�. 
ũ�������� Ʈ���� ���� Ư�� ������ �ڽ��� ���� ���� ������ ��� �ǹ̰� �ִ��� �ľ��غ��� ���� �ʿ��մϴ�. 
���� �׸��� �׸� ���̿��� ������� �� �� ������ ���� ������� ����Ѵٸ�, 
���� �ڽ��� �����̳� ������ ���� ���·� �ƹ� ������ �ް� ���� ���� ������ü�� �ٽ� �¾�� �ʹٴ� ���� 
�ǹ��ϱ⵵ �մϴ�. ����������� ��û�� ������/��ü�� Ʈ��츶�� �Ծ��ų� ������ �԰� �ִ� ���ź������¸� 
�ǹ��� �� �����Ƿ� ���� �����򰡿� ġ�ᰡ �ʿ��մϴ�.','../resources/img/house/yard/yard02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (66,'yard04','�ܼ��� ���־� ���� �̷� ������ �׸� ���� �ְ����� �ſ� �ɰ��� �ɸ��� ��Ȳ�Դϴ�. 
������, �������� �����ϰ� �ǿ��� ��� ��ǵ� ������ �����̹Ƿ� ġ�ᰡ �ʿ��մϴ�. ','../resources/img/house/yard/yard04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (67,'yard05','���Ű� �������� �������� ���� �ڿ������� �翬�� ���Դϴ�. ������ �Ƶ��� �ɸ��ľǿ� �־�� �� ���Ÿ� ���� ��Ȯ�� �����İ� �� �߿��� �����̱� ������ �ڳ�� ���� ��ȭ�� ������ô� ���� �����մϴ�. �ϰ������� ������ ǥ���� ���� �������� ��ó�� ���� ¡�ķ� ���� ��쵵 �ֽ��ϴ�.','../resources/img/house/yard/yard05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (68,'yard06','�׸��� �پ缺�� �ִٰ� Ī�����ְ� ������ �ſ� �������� ����, ��, ���� ������� �� �� �ֽ��ϴ�. 
�̷� ��� ���ϼ��� �ƴ� ��ȣ �ж��� �и� Ȥ�� �������� ������ �����ϰų� �׷� ��Ȳ�� ������ �ǹ��մϴ�. 
ȭ�պ��ٴ� �浹�� ������ �켱������ �߱��ϴ� �ɸ��� ���¸� ���ϰ� �ֽ��ϴ�. ','../resources/img/house/yard/yard06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (69,'yard07','������ ���� �ɷ��� ���������δ� �ǹ̰� ������ �𸣳� �Ϲ����� �׸���㿡���� �����̰ų� 
�������̳� �Ắ���� ������ �Ͻ��մϴ�. ������ �Ÿ����� ����ϰ� ���� �׸� ������ �ƴ϶� ������, 
�����ϴ� ����̶���� �ֺ��������� ���迡 �־� ���������� ���� ���� �ֽ��ϴ�.','../resources/img/house/yard/yard07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (70,'yard08','���峪�� Ư¡�� ������ �Ʒ��� ó���־� ���� �������� ������� ���� �η����ϰ�,
 ���ſ� ���� �̷ð� ������ ������ ���ϴ� ������ ���� �� �ֽ��ϴ�. 
���� ���������� ������ �� ���峪�� �׸��� �׷ȴٸ� �ſ� ū �η��� �۽ο� �ְų� 
���Ǻ��� ������ ��� ���ɼ��� �����ϴ�. ���������� ������ �߰ߵ˴ϴ�.','../resources/img/house/yard/yard08.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (49,'storyNum1selection00','������','../resources/img/etc/story1/selection00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (50,'storyNum1selection01','1������','../resources/img/etc/story1/selection01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (51,'storyNum1selection02','2������','../resources/img/etc/story1/selection02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (52,'storyNum1selection03','3������','../resources/img/etc/story1/selection03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (53,'storyNum1selection04','4������','../resources/img/etc/story1/selection04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (54,'storyNum1selection05','5������','../resources/img/etc/story1/selection05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (55,'storyNum1selection06','6������','../resources/img/etc/story1/selection06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (56,'storyNum1selection07','7������','../resources/img/etc/story1/selection07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (57,'storyNum1selection08','8������','../resources/img/etc/story1/selection08.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (58,'storyNum1selection09','9������','../resources/img/etc/story1/selection09.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (59,'storyNum1selection10','10������','../resources/img/etc/story1/selection10.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (60,'storyNum1selection11','11������','../resources/img/etc/story1/selection11.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (61,'storyNum1selection12','12������','../resources/img/etc/story1/selection12.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (71,'nose02','���� �Ϻκи� �׷ȱ� ������ �۾� ���̴� ���� �ƴ϶� �Ϻ��� ���� ��ü ����� �� ũ�⿡ ���� 
��ô �۰� �׷ȴٸ� ������ ���� ��Ÿ���ϴ�.','../resources/img/avatar/nose/nose02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (72,'mouth02','�������� �� �������� �Ҹ����� ��Ÿ���� ���� ���� �����δ� ��Ӵ��� �� �ۿ��� ���� �� ���� ������ 
���������� ��Ÿ�� ���� �ֽ��ϴ�.','../resources/img/avatar/mouth/mouth02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (73,'mouth03','�ڼ������� �������� �̴� �ڽ��� �����̰� ���� �屸�� ��Ÿ���ϴ�. ������ �龦�����ϰų� 
��ī�ο� ��� ����� ġ�Ƹ� �׷ȴٸ� ���� ���ݽ��� ǥ���Դϴ�. �� ��쿡 ��� �׸��� 
�ڽ��� �ƴ� �ٸ� ����� ��� �ڽ��� �����ϴ� �ι��� �ǹ��մϴ�.','../resources/img/avatar/mouth/mouth03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (74,'mouth04','�Լ��� ������ �׸�ŭ �� �λ��� ��Ȥ�� ���̸� ���� ���� ����� �Ͻ��� �� �� ������, 
��ġ ���۸� ���� ���� ����� �ϰ� �����Ƿ� ���ϱ� �ȴٴ� �ǹ̸� ���� ���� �ֽ��ϴ�. ','../resources/img/avatar/mouth/mouth04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (75,'mouth05','������ ��� ū ���� ����ģ ���� �屸�� �ؼ��ϴ� ��찡 �����ϴ�. �׷��� �Ƶ��� ����  �ܼ��� 
�ڽ��� ���� ���ٰ� �����ϰų� �谡 �����ٴ� �Ϲ����� ���¸� ��¡�� ���� �ֽ��ϴ�.','../resources/img/avatar/mouth/mouth05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (83,'face06','���������� �ڱ� ��ġ���� ������ �ִ� ����, �� �׷��� �׷ȴ��� �ľ��غ��� �մϴ�. ��Ȥ ���� �� �Ӹ� ���� ������ ����� ������ ���� ���� �ֽ��ϴ�.','../resources/img/avatar/face/face06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (78,'hair05','�Ӹ�ī���� �����Ǿ� ������ ����ϰ� �����Ǿ� �ִٸ� �ܸ� �ڽ��� �ְų� �Ƹ��ٿ��� �߱��ϴ� ������ ���Դϴ�.','../resources/img/avatar/hair/hair05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (79,'hair06','�Ӹ�ī���� �����Ǿ� ������ ����ϰ� �����Ǿ� �ִٸ� �ܸ� �ڽ��� �ְų� 
�Ƹ��ٿ��� �߱��ϴ� ������ ���Դϴ�.','../resources/img/avatar/hair/hair06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (80,'hair07','�Ӹ�ī���� �����Ǿ� ������ �Ӹ��� �������� ���̶�� �������� ���� ���¸� �ǹ��� �� �ֽ��ϴ�. ','../resources/img/avatar/hair/hair07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (81,'face04','���������� �ڱ� ��ġ���� ������ �ִ� ����, �� �׷��� �׷ȴ��� �ľ��غ��� �մϴ�. ��Ȥ ���� �� �Ӹ� ���� ������ ����� ������ ���� ���� �ֽ��ϴ�.','../resources/img/avatar/face/face04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (85,'body02','��2','../resources/img/avatar/body/body02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (86,'body03','��3','../resources/img/avatar/body/body03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (87,'body04','��4','../resources/img/avatar/body/body04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (88,'body05','��5','../resources/img/avatar/body/body05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (89,'body06','��6','../resources/img/avatar/body/body06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (90,'body07','��7','../resources/img/avatar/body/body07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (93,'ear04','��� ���� ��������� �߿��ϰ� �������� ���� ����� �� ������, ������������ ��Ÿ�� ���� �ֽ��ϴ�.','../resources/img/avatar/ear/ear04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (94,'ear05','��� ���� ��������� �߿��ϰ� �������� ���� ����� �� ������, ������������ ��Ÿ�� ���� �ֽ��ϴ�.','../resources/img/avatar/ear/ear05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (95,'ear06','���� ��, ��, �� �� �ٸ� ���� ����� ũ��� ���̰� �ִ����� ���ؾ� �մϴ�. ���� �Ӹ��� �󱼿� ���� �ʹ� ũ�ٸ� ������ ¡�ĸ� ��Ÿ���� ���� �� �ֽ��ϴ�. �ƴϸ� û���� ������ ������ ��쿡�� �͸� ũ�� �׸� �� ������ �ڳ��� û�¿� ���� �˻絵 ���ݵǾ�� �� ���Դϴ�.','../resources/img/avatar/ear/ear06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (96,'ear07','���� ��, ��, �� �� �ٸ� ���� ����� ũ��� ���̰� �ִ����� ���ؾ� �մϴ�. ���� �Ӹ��� �󱼿� ���� �ʹ� ũ�ٸ� ������ ¡�ĸ� ��Ÿ���� ���� �� �ֽ��ϴ�. �ƴϸ� û���� ������ ������ ��쿡�� �͸� ũ�� �׸� �� ������ �ڳ��� û�¿� ���� �˻絵 ���ݵǾ�� �� ���Դϴ�.','../resources/img/avatar/ear/ear07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (97,'eye04','���� ���� ���� ���������� ���ɽ����� �����̸�, �ڽ��� �����Ű�� �����鼭 ������� ������ �����Ϸ��� ������ ��Ÿ���ϴ�. ���δ� ��ũ�� �ϰų� ���� ���� ���� ���� �Ͱ� ���� �ͻ콺���� ���� �峭������ �׷ȴٰ� �ص� �ڽ��� �� �κ��� ����� ���� �ൿ�̶�� �� �� �ֽ��ϴ�.','../resources/img/avatar/eye/eye04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (98,'eye05','���� ���� ���� ���������� ���ɽ����� �����̸�, �ڽ��� �����Ű�� �����鼭 ������� ������ �����Ϸ��� ������ ��Ÿ���ϴ�. ���δ� ��ũ�� �ϰų� ���� ���� ���� ���� �Ͱ� ���� �ͻ콺���� ���� �峭������ �׷ȴٰ� �ص� �ڽ��� �� �κ��� ����� ���� �ൿ�̶�� �� �� �ֽ��ϴ�.','../resources/img/avatar/eye/eye05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (99,'eye06','������ �Ϻκи��� ���ų� �ڽ��� �Ϻκи��� ��Ÿ���� �ʹٴ� �ǹ̰� �ֽ��ϴ�. Ȥ�� �ð���ֳ� �÷¹��� ���� ��ü �����͵� ���õǾ� ���� �� �ֽ��ϴ�.','../resources/img/avatar/eye/eye06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (101,'chimney03','���ҿ��� ���Ⱑ ���� ����� �����̳� �����Կ� ���� ������ �屸�� ������ ���̰��� ��Ÿ���� ��찡 �����ϴ�. 
','../resources/img/house/chimney/chimney03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (103,'chimney00','���Ҿ���','../resources/img/house/chimney/chimney00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (104,'door03','���� �ʹ� ũ�� �׷ȴٸ� ��ȸ���� �򰡿� ����ġ�� �����ϰ� �ְų� Ÿ�ΰ��� ���� ������ ����ġ�� ������ �δ� ������ �ֽ��ϴ�. ','../resources/img/house/door/door03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (105,'door04','������ ����� ���̴� �� �� ���� ������ ���Դϴ�. Ÿ�ΰ� ģ������ ������ �� ���� ������ �������ϴ� �簡������ ���� �� ������, �������� �ƴ� �������� ������� �ܺ��ε��� ������ ���� �ֽ��ϴ�.
','../resources/img/house/door/door04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (106,'door05','�� ���� �� �ٸ� ���� �׷ȴٸ� ������� ������ ������ �ϰų� �ٸ� ��� ����� �����ϰ� ���� �Ҹ��� ��Ÿ���⵵ �մϴ�.','../resources/img/house/door/door05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (107,'door00','���� �׸��� �ʾҴٸ� �ٸ� ����� �ڽ��� � ������ �Ͱ� ������ ���� ������ ���ư��� �Ϳ� ���� �Ҿ��� �����ٴ� ¡���Դϴ�. �ڱ⸸�� ���迡 ���� ��츦 ���մϴ�.','../resources/img/house/door/door00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (108,'window02','â���� �ſ� ���� �ִٸ� �ڽ��� ���� ���ٺ� �� ������ Ÿ���� �� ���� ���� ����� ���Դϴ�. ���� �̷��� ������ ���ر׸��� �ڽ��� ����� ���߰� �;��ϰų� ������ ������ ��Ÿ�� ���� �ֽ��ϴ�. ','../resources/img/house/window/window02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (110,'window04','���ݺ��� ������ ������ �޲ٰ� �ְų�, ������ ����ó�� ����ϰ� ������ �ִٴ� ���� �ǹ��մϴ�.','../resources/img/house/window/window04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (111,'window00','���� �ڽ��� �� ���� ���� �͵� ������, ������ �ڽŵ� �ٱ��� ���ٺ� �� ���� �����Դϴ�. ���� �ٱ� ���� ������ ���ٶ�� ��� ������ ������ �׸��Դϴ�. â���� �׸������� �Ƶ��� �밳 �ڽ��� �巯���� �ʰ� ���� ���� ȸ���ϴ� �µ��� ���Դϴ�.','../resources/img/house/window/window00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (112,'nose03','�ǿܷ� �������̳� �η����� ���� ����Դϴ�. �ڿ��� �̹��� �ɸ��� ���õ� ������ ���� ���ԵǹǷ� ����� ���� ������ �� �ʿ䰡 ���� ���Դϴ�.','../resources/img/avatar/nose/nose03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (109,'window03','���� ���� â���� ������ ������ ���� ���� �����ϰ� ���� ����̸�, â���� ���Ƽ� �������� ���ó�� ������������ �ݴ�� �ڽ��� ������ ���� ������ ������ �����̹��ø� �����ϴ� ����Դϴ�. �Ǵ� �̷���? ������? ���� �������� ���ϴ� �簡������ ���� ����� �� �ֽ��ϴ�.','../resources/img/house/window/window03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (100,'chimney02','���� ���� ��ü�� ũ�� ������ ���� ������, ���̸� �ʹ� �ڼ��� �׷ȴٸ� �������� ������ ������ ���� Ȯ���� �����ϴ�. Ư�� �������� ������ ������ ���� ���迡 ���� ������ ���� �� �ֽ��ϴ�. ','../resources/img/house/chimney/chimney02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (102,'chimney04','���ҿ��� ���Ⱑ ���� ����� �����̳� �����Կ� ���� ������ �屸�� ������ ���̰��� ��Ÿ���� ��찡 �����ϴ�.���� ���� ��ü�� ũ�� ������ ���� ������, ���̸� �ʹ� �ڼ��� �׷ȴٸ� �������� ������ ������ ���� Ȯ���� �����ϴ�. Ư�� �������� ������ ������ ���� ���迡 ���� ������ ���� �� �ֽ��ϴ�. ','../resources/img/house/chimney/chimney04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (92,'ear03','�Ͱ��̴� �����θ� �ٹ̱� �����ϴ� �����̳� �ڱ���ÿ��� ��Ÿ���ϴ�. ����� �� �ٸ� �Ǽ��縮���� �׸� ��쵵 ���������Դϴ�.','../resources/img/avatar/ear/ear03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (91,'ear02','�ʹ� ������ ���� ��� ������ �����ν�, ����� �͸� �׷ȴ������� ������ ��Ī�� �̷������ �� ���캸�ƾ� �� ���Դϴ�. ��Ī�� �ƴ϶�� �� �� ������ �򰡰� �ʿ��մϴ�.','../resources/img/avatar/ear/ear02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (82,'face05','�Ӹ��� �� ����� ��ü���� ��Ÿ���� �߿��� ����Դϴ�. �Ӹ��� ũ�� �׸��� ���� �ڽ��� �������̳� ������� ��Ÿ������, �Ƶ��� ��� �Ϲ������� �Ӹ��� ũ�� �׸��� ��찡 �����Ƿ� ū �ǹ̸� ������ �ʽ��ϴ�.','../resources/img/avatar/face/face05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (84,'face07','�Ӹ��� �� ����� ��ü���� ��Ÿ���� �߿��� ����Դϴ�. �Ӹ��� ũ�� �׸��� ���� �ڽ��� �������̳� ������� ��Ÿ������, �Ƶ��� ��� �Ϲ������� �Ӹ��� ũ�� �׸��� ��찡 �����Ƿ� ū �ǹ̸� ������ �ʽ��ϴ�.','../resources/img/avatar/face/face07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (41,'roof01','������ ������� ġ�� �Ӹ��� �ش��ϴ� �κ�����, ���� �ڽſ� ���� �����̳� ����� ���� �ھƿ� �������� ��Ÿ���ϴ�. ������ ����ġ�� �����ϰ� �׸��ų�, �����ؼ� �׸��� ���� ����, ��� �� ������ ������ ��Ÿ�� �� �����Ƿ� ���̰� ���� �׸� �� ������ ���캼 �ʿ䰡 ���� ���Դϴ�.','../resources/img/house/roof/roof01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (44,'door02','������ ���� �ٸ��̰� �ڽ��� � �������� ����ϴ� �Ͱ� ���ÿ� �ڽ��� ����� ������ ��θ� �ǹ��մϴ�. �� �׸��� ���� ���ΰ��迡 �־ �Ҿ����̳� �η����� ������, ������ ������ �ǰ��� �Ƿ��ϴ� �Ϳ� ���� �������� �ִ��� ���� �˾ƺ� �� �ֽ��ϴ�. ũ�Ⱑ �����ϰ� �����̰� �޸� ���̶�� ������ ��Ÿ���� Ư���� ������ ������ ����Դϴ�.','../resources/img/house/door/door02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (45,'window01','â���� �ٸ� ȯ���̳� Ÿ�ΰ��� ��ȣ�ۿ��� �� �� �ִ� �ɷ°�, �װ��� ���� ������ ������ ������� ������ �ֽ��ϴ�. ����ϰ� �׷��� â���� �������̰� ������ ��ȸ���� �ǹ��մϴ�. ','../resources/img/house/window/window01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (46,'chimney01','������ ������ ���ʹ� �޸� �츮���󿡼� ���� ã�ƺ� �� ���� ������ ������ ������ Ư���� �ǹ̸� �������� �ʽ��ϴ�. ������ �׷ȴٸ� ������ ���� �Ƶ��� �����ϴ� �������� ����� ������ �����⿡ ���� ������ ���� ���� �ֽ��ϴ�.','../resources/img/house/chimney/chimney01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (113,'ISTJ','���� ��ǿ� ���Ͽ� ��Ȯ�ϰ� ü�������� ����ϸ� ��ó���� �����ϸ� å�Ӱ��� ���մϴ�. 
���� ���� : ȸ��, ����, ����, ����, �Ƿ�, �繫��, ������ ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (114,'ISTP','���� ������ ���������� �λ��� �����ϴ� ���̰� �ʿ� �̻����δ� �ڽ��� �������� �ʽ��ϴ�. ���� ���� : ����, ����, ������, �Ǹ���� �о� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (115,'ESTP','������̰� �����ϸ� �������̰� ����̳� �Ͽ� ���� ���԰��� ���� �����ϴ�. ���� ���� : �ǻ�, ����, �˻�, ������, ��� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (116,'ESTJ','�������̰� ���ǰ��� �پ�� ���� �����ϰ� ��ȹ�Ͽ� ������Ű�� �ɷ��� �ֽ��ϴ�. ���� ���� : �����, ��������, ������� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (117,'ISFJ','å�Ӱ��� ���ϰ� �������̸� ������̰� ħ���ϸ� �γ����� ���մϴ�. ���� ���� : �Ƿ�, ��ȣ, ����, �繫��, ��ȸ��� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (118,'ISFP','������ �����ϰ� ���оȰ��� ���� ������Ʈó�� �Ӹ����� �����ϰ� ģ���մϴ�. ���� ���� : ����濵, ����, ��ȣ��, ���� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (119,'ESFP','�������̰� �������̸� ģ���մϴ�. � ��Ȳ�̵� �� �����ϸ� ������� ���ϰ� �米���Դϴ�. ���� ���� : �Ƿ� �Ǹ�, ����, ��ȣ��, ���� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (120,'ESFJ','�������� ���� �ٸ� ������� ������ ������ ��ȭ�� �߽��մϴ�. ����ְ� ���� ģ���մϴ�. ���� ���� : ����, ����, �Ǹ�, ��ȣ, �Ƿ� �о� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (121,'INFJ','â�Ƿ�, �������� �پ�� ���� ���������� ������ Ÿ�ο��� ������� ��Ĩ�ϴ�. ���� ���� : ����, �ɸ�ġ��� ���, ������ ���� �о� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (122,'INFP','������ �����ϰ� �����ϸ� �ڽ��� �����ϴ� �Ͽ� ���Ͽ� å�Ӱ��� ���ϰ� �����մϴ�. ���� �о� : ���, �й�, ����, ��� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (123,'ENFP','�������̰� â�����̸� �׻� ���ο� ���ɼ��� ã�� �õ��մϴ�. ���� ���� : ���, ����, ���θ���Ʈ, ����, �Ǹ�, �۰� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (124,'ENFJ','��ø�ϰ� �������� ���� �米���̸� ��ȭ�� �߿���ϰ� �������� �����ϴ�. ���� ���� : ����, ����, �ɸ����, ����, ���� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (125,'INTJ','�ൿ�� ��� �־ ��â���̸� ���� �����°� ������ ��ܷ�, �γ����� �ֽ��ϴ�. ���� ���� : ����, �����Ͼ, �߸�, ��ġ, ö�� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (126,'INTP','�����ϳ� ������ �ִ� �о߿� ���ؼ��� ���� ���ϸ� ���ذ� ������ ���� ���������� �����ϴ� ��ɰ� ���� ȣ����� �����ϴ�. ���� ���� : ��������, ����, ����, �����Ͼ, ����, ö��, �ɸ��� ���� �й�',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (127,'ENTP','��â���̸� â�Ƿ��� ǳ���ϰ� ���� �ȸ��� ���� ������ �ٹ�鿡 ����� �����ϴ�. ���� ���� : �߸�, ������, ���, ������, ��ǻ�� �м� ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (128,'ENTJ','Ȱ�����̰� �����ϸ� �����°� ��ַ��� �ְ� ����� ��ȹ�� �Ž��� �ȸ��� ��ȣ�մϴ�. ���� ���� : �Ǹž�, �����, ����, ����, ������ ��',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (129,'E','[E ���⼺]<br>
1. �������� ������ ���� �� ���� ��´�.
<br>
2. ģ�� ģ������ ���� �ƴ� ģ���鵵 ����.<br>
3. Ȱ���ϰ� �ǿ������� ������ ���̴�.<br>
4. �ֺ����� �Ͼ�� �Ͽ� ������ ����. <br>
5. �̰����� ���ο� ���� �ϴ� �� ����ִ�.<br>
6. Ȱ���ϰ� �������̶�� ���� ���� ��´�. <br>
7. ��ǥ�ϴ� �� �۾��⺸�� ����.<br>
8. �� ������ �ϴٺ��� ���� �ȴ�.<br>
9. ������� �� ����� �� �ƴ� �� ����.<br>
10. ���� ���� ���� ���� ���� ���� �����Ѵ�.',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (130,'I','[I ���⼺]<br>
1. �������� ������ ���� �� ���� ��´�.<br>
2. ���� ���� ģ���� ���� ��ϴ�.<br>
3. �����ϰ� ������ ���� �ȴ�.<br>
4. ȥ�� ������ ������ ��� ���� �ִ�.<br>
5. ������ �� ���� �����ϴ� �� ����.<br>
6. �����ϰ� ħ���ϴٴ� ���� ��� ���̴�.<br>
7. �����ٴ� �۷� ���� ���� �� ���ϴ�.<br>
8. Ȯ���ϰ� �˱� �������� �ൿ���� �ʴ´�.<br>
9. ���� ���� �� �������� ���ϴ� �� ����.<br>
10. ���� ����ƾ߸� ����Ѵ�.',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (131,'S','[S ������]<br>
1. ����, ���, ������, �������鼭 �����Ѵ�. <br>
2. ���� ���տ��� ���� ��ó�� �ڼ��ϰ� �������ָ� ���ذ� �ߵȴ�. <br>
3. ������� ������� Ư¡�� ���� �� �ڴ�. <br>
4. ���� ������ ������ �� ���� �� ����. <br>
5. �Ĳ��ϰ� ���� �س� �� �ִ�. <br>
6. �����ٴ� ������ �� ���� ������ ��ü���� ���  �ϳ��ϳ����� �ڼ��ϰ� ����Ѵ�. <br>
7. ���ο� ���� ������ �ͺ��� �̹� �ִ� ����  ���� �ٲٴ� �� �� ����. <br>
8. �ѹ� ������ ���� ���� ���� �ʹ�. <br>
9. ���ο� ������ٴ� ���� �ϴ� ��� �����ϴ� ���� ���ϴ�. <br>
10. ���縦 ����� ��� �� �̷��� �޺��� �� �߿��ϴ�. <br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (132,'N','[N ������]<br>
1. ������ �˾ư� �� �����ӿ� ����ó�� ���İ���   ������ ������ �� �ִ�.<br>
2. ��� ���� �̾߱⸦ �� ����� ����.<br>
3. ���� ������ �Ҿ���� ���� �ִ�.<br>
4. ������ ���� ������ ǳ���ϴ�.<br>
5. �ؾ� �� ���� �ܼ��� �س���.<br>
6. �������ٴ� ���� ���� ��ü�� ���� �� �ľ��Ѵ�.  <br>
7. �̰����� ������ ���� �ؼ� ���ο� ���� ����� ���� ���̴�.<br>
8. ���ο� �ϵ��� �ڲ� ������ �� ����ִ�.<br>
9. �̷��� ���� ����ϴ� �ϵ��� ���� �̰����� �ϰ� ���� �� ����.<br>
10. �̷��� ���ɼ��� �����ϴ� ���� ���縦 ��� �ͺ��� �� �ǹ� �ִ�.  <br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (133,'T','[T �����]<br>
1. �����ϰ� �Ǵ��� �� �ڽ��� �˰� �ִ� ����� �߽����� �����Ѵ�.<br>
2. ���� �ƴ� ���� ��Ȯ������ ������ ������.<br>
3. ������ ���Ⱑ ���� ���̴�.<br>
4. �ߴ��� �¾Ƶ� ������ �� ������ �ʴ´�.<br>
5. �������� ���� ���� ������ �а� ������ ���̴�. <br>
6. ���´�, Ʋ���١���� ���� ���� �Ѵ�.<br>
7. ���� ���� ����� �Ĳ��ϰ� ���캸�� ���̴�.<br>
8. ��Ģ�� ��Ģ�� �������� ������ ���ϴ�.<br>
9. �������� �����Ͽ� ģ������ �����ϴ� ���̴�.  <br>
10. �� ���� ��ü������ ������ ��� �ϸ� ���� �� �� �� ����� �����Ѵ�. <br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (134,'F','[F ������]<br>
1. ������ �� ������� ���踦 ���� �����ϸ� �Ǵ��Ѵ�.<br>
2. ���� ������� ���� �ִ� ������ ���ɴ�.<br>
3. ������ ǳ���ϰ� ������ ���� ���̴�.<br>
4. ������ ������ �������� ���´�.<br>
5. �ٸ� ������� �ڽſ� ���� ��� �����ϴ���   �Ű��� ���δ�.<br>
6. ������, ���ڴ١���� ���� ���� �Ѵ�.<br>
7. ���� ������ �ִ� �ǹ̸� ���ǰ� �ֺ� �������  ���迡 �Ű��� ����.<br>
8. ��Ȳ�� ���� ��Ģ�� ��Ģ�� ���� �� �ִ�.<br>
9. ģ���� ������ ������ ȣ���Ͽ� ������ �����̴� ���̴�.<br>
10. �纸�� ���ϰ� ���� ���Ͱ��� ���� �ϴ� ���� �����ϴ� ���̴�.<br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (135,'J','[J �Ǵ���]<br>
1. ��ȹ�� ����� ���� ��õ�ϴ� ���̴�.<br>
2. �ؾ� �� ���� ���� ������ ��ġ�� ���̴�.<br>
3. �� ���� ���� ������ ���� ����Ѵ�.<br>
4. �ð��� �˹��ϰ�  ���ϴ� ���� �Ⱦ��Ѵ�.<br>
5. ������ ������ ���¸� ��ȣ�Ѵ�.<br>
6. ��ȹ�� ���� ���� ����� ������Ѵ�.<br>
7. ���� ���� ���� �̸� ���ΰ�ȹ�� §��.<br>
8. ���� ������ �ϰ� ��ƾ� �ȴٰ� �����Ѵ�.<br>
9. �ڽ��� �ǰ��� �ѷ��ϴ�.<br>
10. ��� ���ÿ� ���� ���� �� �ϴ� ���̴�.<br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (136,'P','[P �ν���]<br>
1. ���� ���� ��ȹ�� ���� �ٲ۴�.<br>
2. ���� ������ ���� �� ��ġ�� ���̴�.<br>
3. �� ���� ���� ������ �׶����� �����Ѵ�.<br>
4. ��ȹ�� ���� ���ϴ� ���� ��Ű�� �ʴ´�.<br>
5. ������ �������ص� ���� �Ű� ���� �ʴ´�.<br>
6. ��ȹ�� ���� ���� ����� ��밡 �ȴ�.<br>
7. �������� ���� ó���ϴ� ���� �� �Ѵ�.<br>
8. ���� ����� ���ǿ� ó���ϴ� ���̴�.<br>
9. �����ϰų� ���� �θ��� �ʴ� ���̴�.<br>
10. �� ������ ���� �ൿ�ϴ� �� �� ����.<br>',null);
--------------------------------------------------------
--  DDL for Index SYS_C007219
--------------------------------------------------------

  CREATE UNIQUE INDEX "FB"."SYS_C007219" ON "FB"."FBRESOURCE" ("RESOURCENUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table FBRESOURCE
--------------------------------------------------------

  ALTER TABLE "FB"."FBRESOURCE" ADD PRIMARY KEY ("RESOURCENUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FB"."FBRESOURCE" MODIFY ("RESOURCENUM" NOT NULL ENABLE);
