import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/data/questions.dart';
import 'package:learn_flutter/models/quiz_question.dart';
import 'package:learn_flutter/widgets/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String) onAnswerSelect;

  const QuestionScreen(this.onAnswerSelect, {super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionNumber = 0;
  final List<String> answersSelected = [];

  final List<QuizQuestion> qs = questions;

  @override
  Widget build(BuildContext context) {
    var currQuestion = questions[questionNumber];
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currQuestion.text,
              style: GoogleFonts.aBeeZee(
                color: const Color.fromARGB(255, 216, 145, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            for (var answer in currQuestion.getShuffledAnswers())
              AnswerButton(
                onAnswer: () {
                  nextQuestion(answer);
                },
                answerText: answer,
              ),
          ],
        ),
      ),
    );
  }

  void nextQuestion(String selectedAnswer) {
    widget.onAnswerSelect(selectedAnswer);
    setState(() {
      questionNumber++;
    });
  }
}
