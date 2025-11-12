import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quize/usercontroller/auth_controller.dart';

import '../widget/quiz_dash_board_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        automaticallyImplyLeading: false,
        title: Text(
          "Learning Quiz",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
            authController.logout();
          }, icon: Icon(Icons.logout,color: Colors.white,))
          
        ],
      ),
      body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
             child: QuizDashBoardWidget(),
           ),
         ],
      ),
    );
  }
}
