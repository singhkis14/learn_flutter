import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/data/questions.dart';
import 'package:learn_flutter/models/quiz_question.dart';
import 'package:learn_flutter/widgets/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  final List<String> selectedAnswers;
  final void Function() restart;
  final List<QuizQuestion> questionsGiven = questions;
  const ResultScreen(this.selectedAnswers, this.restart, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${getCorrectAnswerCount()} out of ${questionsGiven.length} questions correctly',
              style: GoogleFonts.aBeeZee(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummary()),
            OutlinedButton.icon(onPressed: restart, label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }

  int getCorrectAnswerCount() {
    var result = 0;
    for (int i = 0; i < questionsGiven.length; i++) {
      if (questionsGiven[i].answers[0] == selectedAnswers[i]) {
        result++;
      }
    }
    return result;
  }

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> result = [];
    for (int i = 0; i < questionsGiven.length; i++) {
      {
        var question = questionsGiven[i];
        result.add({
          'question_index': i,
          'question': question.text,
          'correct_answer': question.answers[0],
          'user_answer': selectedAnswers[i],
        });
      }
    }
    return result;
  }
}
