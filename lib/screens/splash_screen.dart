import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quize/screens/dashBoard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      _navigateUser();
    });
    super.initState();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final cookie = prefs.getString('cookie');
    if (cookie != null && cookie.isNotEmpty) {
      print("Token-----------------,$cookie");
      Get.off(() => const DashboardScreen());
    } else {
      Get.off(() => const LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Text(
          "Splash Screen",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24,color: Colors.white),
        ),
      ),
    );
  }
}
