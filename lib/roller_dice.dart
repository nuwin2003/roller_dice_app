import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_dice_app/home.dart';

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() => _RollerDiceState();
}

class _RollerDiceState extends State<RollerDice> {
  var diceNumber = 1;
  //Text Edit Controllers
  final TextEditingController _playerOneName = TextEditingController();
  final TextEditingController _playerTwoName = TextEditingController();

  //Player Names
  String playerOneName = "Player One";
  String playerTwoName = "Player Two";

  //Round
  var round = 1;

  //Players Clicks
  var playerOneClicks = 0;
  var playerTwoClicks = 0;

  //Players Total
  var playerOneTotal = 0;
  var playerTwoTotal = 0;

  //Players Score
  List<int> playerOneScores = [];
  List<int> playerTwoScores = [];

  @override
  void initState() {
    super.initState();

    Future(_showAlertDialog);
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Set Player Names'),
              content: SizedBox(
                width: 300,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                        controller: _playerOneName,
                        decoration: const InputDecoration(
                            hintText: 'Enter Player One Name')),
                    TextField(
                      controller: _playerTwoName,
                      decoration: const InputDecoration(
                          hintText: 'Enter Player Two Name'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //Set entered names to variables
                          playerOneName = _playerOneName.text == ""
                              ? "Player One"
                              : _playerOneName.text;
                          playerTwoName = _playerTwoName.text == ""
                              ? "Player Two"
                              : _playerTwoName.text;

                          Navigator.of(context).pop();
                        },
                        child: const Text("Okay"))
                  ],
                ),
              ));
        });
  }

  bool isRoundsOver() {
    return round > 5 ? true : false;
  }

  bool isBothRoll() {
    return isPlayerOneRolls() & isPlayerTwoRolls();
  }

  bool isPlayerOneRolls() {
    return playerOneClicks + 1 == round ? false : true;
  }

  bool isPlayerTwoRolls() {
    return playerTwoClicks + 1 == round ? false : true;
  }

  int gameResults() {
    return playerOneTotal > playerTwoTotal ? 1 : 2;
  }

  //To reset the Game
  void resetGame() {
    setState(() {
      round = 1;
      playerOneClicks = 0;
      playerTwoClicks = 0;
      playerOneScores = [];
      playerTwoScores = [];
      playerOneTotal = 0;
      playerTwoTotal = 0;
    });
  }

  //Player Rolls Methods
  void playerOneRolls() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerOneScores.add(diceNumber);
      playerOneTotal += diceNumber;
      playerOneClicks++;
      if (isBothRoll()) {
        round++;
      }
    });
  }

  void playerTwoRolls() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      playerTwoScores.add(diceNumber);
      playerTwoTotal += diceNumber;
      playerTwoClicks++;
      if (isBothRoll()) {
        round++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage())),
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 18)),
            child: const Text('Back to Home')),
        const SizedBox(
          height: 20,
        ),
        Text('Round $round',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 50,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/dice-$diceNumber.png',
          width: 200,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: isPlayerOneRolls() | isRoundsOver()
                ? null
                : () => playerOneRolls(),
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            child: Text('$playerOneName rolls')),
        const SizedBox(height: 10),
        TextButton(
            onPressed: isPlayerTwoRolls() | isRoundsOver()
                ? null
                : () => playerTwoRolls(),
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 20)),
            child: Text('$playerTwoName rolls')),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: !isRoundsOver()
                ? null
                : () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(gameResults() == 1
                                ? "$playerOneName Won by ${playerOneTotal - playerTwoTotal} Marks!!!"
                                : "$playerTwoName Won by ${playerTwoTotal - playerOneTotal} Marks!!!"),
                            content: Text(
                                '$playerOneName Scores : $playerOneScores\n'
                                '$playerOneName Total : $playerOneTotal\n\n'
                                '$playerTwoName Scores : $playerTwoScores\n'
                                '$playerTwoName Total : $playerTwoTotal'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 227, 79, 79),
                                      foregroundColor: const Color.fromARGB(
                                          255, 229, 228, 235),
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text('Close')),
                              ElevatedButton(
                                  onPressed: !isRoundsOver()
                                      ? null
                                      : () => resetGame(),
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 236, 225, 225),
                                      foregroundColor: const Color.fromARGB(
                                          255, 63, 34, 177),
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text('Play Again!'))
                            ],
                          );
                        });
                  },
            style:
                TextButton.styleFrom(textStyle: const TextStyle(fontSize: 25)),
            child: const Text("See Results")),
      ],
    );
  }
}
