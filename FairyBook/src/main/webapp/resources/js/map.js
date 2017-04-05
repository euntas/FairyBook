function map(region) {
	
	switch (region) {
	case "서울":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.539051, 127.045396),
			level : 9
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '우리들병원',
			latlng : new daum.maps.LatLng(37.558304, 126.925260)
		}, {
			title : 'jnLee아동정신의학과',
			latlng : new daum.maps.LatLng(37.545849, 127.142635)
		}, {
			title : '크는아이병원',
			latlng : new daum.maps.LatLng(37.510978, 127.060200)
		}, {
			title : '연세아동정신과병원',
			latlng : new daum.maps.LatLng(37.483780, 126.930109)
		} ];
		
		console.log('맵1' + container);
		
		break;
	case "경기인천":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.539051, 127.045396),
			level : 11
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '송도은지병원',
			latlng : new daum.maps.LatLng(37.393023, 126.646321)
		}, {
			title : '경희아동정신과병원',
			latlng : new daum.maps.LatLng(37.264713, 126.998602)
		}, {
			title : '튼튼병원',
			latlng : new daum.maps.LatLng(37.740959, 127.048555)
		},

		];
		break;
	case "강원":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.355410, 127.943344),
			level : 7
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '연세아동정신과병원',
			latlng : new daum.maps.LatLng(37.355410, 127.943344)
		}

		];
		break;

	case "충청":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(36.694534, 127.601860),
			level : 11
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '성심소아정신과',
			latlng : new daum.maps.LatLng(36.327730, 127.427248)
		}, {
			title : '호반의원',
			latlng : new daum.maps.LatLng(36.963995, 127.944600)
		}, {
			title : '삼거리정신의학과',
			latlng : new daum.maps.LatLng(36.802543, 127.118986)
		}

		];
		break;

	case "전라":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.380935, 126.925453),
			level : 12
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '민주정신의학과',
			latlng : new daum.maps.LatLng(35.186185, 126.921414)
		}, {
			title : '쑥쑥아이병원',
			latlng : new daum.maps.LatLng(35.813202, 127.149423)
		}, {
			title : '하성걸의원',
			latlng : new daum.maps.LatLng(34.807763, 126.427667)
		}

		];
		break;

	case "경상":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.761265, 128.840445),
			level : 12
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '대구카톨릭병원',
			latlng : new daum.maps.LatLng(35.843779, 128.568404)
		}, {
			title : '이한건의원',
			latlng : new daum.maps.LatLng(36.128987, 128.331570)
		}, {
			title : '포항i-병원',
			latlng : new daum.maps.LatLng(36.009222, 129.358398)
		}, {
			title : '석진정신의학과',
			latlng : new daum.maps.LatLng(35.167804, 129.179976)
		}, {
			title : '현대병원',
			latlng : new daum.maps.LatLng(35.492229, 129.439410)
		}, {
			title : '우리아이정신의학과',
			latlng : new daum.maps.LatLng(35.226695, 128.682280)
		}

		];
		break;
	case "제주":
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.500680, 126.529804),
			level : 5
		};

		var map = new daum.maps.Map(container, options);
		var positions = [ {
			title : '감수광의원',
			latlng : new daum.maps.LatLng(33.500680, 126.529804)
		}

		];
		break;
	default:
		break;

	}
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

	for (var i = 0; i < positions.length; i++) {

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(24, 35);

		// 마커 이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng, // 마커를 표시할 위치
			title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		// 마커 이미지
		});
	}
}

function map2(country){

	switch (country) {
	case "마포" :
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.558304, 126.925260),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
			title : '우리들병원',
			latlng : new daum.maps.LatLng(37.558304, 126.925260)
		};
	 
		break;
	case "강동" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.545849, 127.142635),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : 'jnLee아동정신의학과',
				latlng : new daum.maps.LatLng(37.545849, 127.142635)
		};
		break;
	case "강남" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.510978, 127.060200),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '크는아이병원',
				latlng : new daum.maps.LatLng(37.510978, 127.060200)
		};
		break;
	case "관악" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.483780, 126.930109),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '연세아동정신과병원',
				latlng : new daum.maps.LatLng(37.483780, 126.930109)
		};
		break;
	case "인천" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.393023, 126.646321),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '송도은지병원',
				latlng : new daum.maps.LatLng(37.393023, 126.646321)
		};
		break;
	case "수원" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.264713, 126.998602),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '경희아동정신과병원',
				latlng : new daum.maps.LatLng(37.264713, 126.998602)
		};
		break;
	case "의정부" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.740959, 127.048555),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '튼튼병원',
				latlng : new daum.maps.LatLng(37.740959, 127.048555)
		};
		break;
	case "원주" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(37.355410, 127.943344),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '연세아동정신과병원',
				latlng : new daum.maps.LatLng(37.355410, 127.943344)
		};
		break;
	case "대전" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(36.327730, 127.427248),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '성심소아정신과',
				latlng : new daum.maps.LatLng(36.327730, 127.427248)
		};
		break;
	case "충주" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(36.963995, 127.944600),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '호반의원',
				latlng : new daum.maps.LatLng(36.963995, 127.944600)
		};
		break;
	case "천안" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(36.802543, 127.118986),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '삼거리정신의학과',
				latlng : new daum.maps.LatLng(36.802543, 127.118986)
		};
		break;
	case "광주" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.186185, 126.921414),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '민주정신의학과',
				latlng : new daum.maps.LatLng(35.186185, 126.921414)
		};
		break;
	case "전주" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.813202, 127.149423),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '쑥쑥아이병원',
				latlng : new daum.maps.LatLng(35.813202, 127.149423)
		};
		break;
	case "목포" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(34.807763, 126.427667),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '하성걸의원',
				latlng : new daum.maps.LatLng(34.807763, 126.427667)
		};
		break;
	case "대구" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.843779, 128.568404),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '대구카톨릭병원',
				latlng : new daum.maps.LatLng(35.843779, 128.568404)
		};
		break;
	case "구미" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(36.128987, 128.331570),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '이한건의원',
				latlng : new daum.maps.LatLng(36.128987, 128.331570)
		};
		break;
	case "포항" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(36.009222, 129.358398),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '포항i-병원',
				latlng : new daum.maps.LatLng(36.009222, 129.358398)
		};
		break;
	case "부산" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.167804, 129.179976),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '석진정신의학과',
				latlng : new daum.maps.LatLng(35.167804, 129.179976)
		};
		break;
	case "울산" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.492229, 129.439410),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '현대병원',
				latlng : new daum.maps.LatLng(35.492229, 129.439410)
		};
		break;
	case "창원" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(35.226695, 128.682280),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '우리아이정신의학과',
				latlng : new daum.maps.LatLng(35.226695, 128.682280)
		};
		break;
	case "제주" : 
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.500680, 126.529804),
			level : 4
		};
		var map = new daum.maps.Map(container, options);
		
		var positions =  {
				title : '감수광의원',
				latlng : new daum.maps.LatLng(33.500680, 126.529804)
		};
		break;
	}

	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";



		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(24, 35);

		// 마커 이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions.latlng, // 마커를 표시할 위치
			title : positions.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		// 마커 이미지
		});
	
}
