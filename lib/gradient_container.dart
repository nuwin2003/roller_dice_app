import 'package:flutter/material.dart';
import 'package:roll_dice_app/roller_dice.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradiantContainer extends StatelessWidget {
  const GradiantContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: beginAlignment,
                  end: endAlignment,
                  colors: [
                Color.fromARGB(255, 3, 132, 139),
                Color.fromARGB(255, 63, 34, 177)
              ])),
          child: const Center(child: RollerDice()),
        );
  }
}