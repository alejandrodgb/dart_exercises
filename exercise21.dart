/*
You, the user, will have in your head a number between 0 and 100. The program will guess a number, and you, the user, will say whether it is too high, too low, or your number.

At the end of this exchange, your program should print out how many guesses it took to get your number.
*/
import 'dart:io';
import 'dart:math';

void main() {
  int floor = 0;
  int ceiling = 100;
  int guess = Random().nextInt(ceiling+1);
  List<String> responseOptions = ['high','low','ok'];
  List<String> userFeedback = [];
  List<int> computerGuesses = [guess];

  stdout.write('Game has started. My first guess is $guess\n');

  while (true) {
    // Get user input options: high, low
    var userTip = stdin.readLineSync();
    
    // Check input validity
    if (userTip == null || !responseOptions.contains(userTip)) {
      print("Invalid answer, please enter 'high','low','ok'.\n");
      continue;
    }
    
    // Finish game if the number was guessed.
    if (userTip == 'ok') {
      print('Bye bye. Computer tries = ${computerGuesses.length}');
      break;
    }

    // Add feedback to the user feedback list
    userFeedback.add(userTip);

    // Adjust ceiling depending on whether the guess is a verified or an initial guess
    if (userTip == 'high') {
      if (userFeedback.contains('high')) {
        ceiling = guess;
      } else {
      ceiling = guess+1;
      }
    }

    // Adjust the floor depending on whether the guess is a verified or an initial guess
    if (userTip == 'low') {
      if (userFeedback.contains('low')) {
        floor = guess + 1;
      } else {
        floor = guess;
      }
    }
    
    // New guess
    if (ceiling == floor) {
      print('Answer must be $ceiling. Thank you for playing');
      break;     
    } else {
      guess = Random().nextInt(ceiling-floor) + floor;
    }
    print('My new guess is $guess');
    
    // Add guess to guesses list
    computerGuesses.add(guess);
  }
}