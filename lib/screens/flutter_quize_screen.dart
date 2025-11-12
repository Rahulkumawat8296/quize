import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../usercontroller/quize_controller.dart';
import '../utils/question_list.dart';

class QuizScreen extends StatelessWidget {
  final QuizeController controller = Get.put(QuizeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.pink.shade900,
        title: const Text(
          'Flutter Quiz',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Obx(() {
        final question = questions[controller.currentQuestionIndex.value];

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question ${controller.currentQuestionIndex.value + 1}/${questions.length}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(question.question, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),

              // ✅ Options
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: question.option.length,
                itemBuilder: (context, index) {
                  Color? tileColor;
                  IconData? icon;
                  if (controller.isAnswered.value) {
                    if (index == question.currentIndex) {
                      tileColor = Colors.green.shade100;
                      icon = Icons.check_circle;
                    } else if (index == controller.selectedIndex!.value) {
                      tileColor = Colors.red.shade100;
                      icon = Icons.cancel;
                    }
                  }

                  return Card(
                    color: tileColor,
                    child: ListTile(
                      leading: Text('(${index + 1})'),
                      title: Text(question.option[index]),
                      trailing: icon != null
                          ? Icon(icon,
                              color: icon == Icons.check_circle
                                  ? Colors.green
                                  : Colors.red)
                          : null,
                      onTap: () => controller.checkAnswer(index),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // if (controller.isAnswered.value)
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () => controller.nextQuestion(context),
                    child: Text(
                      controller.currentQuestionIndex.value ==
                              questions.length - 1
                          ? "Finish"
                          : "Next",
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
