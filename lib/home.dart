import 'package:flutter/material.dart';
import 'package:roll_dice_app/home_decoration.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 32, 58),
        title: const Text("H O M E   P A G E"),
        centerTitle: true,
      ),
      body: const Center(
        child: HomePageDecoration()
    )));
  }
}
