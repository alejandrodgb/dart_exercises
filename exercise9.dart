// Generate a random number between 1 and 100. 
//Ask the user to guess the number, then tell them whether they guessed too low, too high, or exactly right.
// Keep track of how many guesses the user has taken, and when the game ends, print this out.

import 'dart:io';
import 'dart:math';

void main () {

int number = Random().nextInt(99) + 1;
bool incorrectGuess = true;
List<int> userGuesses = [];

stdout.write('Welcome to Guessing Numbers!\nGuess a whole number from 1 to 100.\n"Exit" to exit.\n');

while (incorrectGuess) {
  
  String? userEntry = stdin.readLineSync();
  print('Initial entry = $userEntry | random number = $number');

  
  if (userEntry == null || userEntry == '' || int.tryParse(userEntry)==null) {
    print('Incorrect entry. Please enter a number between 1 and 100.\n');
    continue;
  }
  if (userEntry.toLowerCase()=='exit') {
    print('Thank you for playing. Bye bye.\n');
    break;
  }
  int guess = int.parse(userEntry);
  userGuesses.add(guess);
  if (guess < number) {
    print('Your guess ($guess) was too low.\n');
  } else if (guess > number){
    print('Your guess ($guess) was too high.');
  } else {
    print('You got it right. Congratulations!');
    print('Your guesses were $userGuesses');
    incorrectGuess = false;
  }

}

}