import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final void Function() startQuiz;

  const StartScreen(this.startQuiz, {super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final String logoAsset = 'assets/images/quiz-logo.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            logoAsset,
            width: 250,
            height: 400,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: widget.startQuiz,
            label: const Text(
              'Start Quiz!',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
