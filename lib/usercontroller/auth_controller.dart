import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/model/login_model.dart';
import 'package:quize/repo/login_repo.dart';
import 'package:quize/screens/login_screen.dart';
import 'package:quize/utils/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashBoard_screen.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cookie');
    print("User logged out — token removed-----------------------.");
    Get.offAll(() => const LoginScreen());

  }


  Rx<RxStatus> loginStatus = RxStatus.empty().obs;
  Rx<LoginModel> loginModel = LoginModel().obs;

  loginAuth(context) {
    loginrepo(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    ).then((value) async {
      loginModel.value = value;
      if (value.code == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('cookie', value.accessToken.toString());
        loginStatus.value = RxStatus.success();
        Get.to(DashboardScreen());

        showToast(value.message.toString());
      } else {
        loginStatus.value = RxStatus.error();
        showToast(value.message.toString());

      }
    });
  }
}
