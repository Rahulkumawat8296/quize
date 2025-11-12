import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/question_list.dart';

class QuizeController extends GetxController {
  RxInt currentQuestionIndex = 0.obs;
  RxInt score = 0.obs;
  RxInt? selectedIndex = (-1).obs;
  RxBool isAnswered = false.obs;

  void checkAnswer(int index) {
    if (isAnswered.value) return; // Prevent multiple taps

    selectedIndex!.value = index;
    isAnswered.value = true;

    if (index == questions[currentQuestionIndex.value].currentIndex) {
      score.value++;
    }
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      isAnswered.value = false;
      selectedIndex!.value = -1;
    } else {
      // ✅ Show popup dialog when quiz is complete
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: const Text(
            "Quiz Completed!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("✅ Correct Answers: ${score.value}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text(
                "❌ Incorrect Answers: ${questions.length - score.value}",
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                resetQuiz();
                Get.back(); // close dialog
              },
              child: const Text("Restart"),
            ),
            TextButton(
              onPressed: () {
                Get.back(); // Close dialog only
                Get.back(); // Go back to home
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    score.value = 0;
    isAnswered.value = false;
    selectedIndex!.value = -1;
  }
}
