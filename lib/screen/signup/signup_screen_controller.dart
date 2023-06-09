import 'package:anipet/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response;

class SignupScreenController extends GetxController {
  Dio dio = Dio();

  TextEditingController emailTextController = TextEditingController();

  TextEditingController idTextController = TextEditingController();

  TextEditingController passwordTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void onSignupButtonClick() async {
    Common.logger.d(emailTextController.text);
    Common.logger.d(idTextController.text);
    Common.logger.d(passwordTextController.text);

    try {
      Response response = await dio.post("http://localhost:3000/signup", data: {
        'email': emailTextController.text,
        'id': idTextController.text,
        'password': passwordTextController.text,
      });
      if (response.statusCode == 200) {
        // 성공적으로 데이터가 서버로 전송되었을 경우 처리할 로직
        Common.logger.d('signup success');
      } else {
        // 서버로의 요청이 실패했을 경우 처리할 로직
        Common.logger.d('signup fail');
      }
    } catch (error) {
      // 에러 처리
      // HTTP 요청이 실패했을 때의 에러를 처리하는 코드를 작성합니다.
    }
  }
}
