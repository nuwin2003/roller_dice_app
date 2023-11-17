import 'package:flutter/material.dart';
import 'package:roll_dice_app/app.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class HomePageDecoration extends StatelessWidget {
  const HomePageDecoration({super.key});

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
          child: const Center(child: HomePageIncludes()),
    );
  }
}


class HomePageIncludes extends StatelessWidget {
  const HomePageIncludes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/roller-dice-bg.png',
          width: 200
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
           onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const RollerDiceApp()),
             );
           },
           style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18)
           ),
           child: const Text("Play Roller Dice"),
        )
      ],
    );
  }
}