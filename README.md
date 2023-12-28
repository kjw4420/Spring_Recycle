# 🌿나는야 분리수거를 잘하는 어린이 (TEAM. 딱총나무지팡이🧙‍♀️)

**프로젝트 진행 기간:**
2023. 04 ~ 2023. 10

## :bookmark_tabs: 프로젝트 개요
**'나는야 분리수거를 잘하는 어린이'** 는 딥러닝 기반 실시간 객체인식을 활용한 교육용 분리수거 웹앱이다. 기능은 크게 쓰레기(재활용품) 분류와 재활용 교육 두 가지가 있다. <br><br>
 📌 쓰레기(재활용품) 분류: 우리가 일상에서 재활용 분리배출을 하다보면, 어떤 재활용품이 어떤 카테고리로 배출되어야 하는지 구분하기 어려울 때가 많다. 재활용 분리 배출의 편의 성을 높이고 올바른 분리 배출 방식 학습을 위해 객체인식을 활용했다. 스마트폰 카메라로 쓰레기를 촬영하면 해당 쓰레기의 배출 카테고리와 올바른 분리 배출 방법이 나타난다.<br><br>
 📌 재활용 교육: 아이들의 흥미를 끌고, 교육 효과 증대를 위해 교육의 메시지를 담은 카드 쥐집기, OX 퀴즈, 쓰레기 드래그 게임(가상 분리 배출 게임)을 개발했다. 또한 아이들의 쓰레기 배출 목표의식과 경쟁 의식(분리 배출 경쟁)을 강화하기 위해 지역별 포인트 기능을 도입해 개인 순위를 확인할 수 있도록 하였다. 또 분리배출 교육 영상물을 볼 수 있게 하여 영상 학습도 가능 하도록 하였다. <br>


## :bookmark_tabs: 기능 소개
 ✔️ **객체인식으로 손쉽게 쓰레기 분류 기능:** <br>
 -쓰레기를 배출하다 헷갈릴 때 바로 사진을 찍어 어떤 종류의 쓰레기 인지, 어떻게 버려야 하는지 알 수 있다.<br>
  -사용자가 객체인식 했던 기록이 저장되어 포인트로 전환된다.<br><br>
 ✔️ **게임을 통해 분리배출 학습 기능:** <br>
-단순히 글을 읽거나 영상을 보는 것을 넘어 직접 게임에 참여함으로써 분리수거 학습에 대한 흥미를 유발한다.<br>
-순위 경쟁을 통해 좋은 경쟁 심리를 자극해 많은 참여를 유도한다. <br><br>
 ✔️ **지자체와 협력하여 포인트로 종량제 봉투 등으로 교환(목표):** <br>
-사용자들에게 일정 포인트를 모았을 경우, 종량제 봉투 혹은 그린 마일리지 등으로 교환해준다면 보상심리로 많은 참여를 유도할 수 있을 것이다.  <br><br>

## :bookmark_tabs: 프로젝트 홍보 포스터
![포폴_졸프_포스터](https://github.com/kjw4420/Spring_Recycle/assets/97749184/7aaaa9d9-adcf-4737-a163-4113c1f11334)


# 📝문제해결: Json Parsing

Springboot에서 Json 데이터를 받아 파싱 해 사용해 본 것은 처음이었습니다. 첫 버전에서는 ‘Flask에서 보낸 데이터를 SpringBoot에서 처리가 아닌 받는다’에만 집중해 Flask에서 Json 데이터를 자체적으로 SpringBoot 서비스에서 요구하는 형태로 변형해 전달했습니다.

```python
if request.files.get("image"):
        image_file = request.files["image"]
        image_bytes = image_file.read()
        img = Image.open(io.BytesIO(image_bytes))
        
        temp = model(img, size=320) # reduce size=320 for faster inference
        
        results=temp.pandas().xyxy[0].to_json(orient="columns")
        index=results.rindex('{')
        res={
            'name': results[index:-1]
        }
        return jsonify(res)
```

Flask/restapi.py

하지만 위 코드는 데이터의 형식/구성이 조금만 변해도 오류가 잘못된 데이터가 넘어오는 오류가 빈번하게 발생했고, Json 자료형의 장점을 전혀 사용하지 못하고 있다는 생각이 들었습니다. 이를 개선하기 위해 두 번째 버전에서는 SpringBoot 단에서 Json.Simple 라이브러리로 JsonObject/ Parser을 생성해 Json 데이터를 Parsing 했습니다. ~~데이터가 마트료시카 인형처럼 벗겨진다는 생각이 들었습니다.~~ 개발자가 성능 향상을 위해 끊임없이 고민해야 하는 이유를 몸소 체험한 계기였습니다. 사소한 코드를 몇 줄 바꿨는데 그 이상의 성능 향상을 경험했습니다.

## 👩🏻‍💻 멤버


### Front-end

|               | github                             |
| ------------- | ---------------------------------- |
| 김다빈 |    https://github.com/KIMDAB1N|
| 이은상      |     |


### back-end

|               | github                             |
| ------------- | ---------------------------------- |
| 김지원  |https://github.com/kjw4420    |
| 조서현      |   https://github.com/westnowise      |



## :hammer_and_wrench: 사용 기술

### Front-end

**프로그래밍 언어**<br>
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/Javascript-F7DF1E?style=flat-square&logo=Javascript&logoColor=white"/>
<br>


### Back-end

**언어**<br>
 <img src="https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white"> 
<img src="https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=Python&logoColor=white"/>
 <img src="https://img.shields.io/badge/Javascript-F7DF1E?style=flat-square&logo=Javascript&logoColor=white"/><br><br>
**프레임워크/라이브러리**<br>
<img src="https://img.shields.io/badge/Spring%20Boot-6DB33F?style=flat-square&logo=Spring%20Boot&logoColor=black"/>
<img src="https://img.shields.io/badge/Django-092E20?style=flat-square&logo=django&logoColor=white"/> 
<img src="https://img.shields.io/badge/flask-000000?style=flat-square&logo=flask&logoColor=white"><br>


**데이터베이스**<br>
<img src="https://img.shields.io/badge/mysql-4479A1?style=flat-square&logo=mysql&logoColor=white">



