import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../models/yahtzeeGame.dart';

class ScoreCardWidget extends StatelessWidget {
  const ScoreCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<YahtzeeGame>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text(
            '----- Score Card -----',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        //For loop for each category widget
        for (final category in ScoreCategory.values)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${category.name}:\t\t\t\t\t'),
              GestureDetector(
                child: Text(
                  game.isCategoryUsed(category)
                      ? game.usedCategoryScores[category.name].toString()
                      : game.categoryScores[category.name].toString(),
                  style: game.isCategoryUsed(category)
                      ? const TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(
                          color: Colors.red,
                        ),
                ),
                //Used onTap to handle the conditions
                onTap: () {
                  if (!game.isCategoryUsed(category)) {
                    game.registerScore(
                        category, game.categoryScores[category.name]);
                  }
                  if (game.chanceLeft == 0) {
                    game.showGameOverDialog(context);
                  }
                },
              ),
            ],
          ),
      ],
    );
  }
}
