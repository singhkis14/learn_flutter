import 'package:flutter/material.dart';
import 'package:learn_flutter/data/questions.dart';
import 'package:learn_flutter/screens/question_screen.dart';
import 'package:learn_flutter/screens/result_screen.dart';
import 'package:learn_flutter/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget activeScreen = const Placeholder();
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(chooseAnswer);
    });
  }

  void showResults() {
    setState(() {
      activeScreen = ResultScreen(selectedAnswers, restart);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      showResults();
    }
  }

  void restart() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 44, 42, 167),
                Color.fromARGB(255, 87, 85, 180),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
