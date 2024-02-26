import 'package:flutter/material.dart';
import 'package:mp2/models/yahtzeeGame.dart';
import 'package:mp2/views/scoreCardWidget.dart';
import 'package:provider/provider.dart';
import 'diceWidget.dart';

class YahtzeeGameScreen extends StatelessWidget {
  const YahtzeeGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<YahtzeeGame>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yahtzee Game - Solo Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // INFO SECTION
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rolls Left: ${game.rollsLeft}',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  ' | Chances Left: ${game.chanceLeft}',
                  style: const TextStyle(fontSize: 24),
                )
              ],
            ),
            const SizedBox(height: 20),
            // DICE ROW WIDGET
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < 5; i++)
                  DiceWidget(
                    index: i,
                    isReserved: game.reservedDice[i],
                    onToggleReserved: () {
                      game.toggleReserved(i);
                    },
                  ),
              ],
            ),
            const SizedBox(height: 20),
            // SCORECARD WIDGET
            const ScoreCardWidget(),
            const SizedBox(height: 10),
            // TOTAL SCORE WIDGET
            Text(
              'Total Score: ${game.totalScore}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // ROLL DICE BUTTON
            ElevatedButton(
              onPressed: game.rollsLeft > 0
                  ? () {
                      game.rollDice();
                    }
                  : null,
              child: Text(
                  game.rollsLeft > 0 ? 'Roll Dice' : 'Select Score to Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
