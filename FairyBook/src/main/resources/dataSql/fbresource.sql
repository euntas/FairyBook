--------------------------------------------------------
--  파일이 생성됨 - 금요일-6월-16-2017   
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

   COMMENT ON COLUMN "FB"."FBRESOURCE"."RESOURCENUM" IS '자료 고유 번호';
   COMMENT ON COLUMN "FB"."FBRESOURCE"."NAME" IS '자료 이름';
   COMMENT ON COLUMN "FB"."FBRESOURCE"."ANALYSIS" IS '자료 분석 텍스트';
   COMMENT ON COLUMN "FB"."FBRESOURCE"."PATH" IS '이미지 파일 경로';
REM INSERTING into FB.FBRESOURCE
SET DEFINE OFF;
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (4,'hair01','미성숙함이나 어색함 혹은 자신감의 결여 및 자기 비하를 나타낼 수 있습니다.','../resources/img/avatar/hair/hair01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (5,'hair02','미성숙함이나 어색함 혹은 자신감의 결여 및 자기 비하를 나타낼 수 있습니다.','../resources/img/avatar/hair/hair02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (6,'eye01','눈이 크면 겁이 많다는 것과 일맥상통합니다. 세상을 경계하거나 불안감이 많은 사람의 눈이 큰 경우가 많습니다. 혹은 눈이 작다고 놀림 당한 사람이라면 큰 눈에 대한 갈망으로 눈을 아주 크게 그릴 수도 있습니다.','../resources/img/avatar/eye/eye01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (7,'nose01','어린이들은 그림을 만화처럼 그리므로 코를 생략하고 그리는 경우가 많습니다. 
오히려 코를 구체적으로 그린 경우에는 여러 가지 가능성을 생각해야 할 것입니다.','../resources/img/avatar/nose/nose01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (8,'mouth01','별 문제가 없습니다. 단, 얼굴 전체는 무서운 표정인데 입만 웃고 있다면, 
어떤 과거의 큰 사건을 숨기고 있거나 폭로하고자 하는 욕구가 있다고 볼 수 있습니다. 
','../resources/img/avatar/mouth/mouth01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (9,'ear01','듣고 싶지 않다는 의미로 해석될 수 있지만, 여성이나 긴 머리를 선호하는 남성의 경우 
머리카락이 귀를 덮어 그렸다면 자연스러운 것이니 큰 의미를 가지진 않습니다. 
만약 긴 머리에서 한쪽 귀만 노출되어 있다면 좀더 세심한 평가를 내려야 합니다. ','../resources/img/avatar/ear/ear01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (11,'body01','첫번재 몸이다','../resources/img/avatar/body/body01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (62,'hair03','머리카락이 강조되어 있지만 깔끔하게 정돈되어 있다면 외모에 자신이 있거나 
아름다움을 추구하는 경향을 보입니다.','../resources/img/avatar/hair/hair03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (21,'eye02','눈이 아무리 작다 하더라도 모든 것을 볼 수 있듯이, 본인은 세상을 내다보고싶지만 외부에 자신을 내보이고 싶지는 않다는 것을 의미합니다. ','../resources/img/avatar/eye/eye02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (22,'eye03','눈꺼풀, 눈썹, 속눈썹 등은 자신의 세련됨과 세심함을 나타내려는 수단으로 볼 수 있습니다.
','../resources/img/avatar/eye/eye03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (42,'roof02','지붕을 지나치게 크게 그렸다면 본인의 외형적인 모습보다 내면의 자아에 대한 인식이 몹시 강한 사람으로 대단한 자기 고집의 소유자입니다.','../resources/img/house/roof/roof02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (43,'door01','대인관계를 잘 유지하고 싶지만 한편으론 거부감이나 두려움이 있을 수 있습니다. 타인이 다가오는 것이 두렵기도 하고 사회적인 관계가 위축되어 있거나 대인관계 능력이 부족한 경우가 많습니다.','../resources/img/house/door/door01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (48,'wall01','벽01','../resources/img/house/wall/wall01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (63,'hair04','머리카락이 강조되어 있지만 깔끔하게 정돈되어 있다면 외모에 자신이 있거나 
아름다움을 추구하는 경향을 보입니다.','../resources/img/avatar/hair/hair04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (64,'yard01','풍성한 열매를 맺고 싶은 욕구를 보입니다. 만약 열매는 많은데 비해 가지의 수가 적거나 기둥이 약해 보인다면, 욕심은 많지만 현실적으로 어떻게 접근을 해야 할 지 모르는 공상에 가까운 목표를 세우고 있을 수 있습니다. 당장은 계획이나 과정이 풍성해 보일지 몰라도 얼마 지나지 않아서 추구한 것들을 이루지 못하고 좌절할 가능성이 있습니다. ','../resources/img/house/yard/yard01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (65,'yard02','사람을 그리라고 했을 때 만화 캐릭터를 그리는 사람과 같은 심리입니다. 
크리스마스 트리와 같이 특정 나무가 자신의 성장 기억과 관련해 어떠한 의미가 있는지 파악해보는 것이 필요합니다. 
또한 그림을 그린 아이에게 물어봤을 때 이 나무가 인조 나무라고 대답한다면, 
현재 자신의 감정이나 생각이 없는 상태로 아무 느낌도 받고 싶지 않은 무생물체로 다시 태어나고 싶다는 것을 
의미하기도 합니다. 성장과정에서 엄청난 정신적/육체적 트라우마를 입었거나 아직도 입고 있는 정신병적상태를 
의미할 수 있으므로 당장 진단평가와 치료가 필요합니다.','../resources/img/house/yard/yard02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (66,'yard04','단순히 멋있어 보여 이런 나무를 그릴 수도 있겠지만 매우 심각한 심리적 상황입니다. 
공허함, 좌절감이 가득하고 의욕이 모두 상실된 위험한 상태이므로 치료가 필요합니다. ','../resources/img/house/yard/yard04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (67,'yard05','열매가 나무에서 떨어지는 것은 자연스럽고 당연한 일입니다. 하지만 아동의 심리파악에 있어서는 그 열매를 누가 수확해 가느냐가 더 중요한 문제이기 때문에 자녀와 많은 대화를 나누어보시는 것을 권장합니다. 일각에서는 낙과를 표현한 것을 거절당한 상처에 대한 징후로 보는 경우도 있습니다.','../resources/img/house/yard/yard05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (68,'yard06','그림에 다양성이 있다고 칭찬해주고 싶지만 매우 이질적인 나무, 즉, 잡종 나무라고 볼 수 있습니다. 
이런 경우 통일성이 아닌 상호 분란과 분리 혹은 영역간의 갈등을 유발하거나 그런 상황에 있음을 의미합니다. 
화합보다는 충돌과 갈등을 우선적으로 추구하는 심리적 상태를 말하고 있습니다. ','../resources/img/house/yard/yard06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (69,'yard07','세밀한 관찰 능력은 예술적으로는 의미가 있을지 모르나 일반적인 그림상담에서는 병적이거나 
강박증이나 결벽증적 성향을 암시합니다. 적당한 거리에서 편안하게 보고 그린 나무가 아니란 뜻으로, 
관찰하는 대상이라든지 주변사람들과의 관계에 있어 강박증세가 있을 수도 있습니다.','../resources/img/house/yard/yard07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (70,'yard08','버드나무 특징상 가지가 아래로 처져있어 현실 세상으로 뻗어나가는 것을 두려워하고,
 과거에 대한 미련과 집착을 버리지 못하는 성향을 보일 수 있습니다. 
만약 오른쪽으로 가지가 쏠린 버드나무 그림을 그렸다면 매우 큰 두려움에 휩싸여 있거나 
현실보단 공상을 즐길 가능성이 많습니다. 예술가적인 기질도 발견됩니다.','../resources/img/house/yard/yard08.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (49,'storyNum1selection00','과자집','../resources/img/etc/story1/selection00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (50,'storyNum1selection01','1번젤리','../resources/img/etc/story1/selection01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (51,'storyNum1selection02','2번젤리','../resources/img/etc/story1/selection02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (52,'storyNum1selection03','3번젤리','../resources/img/etc/story1/selection03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (53,'storyNum1selection04','4번젤리','../resources/img/etc/story1/selection04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (54,'storyNum1selection05','5번젤리','../resources/img/etc/story1/selection05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (55,'storyNum1selection06','6번젤리','../resources/img/etc/story1/selection06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (56,'storyNum1selection07','7번젤리','../resources/img/etc/story1/selection07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (57,'storyNum1selection08','8번젤리','../resources/img/etc/story1/selection08.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (58,'storyNum1selection09','9번젤리','../resources/img/etc/story1/selection09.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (59,'storyNum1selection10','10번젤리','../resources/img/etc/story1/selection10.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (60,'storyNum1selection11','11번젤리','../resources/img/etc/story1/selection11.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (61,'storyNum1selection12','12번젤리','../resources/img/etc/story1/selection12.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (71,'nose02','코의 일부분만 그렸기 때문에 작아 보이는 것이 아니라 완벽한 코의 전체 모양을 얼굴 크기에 비해 
무척 작게 그렸다면 의존성 등을 나타냅니다.','../resources/img/avatar/nose/nose02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (72,'mouth02','애정결핍 및 의존성과 불만족을 나타내며 아주 작은 입으로는 어머니의 젖 밖에는 먹을 수 없기 때문에 
애정결핍을 나타낼 수도 있습니다.','../resources/img/avatar/mouth/mouth02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (73,'mouth03','자세하지만 가지런한 이는 자신을 내보이고 싶은 욕구를 나타납니다. 하지만 들쑥날쑥하거나 
날카로운 톱니 모양의 치아를 그렸다면 심한 공격심의 표현입니다. 이 경우에 사람 그림이 
자신이 아닌 다른 사람일 경우 자신을 위협하는 인물을 의미합니다.','../resources/img/avatar/mouth/mouth03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (74,'mouth04','입술이 없으면 그만큼 얼굴 인상이 냉혹해 보이며 세상에 대한 경멸을 암시할 수 도 있지만, 
마치 지퍼를 굳게 닫은 모양을 하고 있으므로 말하기 싫다는 의미를 가질 수도 있습니다. ','../resources/img/avatar/mouth/mouth04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (75,'mouth05','성인의 경우 큰 입은 지나친 성적 욕구로 해석하는 경우가 많습니다. 그러나 아동의 경우는  단순히 
자신이 말이 많다고 생각하거나 배가 고프다는 일반적인 상태를 상징할 수도 있습니다.','../resources/img/avatar/mouth/mouth05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (83,'face06','비정상적인 자기 가치관을 가지고 있는 경우로, 왜 그렇게 그렸는지 파악해봐야 합니다. 간혹 두통 등 머리 쪽이 불편한 증상과 관련이 있을 수도 있습니다.','../resources/img/avatar/face/face06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (78,'hair05','머리카락이 강조되어 있지만 깔끔하게 정돈되어 있다면 외모에 자신이 있거나 아름다움을 추구하는 경향을 보입니다.','../resources/img/avatar/hair/hair05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (79,'hair06','머리카락이 강조되어 있지만 깔끔하게 정돈되어 있다면 외모에 자신이 있거나 
아름다움을 추구하는 경향을 보입니다.','../resources/img/avatar/hair/hair06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (80,'hair07','머리카락이 강조되어 있지만 머리가 지저분한 편이라면 자존감이 낮은 상태를 의미할 수 있습니다. ','../resources/img/avatar/hair/hair07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (81,'face04','비정상적인 자기 가치관을 가지고 있는 경우로, 왜 그렇게 그렸는지 파악해봐야 합니다. 간혹 두통 등 머리 쪽이 불편한 증상과 관련이 있을 수도 있습니다.','../resources/img/avatar/face/face04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (85,'body02','몸2','../resources/img/avatar/body/body02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (86,'body03','몸3','../resources/img/avatar/body/body03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (87,'body04','몸4','../resources/img/avatar/body/body04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (88,'body05','몸5','../resources/img/avatar/body/body05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (89,'body06','몸6','../resources/img/avatar/body/body06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (90,'body07','몸7','../resources/img/avatar/body/body07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (93,'ear04','듣는 것을 상대적으로 중요하게 생각하지 않은 사람일 수 있으며, 고집스러움을 나타낼 수도 있습니다.','../resources/img/avatar/ear/ear04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (94,'ear05','듣는 것을 상대적으로 중요하게 생각하지 않은 사람일 수 있으며, 고집스러움을 나타낼 수도 있습니다.','../resources/img/avatar/ear/ear05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (95,'ear06','먼저 눈, 코, 입 등 다른 감각 기관의 크기와 차이가 있는지를 평가해야 합니다. 만약 머리나 얼굴에 비해 너무 크다면 병적인 징후를 나타내는 것일 수 있습니다. 아니면 청각에 문제가 생겼을 경우에도 귀만 크게 그릴 수 있으니 자녀의 청력에 관한 검사도 동반되어야 할 것입니다.','../resources/img/avatar/ear/ear06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (96,'ear07','먼저 눈, 코, 입 등 다른 감각 기관의 크기와 차이가 있는지를 평가해야 합니다. 만약 머리나 얼굴에 비해 너무 크다면 병적인 징후를 나타내는 것일 수 있습니다. 아니면 청각에 문제가 생겼을 경우에도 귀만 크게 그릴 수 있으니 자녀의 청력에 관한 검사도 동반되어야 할 것입니다.','../resources/img/avatar/ear/ear07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (97,'eye04','작은 눈의 경우와 마찬가지로 조심스러운 성격이며, 자신은 노출시키지 않으면서 세상과의 소통은 지속하려는 의지를 나타냅니다. 때로는 윙크를 하거나 웃다 보니 눈이 감긴 것과 같은 익살스러운 얼굴을 장난스럽게 그렸다고 해도 자신의 한 부분을 숨기기 위한 행동이라고 볼 수 있습니다.','../resources/img/avatar/eye/eye04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (98,'eye05','작은 눈의 경우와 마찬가지로 조심스러운 성격이며, 자신은 노출시키지 않으면서 세상과의 소통은 지속하려는 의지를 나타냅니다. 때로는 윙크를 하거나 웃다 보니 눈이 감긴 것과 같은 익살스러운 얼굴을 장난스럽게 그렸다고 해도 자신의 한 부분을 숨기기 위한 행동이라고 볼 수 있습니다.','../resources/img/avatar/eye/eye05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (99,'eye06','세상의 일부분만을 보거나 자신의 일부분만을 나타내고 싶다는 의미가 있습니다. 혹은 시각장애나 시력문제 등의 신체 문제와도 관련되어 있을 수 있습니다.','../resources/img/avatar/eye/eye06.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (101,'chimney03','굴뚝에서 연기가 나는 장면은 애정이나 따뜻함에 대한 과도한 욕구와 관심의 결핍감을 나타내는 경우가 많습니다. 
','../resources/img/house/chimney/chimney03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (103,'chimney00','굴뚝없음','../resources/img/house/chimney/chimney00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (104,'door03','문을 너무 크게 그렸다면 사회적인 평가에 지나치게 의존하고 있거나 타인과의 관계 형성에 지나치게 비중을 두는 경향이 있습니다. ','../resources/img/house/door/door03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (105,'door04','주인의 허락이 없이는 들어갈 수 없는 형태의 문입니다. 타인과 친해지곤 싶지만 또 막상 만나면 불편해하는 양가감정을 가질 수 있으며, 적극적이 아닌 수동적인 방법으로 외부인들의 접근을 막고 있습니다.
','../resources/img/house/door/door04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (106,'door05','문 옆에 또 다른 문을 그렸다면 세상과의 접촉을 불편해 하거나 다른 길로 세상과 접촉하고 싶은 소망을 나타내기도 합니다.','../resources/img/house/door/door05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (107,'door00','문을 그리지 않았다면 다른 사람이 자신의 삶에 들어오는 것과 스스로 세상 속으로 나아가는 것에 대해 불안을 느낀다는 징후입니다. 자기만의 세계에 고립된 경우를 말합니다.','../resources/img/house/door/door00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (108,'window02','창문이 매우 높게 있다면 자신은 밖을 내다볼 수 있지만 타인은 집 안을 보기 어려울 것입니다. 따라서 이러한 형태의 지붕그림은 자신의 모습을 감추고 싶어하거나 내적인 고립감을 나타낼 수도 있습니다. ','../resources/img/house/window/window02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (110,'window04','지금보다 안정된 가정을 꿈꾸고 있거나, 가정을 감옥처럼 답답하게 느끼고 있다는 것을 의미합니다.','../resources/img/house/window/window04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (111,'window00','남이 자신의 집 안을 보는 것도 싫지만, 문제는 자신도 바깥을 내다볼 수 없는 구조입니다. 별로 바깥 세상에 관심이 없다라는 사고가 투영된 형태의 그림입니다. 창문을 그리지않은 아동은 대개 자신을 드러내지 않고 세상 일을 회피하는 태도를 보입니다.','../resources/img/house/window/window00.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (112,'nose03','의외로 공포심이나 두려움이 많은 사람입니다. 코에는 미묘한 심리에 관련된 내용이 많이 포함되므로 상담을 통해 검토해 볼 필요가 있을 것입니다.','../resources/img/avatar/nose/nose03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (109,'window03','여러 개의 창문은 집안의 구역을 여러 개로 구분하고 싶은 사람이며, 창문이 많아서 개방적인 사람처럼 느껴지겠지만 반대로 자신을 포함한 가족 구성원 각각의 프라이버시를 강조하는 사람입니다. 또는 이럴까? 저럴까? 쉽게 결정하지 못하는 양가감정이 많은 사람일 수 있습니다.','../resources/img/house/window/window03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (100,'chimney02','굴뚝 무늬 자체는 크게 문제가 되지 않지만, 무늬를 너무 자세히 그렸다면 강박적인 성향을 가지고 있을 확률이 높습니다. 특히 가족간의 따뜻한 교류와 애정 관계에 대한 집착이 있을 수 있습니다. ','../resources/img/house/chimney/chimney02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (102,'chimney04','굴뚝에서 연기가 나는 장면은 애정이나 따뜻함에 대한 과도한 욕구와 관심의 결핍감을 나타내는 경우가 많습니다.굴뚝 무늬 자체는 크게 문제가 되지 않지만, 무늬를 너무 자세히 그렸다면 강박적인 성향을 가지고 있을 확률이 높습니다. 특히 가족간의 따뜻한 교류와 애정 관계에 대한 집착이 있을 수 있습니다. ','../resources/img/house/chimney/chimney04.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (92,'ear03','귀걸이는 스스로를 꾸미기 좋아하는 성향이나 자기과시욕을 나타냅니다. 목걸이 등 다른 악세사리들을 그린 경우도 마찬가지입니다.','../resources/img/avatar/ear/ear03.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (91,'ear02','귀는 상대방의 말을 듣는 소통의 도구로써, 평범한 귀를 그렸다할지라도 양쪽이 대칭을 이루는지를 잘 살펴보아야 할 것입니다. 대칭이 아니라면 좀 더 세심한 평가가 필요합니다.','../resources/img/avatar/ear/ear02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (82,'face05','머리는 그 사람의 정체성을 나타내는 중요한 요소입니다. 머리를 크게 그리는 것은 자신의 교만함이나 과장됨을 나타내지만, 아동의 경우 일반적으로 머리를 크게 그리는 경우가 많으므로 큰 의미를 갖지는 않습니다.','../resources/img/avatar/face/face05.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (84,'face07','머리는 그 사람의 정체성을 나타내는 중요한 요소입니다. 머리를 크게 그리는 것은 자신의 교만함이나 과장됨을 나타내지만, 아동의 경우 일반적으로 머리를 크게 그리는 경우가 많으므로 큰 의미를 갖지는 않습니다.','../resources/img/avatar/face/face07.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (41,'roof01','지붕은 사람으로 치면 머리에 해당하는 부분으로, 보통 자신에 대한 생각이나 관념과 같은 자아와 자존감을 나타냅니다. 지붕을 지나치게 정교하게 그리거나, 강조해서 그리는 경우는 강박, 우울 및 자폐의 증상을 나타낼 수 있으므로 아이가 집을 그릴 때 유심히 살펴볼 필요가 있을 것입니다.','../resources/img/house/roof/roof01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (44,'door02','집에서 문은 다른이가 자신의 삶에 들어오도록 허용하는 것과 동시에 자신이 세상과 만나는 통로를 의미합니다. 문 그림을 통해 대인관계에 있어서 불안함이나 두려움은 없는지, 본인의 감정과 의견을 피력하는 것에 대해 불편함이 있는지 등을 알아볼 수 있습니다. 크기가 적당하고 손잡이가 달린 문이라면 문에서 나타나는 특별한 정서적 문제는 없어보입니다.','../resources/img/house/door/door02.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (45,'window01','창문은 다른 환경이나 타인과의 상호작용을 할 수 있는 능력과, 그것을 통해 스스로 느끼는 감정들과 연관이 있습니다. 평범하게 그려진 창문은 정상적이고 무난한 사회성을 의미합니다. ','../resources/img/house/window/window01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (46,'chimney01','굴뚝은 서양의 경우와는 달리 우리나라에서 흔히 찾아볼 수 없는 구조로 굴뚝의 유무가 특별한 의미를 가지지는 않습니다. 굴뚝을 그렸다면 굴뚝을 통해 아동이 생각하는 가족과의 관계와 가정의 분위기에 대한 정보를 얻을 수도 있습니다.','../resources/img/house/chimney/chimney01.png');
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (113,'ISTJ','실제 사실에 대하여 정확하게 체계적으로 기억하며 일처리에 신중하며 책임감이 강합니다. 
관련 직업 : 회계, 법률, 생산, 건축, 의료, 사무직, 관리직 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (114,'ISTP','말이 없으며 객관적으로 인생을 관찰하는 편이고 필요 이상으로는 자신을 발휘하지 않습니다. 관련 직업 : 법률, 경제, 마켓팅, 판매통계 분야 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (115,'ESTP','사실적이고 관대하며 개방적이고 사람이나 일에 대한 선입견이 별로 없습니다. 관련 직업 : 의사, 군인, 검사, 경찰관, 운동가 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (116,'ESTJ','실질적이고 현실감이 뛰어나며 일을 조직하고 계획하여 추진시키는 능력이 있습니다. 관련 직업 : 사업가, 행정관리, 생산건축 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (117,'ISFJ','책임감이 강하고 온정적이며 헌신적이고 침착하며 인내력이 강합니다. 관련 직업 : 의료, 간호, 교직, 사무지, 사회사업 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (118,'ISFP','말없이 다정하고 양털안감을 넣은 오버코트처럼 속마음이 따뜻하고 친절합니다. 관련 직업 : 농장경영, 교통, 간호직, 비서직 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (119,'ESFP','현실적이고 실제적이며 친절합니다. 어떤 상황이든 잘 적응하며 수용력이 강하고 사교적입니다. 관련 직업 : 의료 판매, 교통, 간호직, 비서직 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (120,'ESFJ','동정심이 많고 다른 사람에게 관심을 쏟으며 인화를 중시합니다. 동료애가 많고 친절합니다. 관련 직업 : 교직, 성직, 판매, 간호, 의료 분야 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (121,'INFJ','창의력, 통찰력이 뛰어나며 강한 직관력으로 말없이 타인에게 영향력을 미칩니다. 관련 직업 : 성직, 심리치료와 상담, 예술과 문학 분야 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (122,'INFP','마음이 따뜻하고 조용하며 자신이 관계하는 일에 대하여 책임감이 강하고 성실합니다. 관련 분야 : 언어, 학문, 문학, 상담 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (123,'ENFP','온정적이고 창의적이며 항상 새로운 가능성을 찾고 시도합니다. 관련 직업 : 상담, 교육, 저널리스트, 광고, 판매, 작가 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (124,'ENFJ','민첩하고 동정심이 많고 사교적이며 인화를 중요시하고 참을성이 많습니다. 관련 직업 : 교직, 성직, 심리상담, 예술, 문학 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (125,'INTJ','행동과 사고에 있어서 독창적이며 강한 직관력과 의지와 결단력, 인내심이 있습니다. 관련 직업 : 과학, 엔지니어링, 발명, 정치, 철학 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (126,'INTP','과묵하나 관심이 있는 분야에 대해서는 말을 잘하며 이해가 빠르고 높은 직관력으로 통찰하는 재능과 지적 호기심이 많습니다. 관련 직업 : 순수과학, 연구, 수학, 엔지니어링, 경제, 철학, 심리학 등의 학문',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (127,'ENTP','독창적이며 창의력이 풍부하고 넓은 안목을 갖고 있으며 다방면에 재능이 많습니다. 관련 직업 : 발명가, 과학자, 언론, 마케팅, 컴퓨터 분석 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (128,'ENTJ','활동적이고 솔직하며 결정력과 통솔력이 있고 장기적 계획과 거시적 안목을 선호합니다. 관련 직업 : 판매업, 건축업, 선장, 군인, 경찰관 등',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (129,'E','[E 외향성]<br>
1. 에너지가 밖으로 향할 때 힘을 얻는다.
<br>
2. 친한 친구들이 많고 아는 친구들도 많다.<br>
3. 활발하고 의욕적으로 나서는 편이다.<br>
4. 주변에서 일어나는 일에 관심이 많다. <br>
5. 이것저것 새로운 일을 하는 게 재미있다.<br>
6. 활발하고 적극적이라는 말을 많이 듣는다. <br>
7. 발표하는 게 글쓰기보다 좋다.<br>
8. 잘 모르지만 하다보면 배우게 된다.<br>
9. 사람들은 내 기분을 잘 아는 것 같다.<br>
10. 낯선 곳에 가면 내가 먼저 말을 시작한다.',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (130,'I','[I 내향성]<br>
1. 에너지가 안으로 향할 때 힘을 얻는다.<br>
2. 적은 수의 친구를 깊이 사귄다.<br>
3. 조용하고 나서는 것이 싫다.<br>
4. 혼자 조용히 생각에 잠길 때가 있다.<br>
5. 조용히 한 군데 집중하는 게 좋다.<br>
6. 조용하고 침착하다는 말을 듣는 편이다.<br>
7. 말보다는 글로 쓰는 것이 더 편하다.<br>
8. 확실하게 알기 전까지는 행동하지 않는다.<br>
9. 남은 나를 잘 이해하지 못하는 것 같다.<br>
10. 누가 물어보아야만 대답한다.',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (131,'S','[S 감각형]<br>
1. 보고, 듣고, 맛보고, 만져보면서 이해한다. <br>
2. 직접 눈앞에서 보는 것처럼 자세하게 설명해주면 이해가 잘된다. <br>
3. 사람들의 생김새나 특징이 눈에 잘 뛴다. <br>
4. 직접 만지고 실제로 해 보는 게 좋다. <br>
5. 꼼꼼하게 일을 해낼 수 있다. <br>
6. 숲보다는 나무를 잘 보기 때문에 구체적인 사실  하나하나까지 자세하게 기억한다. <br>
7. 새로운 것을 만들어내는 것보다 이미 있는 것을  조금 바꾸는 게 더 좋다. <br>
8. 한번 시작한 일은 끝을 보고 싶다. <br>
9. 새로운 방법보다는 남들 하는 대로 따라하는 것이 편하다. <br>
10. 현재를 제대로 사는 게 미래의 꿈보다 더 중요하다. <br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (132,'N','[N 직관형]<br>
1. 무엇을 알아갈 때 마음속에 번개처럼 스쳐가는   뭔가를 이해할 수 있다.<br>
2. 상상 속의 이야기를 잘 만들어 낸다.<br>
3. 종종 물건을 잃어버릴 때가 있다.<br>
4. 질문이 많고 상상력이 풍부하다.<br>
5. 해야 할 일을 단숨에 해낸다.<br>
6. 나무보다는 숲을 보며 전체의 뜻을 잘 파악한다.  <br>
7. 이것저것 생각을 많이 해서 새로운 것을 만들어 내는 편이다.<br>
8. 새로운 일들을 자꾸 벌리는 게 재미있다.<br>
9. 미래에 대해 희망하는 일들이 많고 이것저것 하고 싶은 게 많다.<br>
10. 미래의 가능성을 생각하는 것이 현재를 사는 것보다 더 의미 있다.  <br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (133,'T','[T 사고형]<br>
1. 결정하고 판단할 때 자신이 알고 있는 사실을 중심으로 결정한다.<br>
2. 내가 아는 것이 정확한지에 관심을 가진다.<br>
3. 의지와 끈기가 강한 편이다.<br>
4. 야단을 맞아도 눈물을 잘 보이지 않는다.<br>
5. 마음먹은 일은 비교적 꾸준히 밀고 나가는 편이다. <br>
6. “맞다, 틀리다”라는 말을 자주 한다.<br>
7. 일의 원인 결과를 꼼꼼하게 살펴보는 편이다.<br>
8. 규칙과 원칙이 지켜져야 마음이 편하다.<br>
9. 논리적으로 설명하여 친구들을 설득하는 편이다.  <br>
10. 할 일을 구체적으로 나누고 어떻게 하면 가장 잘 할 수 있을까를 생각한다. <br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (134,'F','[F 감정형]<br>
1. 결정할 때 사람과의 관계를 먼저 생각하며 판단한다.<br>
2. 주위 사람에게 내가 주는 영향을 살핀다.<br>
3. 감정이 풍부하고 인정이 많은 편이다.<br>
4. 꾸중을 들으면 눈물부터 나온다.<br>
5. 다른 사람들이 자신에 대해 어떻게 생각하는지   신경이 쓰인다.<br>
6. “좋다, 나쁘다”라는 말을 자주 한다.<br>
7. 일이 나에게 주는 의미를 살피고 주변 사람과의  관계에 신경을 쓴다.<br>
8. 상황에 따라 규칙과 원칙은 변할 수 있다.<br>
9. 친구의 우정과 마음에 호소하여 감정을 움직이는 편이다.<br>
10. 양보를 잘하고 서로 도와가며 일을 하는 것을 좋아하는 편이다.<br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (135,'J','[J 판단형]<br>
1. 계획을 세우고 비교적 실천하는 편이다.<br>
2. 해야 할 일은 마감 날까지 마치는 편이다.<br>
3. 할 일을 질문 받으면 쉽게 대답한다.<br>
4. 시간이 촉박하게  일하는 것을 싫어한다.<br>
5. 깨끗이 정돈된 상태를 선호한다.<br>
6. 계획에 없던 일이 생기면 힘들어한다.<br>
7. 시험 보기 전에 미리 공부계획을 짠다.<br>
8. 먼저 할일을 하고 놀아야 된다고 생각한다.<br>
9. 자신의 의견이 뚜렷하다.<br>
10. 어른의 지시에 따라 일을 잘 하는 편이다.<br>',null);
Insert into FB.FBRESOURCE (RESOURCENUM,NAME,ANALYSIS,PATH) values (136,'P','[P 인식형]<br>
1. 때에 따라 계획을 자주 바꾼다.<br>
2. 마감 날까지 일을 못 마치는 편이다.<br>
3. 할 일을 질문 받으면 그때부터 생각한다.<br>
4. 계획을 세워 일하는 것이 내키지 않는다.<br>
5. 복장이 지저분해도 별로 신경 쓰지 않는다.<br>
6. 계획에 없던 일이 생기면 기대가 된다.<br>
7. 마지막에 몰아 처리하는 일을 잘 한다.<br>
8. 일이 생기면 막판에 처리하는 편이다.<br>
9. 주장하거나 고집 부리지 않는 편이다.<br>
10. 내 마음에 따라 행동하는 게 더 좋다.<br>',null);
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
