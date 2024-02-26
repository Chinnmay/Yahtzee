import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/yahtzeeGame.dart';

class DiceWidget extends StatelessWidget {
  final int index;
  final bool isReserved; // for tracking reservation
  final Function() onToggleReserved; // Callback for reservation

  const DiceWidget({
    super.key,
    required this.index,
    required this.isReserved,
    required this.onToggleReserved,
  });

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<YahtzeeGame>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '${game.diceValues[index]}',
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Button to toggle the reservation status
        ElevatedButton(
          onPressed: () {
            onToggleReserved(); // Call the callback to toggle reservation
          },
          child: Text(isReserved ? 'Unreserve' : 'Reserve'),
        ),
      ],
    );
  }
}
