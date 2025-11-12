import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quize/screens/dashBoard_screen.dart';
import 'package:quize/usercontroller/auth_controller.dart';
import 'package:quize/utils/customButtion.dart';
import 'package:quize/utils/custome_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final authController = Get.put(AuthController());

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        automaticallyImplyLeading: false,
        title: Text(
          "Login Screen",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomTextFormField(
                  hintText: "Please enter your email",
                  controller: authController.emailController),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomTextFormField(
                  hintText: "Please enter your password",
                  controller: authController.passwordController),
            ),
            SizedBox(
              height: 20,
            ),

            GestureDetector(
              onTap: (){
                authController.loginAuth(context);
              },
              child: CustomButtion(
                height: 50,
                width: Get.width,
                color: Colors.pink.shade900,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
