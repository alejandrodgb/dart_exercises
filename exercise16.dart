// Create a program that will play the “cows and bulls” game with the user. The game works like this:
// Randomly generate a 4-digit number. 
// Ask the user to guess a 4-digit number. 
// For every digit the user guessed correctly in the correct place, they have a “cow”. 
// For every digit the user guessed correctly in the wrong place is a “bull.” 
// Every time the user makes a guess, tell them how many “cows” and “bulls” they have. 
// Once the user guesses the correct number, the game is over. 
// Keep track of the number of guesses the user makes throughout the game and tell the user at the end.

import 'dart:io';
import 'dart:math';

void main () {

  // Generate the random number for user to guess
  String target = (Random().nextInt(8999)+1000).toString();
  var playing = true;
  var stats = {'Tries':0,'Cows':0,'Bulls':0};

  stdout.write("Guess the number! For every digit you guess correctly in the right place you will get a cow, for every number you guess right in the wrong place you will get a bull. Let's play.\n");

  // While loop to keep checking user input until the game is over
  while (playing) {
    // Read user input
    var userGuess = stdin.readLineSync();
    print('User guess = $userGuess | number = $target');

    // Check whether the user wants to exit
    if (userGuess=='exit') {
      print('Bye bye!');
      break;
    }
    
    // Check input is valid
    if (int.tryParse(userGuess ?? '')==null || userGuess == null || userGuess.length !=4) {
      print('Incorrect entry. Please enter a four digit number');
      continue;
    }

    // Check whether the user got it right in the first go
    if (userGuess == target) {
      print('Your guess was correct!\nStats: $stats');
      break;
    }

    
    var tip = cowsAndBulls(userGuess, target);
    var turnResults = playResults(tip);
    
    print(tip);
    print(turnResults);


    stats.update('Tries', (value) => value += 1);
    stats.update('Cows', (value) => value += turnResults['c']!);
    stats.update('Bulls', (value) => value += turnResults['b']!);
    
    print("Your guess was incorrect, here's how you did $tip");
    print('Here are your overall stats: ${stats}');
  }

}

List<String> cowsAndBulls (String guess, String target) {
  var tip = ['n','n','n','n'];

  for (var i = 0; i < 4; i++) {
    if (target[i] == guess[i]) {
      tip[i] = 'c';
    } else if (target.contains(guess[i])) {
      tip[i] = 'b';
    }
  }
  return tip;
}

Map<String,int> playResults (List<String> tip) {
  Map<String, int> results = {'c':0,'n':0,'b':0};
  tip.forEach((e) {
    if (!results.containsKey(e)) {
      results[e] = 1;
    } else {
      results[e] = results[e]! + 1;
    }
  });
  return results;
}