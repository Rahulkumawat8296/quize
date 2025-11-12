import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/flutter_quize_screen.dart';

class QuizDashBoardWidget extends StatelessWidget {
  const QuizDashBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(

                onTap: (){
                  Get.to(QuizScreen());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white.withValues(alpha:  0.2),
                            spreadRadius: 2,
                            blurRadius: 0.4,
                            offset: Offset(0, 3))
                      ]),
                  child: Text("Flutter",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white),)
                ),
              ),
            ),
            SizedBox(width: 20,),

            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white..withValues(alpha:  0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                  child: Text("Dart",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white),)

              ),
            )

          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white..withValues(alpha:  0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                  child: Text("Java",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white),)

              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pinkAccent,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withValues(alpha:  0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ]),
                  child: Text("C++",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: Colors.white),)

              ),
            )

          ],
        )

      ],
    );
  }
}
