import 'package:flutter/material.dart';
import 'package:roll_dice_app/gradient_container.dart';

class RollerDiceApp extends StatelessWidget {
  const RollerDiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 32, 58),
          title: const Text("L E T ' S   P L A Y"),
          centerTitle: true,
        ),
        body: const GradiantContainer(),
      )
    );
  }
}
