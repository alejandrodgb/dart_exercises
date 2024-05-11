/*
Exercise 24 & 25
*/

import 'dart:io';
import 'dart:math';

void main () {
  // Regular expressions to check for a word and a letter
  RegExp userWordCheck = RegExp(r'^[a-zA-Z]{2,}$');
  RegExp userLetterCheck = RegExp(r'^[a-zA-Z]$');

  // Int to track hangman
  int hangmanFails = 0;

  // List to save submitted letters
  List<String> userSubmissions = [];

  // Select the word for the user to play from scrabble dictionary
  String word = randomWord('sowpods.txt').toLowerCase();
  
  // Show the number of letters to the user
  String board = '_ ' * word.length;  
  print('Guess the word.\n$board');

  int remainingToGuess = word.length;

  // Main loop
  while (true) {
    stdout.write('Type your guess\n');

    // Read user input
    String userInput = (stdin.readLineSync() ?? '').toLowerCase();

    // Validate input
    String inputType = 'error';
    
    if (userLetterCheck.hasMatch(userInput)) {
      inputType = 'letter';
    }
    if (userWordCheck.hasMatch(userInput)) {
      inputType = 'word';
    }
    if (inputType == 'error') {
      print('Please enter a valid letter or word.');
      continue;
    }

    // Check if user has already submitted
    if (userSubmissions.contains(userInput)) {
      print('$userInput was already submitted. | $userSubmissions');
      continue;
    } else {
      userSubmissions.add(userInput);
    }
    
    bool checked = checkAnswer(userInput, word, inputType);
    
    if (checked && inputType == 'word') {
      print('You win, the word is $word');
      break;
    } else if (checked && inputType == 'letter') {
      board = redrawBoard(board, userInput, word);
      remainingToGuess = countOccurrences(board.split(' '), '_');
    } else {
      hangmanFails ++;
    }

    //print('While loop\nword $word | inputType: $inputType | userInput: $userInput | userSubmissions $userSubmissions | hangmanFails $hangmanFails | checked $checked | remainingCorrect $remainingToGuess');
    print('\n$board');
    print(drawHangman(hangmanFails));  
    print('Your guesses: $userSubmissions\n');

    if (remainingToGuess<=0) {
      print('You win. You guessed the word: $word.');
      break;
    }

    if (hangmanFails>=6) {
      print('You have been hanged. Game Over. The word was $word.');
      break;
    }
  }

}
/// Return a random word from the SOWPOD dictionary
String randomWord(String filePath) {
  var myFile = File(filePath);

  List<String> wordList = myFile.readAsLinesSync();

  return wordList[Random().nextInt(wordList.length)];
}

/// Check whether the user input is 
bool checkAnswer (String userInput, String target, String inputType) {

  switch (inputType) {
    case 'word':
      if (userInput==target) {
        return true;
      }
    case 'letter':
      if (target.contains(userInput)) {
        return true;
      }
  } 
  return false;
}


String redrawBoard (String board, String userInput, String word) {
  
  List<String> boardList = board.split(' ');
  
  for (var i = 0; i < word.length; i++) {
    if (word[i] == userInput) {
      boardList[i] = userInput; 
    }
  }

  return boardList.join(' ');
}

String drawHangman (int hangmanFails) {
  // Hangman drawing map
  Map<int, String> hangman = {
    0:'''
      ----
      |  |
      |
      |
      |
      |
      ---------
      ''',
    1:'''
      ----
      |  |
      |  O
      |
      |
      |
      ---------
      ''',
    2:'''
      ----
      |  |
      |  O
      |  |
      |
      |
      ---------
      ''',
    3:'''
      ----
      |  |
      |  O
      |  |
      | /
      |
      ---------
      ''',
    4:'''
      ----
      |  |
      |  O
      |  |
      | / \\
      |
      ---------
      ''',
    5:'''
      ----
      |  |
      |  O
      |  |\\
      | / \\
      |
      ---------
      ''',
    6:'''
      ----
      |  |
      |  O
      | /|\\
      | / \\
      |
      ---------
      ''',
  };
  return hangman[hangmanFails]!;
}

int countOccurrences(List<String> board, String value) {
  int count = 0;
  for (int i = 0; i < board.length; i++) {
    if (board[i] == value) {
      count++;
    }
  }
  return count;
}