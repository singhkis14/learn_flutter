import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final String logoAsset = 'assets/images/quiz-logo.png';

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
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
              onPressed: () {},
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
      ),
    );
  }
}
