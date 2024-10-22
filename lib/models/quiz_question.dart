class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final answersCopy = List.of(answers);
    answersCopy.shuffle();
    return answersCopy;
  }
}
