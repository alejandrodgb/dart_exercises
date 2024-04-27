// Make a two-player Rock-Paper-Scissors game against computer.
// Ask for player's input, compare them, print out a message to the winner.

import 'dart:io';
import 'dart:math';

void main() {
  Map<String, String> killers = {
    "paper":"scissors",
    "scissors":"rock",
    "rock":"paper",
  };

  bool alive = true;
  var choices = ['paper','scissors','rocks'];
  String? p1Move;
  String? compMove;

  while (alive) {
    stdout.write('Welcome to paper, scissors, rock!\nPlayer, your move. Options: paper, scissors, rock\n("exit" to exit)\n');

    p1Move = stdin.readLineSync();

    if (p1Move != null) {
      p1Move = p1Move.toLowerCase();
    }

    if (choices.contains(p1Move)==false && p1Move != 'exit') {
      print('Incorrect entry. Please try again\n');
      continue;
    }

    if (p1Move == 'exit') {
      print('Thank you for playing, bye bye.');
      break;
    }

    compMove = choices[Random().nextInt(3)];

    print('User chose $p1Move, Computer chose $compMove');

    if (p1Move == compMove) {
      print('This is a tie! Try again.\n');
    } else if (killers[p1Move] == compMove) {
      print('$compMove kills $p1Move. Computer wins.\n');
      alive = false;
    } else {
      print('$p1Move kills $compMove. Player 1 wins.\n');
      alive = false;
    }
  }
}