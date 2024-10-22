import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final void Function() onAnswer;

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAnswer,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
