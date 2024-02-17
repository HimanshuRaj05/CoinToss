import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentChoice = 0;
  String currentCoinSide = '';
  List<String> imagesPath = ['lib/images/heads.png', 'lib/images/tails.png'];

  void tossCoin() {
    int min = 0;
    int max = 2;

    Random random = Random();

    int randomNumber = min + random.nextInt(max - min);

    setState(() {
      currentChoice = randomNumber;

      if (currentChoice == 0) {
        currentCoinSide = 'Heads';
      } else {
        currentCoinSide = 'Tails';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Coin flip',
          style: TextStyle(color: Colors.grey.shade100),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Image.asset(
            imagesPath[currentChoice],
            height: 200,
            width: 200,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          currentCoinSide,
          style: TextStyle(
              color: Colors.grey.shade100,
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: GestureDetector(
            onTap: () => tossCoin(),
            child: Container(
              width: double.maxFinite,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  'Toss coin',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
