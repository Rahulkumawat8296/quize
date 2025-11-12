import 'package:quize/model/question_model.dart';

final List<Question> questions = [
  Question(
    id: 1,
    question: "What is Flutter?",
    option: ["SDK", "Programming Language", "IDE", "Operating System"],
    currentIndex: 0,
  ),
  Question(
    id: 2,
    question: "Which language is used by Flutter?",
    option: ["Java", "Dart", "Kotlin", "Swift"],
    currentIndex: 1,
  ),
  Question(
    id: 3,
    question: "Who developed Flutter?",
    option: ["Google", "Microsoft", "Apple", "Facebook"],
    currentIndex: 0,
  ),
  Question(
    id: 4,
    question: "Which widget is used for layout in Flutter?",
    option: ["Container", "Row", "Column", "All of the above"],
    currentIndex: 3,
  ),
  Question(
    id: 5,
    question: "What does `setState()` do in Flutter?",
    option: [
      "Updates UI",
      "Changes variable type",
      "Creates new widget",
      "Deletes widget"
    ],
    currentIndex: 0,
  ),
  Question(
    id: 6,
    question: "Which package is used for state management in Flutter?",
    option: ["GetX", "Provider", "Riverpod", "All of these"],
    currentIndex: 3,
  ),
  Question(
    id: 7,
    question: "Which method is used to build widgets in Flutter?",
    option: ["render()", "build()", "create()", "run()"],
    currentIndex: 1,
  ),
  Question(
    id: 8,
    question: "Which widget is used for scrolling lists?",
    option: ["ListView", "Column", "Row", "Stack"],
    currentIndex: 0,
  ),
  Question(
    id: 9,
    question: "Which widget displays images in Flutter?",
    option: ["Image", "Container", "Text", "Icon"],
    currentIndex: 0,
  ),
  Question(
    id: 10,
    question: "Flutter apps can run on which platforms?",
    option: ["iOS", "Android", "Web", "All of these"],
    currentIndex: 3,
  ),
];
