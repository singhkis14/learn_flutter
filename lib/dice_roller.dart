import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var diceState = 'assets/images/dice-1.png';

  void rollDice() {
    var diceNumber = Random().nextInt(6) + 1;
    setState(() {
      diceState = 'assets/images/dice-$diceNumber.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('DiceRoller build');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          diceState,
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          child: const Text('Roll...'),
        )
      ],
    );
  }
}
