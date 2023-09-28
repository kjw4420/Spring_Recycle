<!DOCTYPE html>
<html lang="en"
      xmlns:th="http://www.thymeleaf.org"
      xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
      layout:decorate="~{layout/default}">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📸 사진 업로드 📸</title>
    <link rel="stylesheet" href="picture.css">
</head>
<body>
    <h2 style="font-size: 30px; position: absolute; top: 6%;  background: linear-gradient(to top, #ff8dbd 40%, transparent 40%);">사진을 올려보세요!</h2>
    <p style="font-weight: 200; position: absolute; top: 15%;">어떻게 버려야할지 헷갈리나요? 사진을 찍어 올려보세요!</p>
    <div class="showPicture">
        <img src="about:blank" alt="" onerror="this.src='/img/camera.png'" id="show-picture" style="width: 400px; height: 60vh; position: absolute; border-radius: 20px; "> <!--전송된 파일을 불러옴-->
    </div>
    <div class="container">
        <section class="main-content">
            <form th:action = "@{/picture}" th:object="${image}" method ="post" enctype="multipart/form-data">
                <input name="image" type="file" id="take-picture" accept="image/*" style="position: absolute; bottom: 3%; left: 10%;" required/> <!--촬영된 사진파일전송-->
                <button type="submit" class="sumbitBTN" >올리기</button>
            </form>
            <p id="error"></p>
            <h2 th:if="${error}" th:text="${error}"></h2>
            <h2 th:if="${response}" th:text="${response}"></h2>
        </section>
    </div>
</body>

<script type="text/javascript">
    (function () {
        var takePicture = document.querySelector("#take-picture"),
            showPicture = document.querySelector("#show-picture");

        if (takePicture && showPicture) {
            // Set events
            takePicture.onchange = function (event) { // 촬영된 사진이 전송되면
                var files = event.target.files,
                    file;
                if (files && files.length > 0) {
                    file = files[0];
                    try {
                        var imgURL = window.URL.createObjectURL(file);
                        showPicture.src = imgURL; // 이미지의 src 설정
                        URL.revokeObjectURL(imgURL);
                    }
                    catch (e) {
                        try {
                            // Fallback if createObjectURL is not supported
                            var fileReader = new FileReader();
                            fileReader.onload = function (event) {
                                showPicture.src = event.target.result;
                            };
                            fileReader.readAsDataURL(file);
                        }
                        catch (e) {
                            //
                            var error = document.querySelector("#error");
                            if (error) {
                                error.innerHTML = "Neither createObjectURL or FileReader are supported";
                            }
                        }
                    }
                }
            };
        }
    }
    )();
</script>
</html>

