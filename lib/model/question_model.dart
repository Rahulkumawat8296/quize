class Question {
  final int id;
  final String question;
  final List<String> option;
  final int currentIndex;

  Question(
      {
        required this.id,
      required this.question,
      required this.option,
      required this.currentIndex
      });
}
