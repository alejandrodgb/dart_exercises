# README

## Source
[[Dart exercises for beginners](https://hackmd.io/@kuzmapetrovich/S1x90jWGP)]

## Exercises
### Exercise 1
Create a program that asks the user to enter their name and their age. Print out a message that tells how many years they have to be 100 years old.

<details> 
<summary> Solution </summary>

``` dart
Solution
import 'dart:io';

void main() {    
    stdout.write("What's your name? ");
    String name = stdin.readLineSync();

    print("Hi, $name! What is your age?");
    int age = int.parse(stdin.readLineSync());

    int yearsToHunderd = 100 - age;
    print("$name, You have $yearsToHunderd years to be 100");
}
```

</details>

### Exercise 2
Ask the user for a number. Depending on whether the number is even or odd, print out an appropriate message to the user.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {    
    stdout.write("Hi, please choose a number: ");
    int number = int.parse(stdin.readLineSync());
    
    if (number % 2 == 0) {
        print("Chosen number is even");
    }
    else {
        print("Chosen number is odd");
    }
} 
```
</details>

### Exercise 3
Take a list, say for example this one:
  `a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]`
and write a program that prints out all the elements of the list that are less than 5.

<details>
<summary>Solution</summary>

``` dart
void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  for (var i in a) {
    if (i < 5) {
      print(i);
    }
  }
  
  // One liner
  print([for (var i in a) if (i < 5) i]);
}
```
</details>

### Exercise 4
Create a program that asks the user for a number and then prints out a list of all the divisors of that number.

If you don’t know what a divisor is, it is a number that divides evenly into another number. For example, 13 is a divisor of 26 because 26 / 13 has no remainder.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  stdout.write("Please choose a number: ");
  int number = int.parse(stdin.readLineSync());
  for (var i = 1; i <= number; i++) {
    if (number % i == 0) {
      print(i);
    }
  }
}
```
</details>

### Exercise 5
Take two lists, for example:
```
  a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

  b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
```
and write a program that returns a list that contains only the elements that are common between them (without duplicates). Make sure your program works on two lists of different sizes.

<details>
<summary> Solution </summary>

```dart
void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 89];
  Set<int> c = {};

  for (var i in a) {
    for (var j in b) {
      if (i == j) {
        c.add(i);
      }
    }
  }
  print(c.toList());

  // One liner using set intersections
  print(Set.from(a).intersection(Set.from(b)).toList());
}
```
</details>

### Exercise 6
Ask the user for a string and print out whether this string is a palindrome or not.

A palindrome is a string that reads the same forwards and backwards.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  
  stdout.write("Please give a word: ");
  String input = stdin.readLineSync().toLowerCase();
  String revInput = input.split('').reversed.join('');
  
  // Ternary operator
  input == revInput
      ? print("The word is palindrome")
      : print("The word is not a palindrome");
}
```
</details>

### Exercise 7
Let’s say you are given a list saved in a variable:
```
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]. 
```
Write a Dart code that takes this list and makes a new list that has only the even elements of this list in it.

<details>
<summary> Solution </summary>

``` dart
void main() {
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  int i = 0;
  List<int> l = [];

  for (var e in a) {
    if (++i % 2 == 0) {
      l.add(e);
    }
  }
  print(l);
  
  // One liner
  print([for (var e in a) if (++i % 2 == 0) e]);
}
```
</details>

### Exercise 8
Make a two-player Rock-Paper-Scissors game against computer.

Ask for player's input, compare them, print out a message to the winner.
<details>
<summary> Solution </summary>

``` dart
import 'dart:io';
import 'dart:math';

void main() {
  print("Welcome to Rock, Paper, Scissors\nType 'exit' to stop the game");
  final random = Random();

  // Rules of the game
  Map<String, String> rules = {
    "rock": "scissors",
    "scissors": "paper",
    "paper": "rock"
  };

  // Initial score
  int user = 0;
  int comp = 0;

  // Options for computer to choose
  List<String> options = ["rock", "paper", "scissors"];

  // Actual game
  while (true) {
    String compChoice = options[random.nextInt(options.length)];
    stdout.write("\nPlease choose Rock, Paper or Scissors: ");
    String userChoice = stdin.readLineSync().toLowerCase();

    if (userChoice == "exit") {
      print("\nYou: $user Computer: $comp\nBye Bye!");
      break;
    }

    if (!options.contains(userChoice)) {
      print("Incorrect choice");
      continue;
    } else if (compChoice == userChoice) {
      print("We have a tie!");
    } else if (rules[compChoice] == userChoice) {
      print("Computer wins: $compChoice vs $userChoice");
      comp += 1;
    } else if (rules[userChoice] == compChoice) {
      print("You win: $userChoice vs $compChoice");
      user += 1;
    }
  }
}
```
</details>

### Exercise 9
Generate a random number between 1 and 100. Ask the user to guess the number, then tell them whether they guessed too low, too high, or exactly right.

Keep track of how many guesses the user has taken, and when the game ends, print this out.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';
import 'dart:math';

void main() {
  print("Type exit to quit the game");
  guessingGame();
}

guessingGame() {
  final random = Random();
  int randNumber = random.nextInt(100);
  int attempt = 0;

  while (true) {
    attempt += 1;
    stdout.write("Please choose a number between 0 and 100: ");
    String chosenNumber = stdin.readLineSync();

    // Make sure user does not go out of limits
    if (chosenNumber.toLowerCase() == "exit") {
      print("\nBye");
      break;
    } else if (int.parse(chosenNumber) > 100) {
      print("Please do not go over 100");
      continue;
    }

    // Main logic
    if (int.parse(chosenNumber) == randNumber) {
      print("Bingo! You tried $attempt times\n");
      continue;
    } else if (int.parse(chosenNumber) > randNumber) {
      print("You are higher");
      continue;
    } else {
      print("You are lower");
      continue;
    }
  }
}
```
</details>

### Exercise 10
Ask the user for a number and determine whether the number is prime or not.

Do it using a function
<details> 
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  stdout.write("Please give us a number: ");
  int chosenNumber = int.parse(stdin.readLineSync());

  checkPrime(chosenNumber);
}

void checkPrime(int number) {
  // List comprehensions
  List<int> a = [
    for (var i = 1; i <= number; i++)
      if (number % i == 0) i
  ];

  // Check for prime
  a.length == 2
      ? print("The chosen number is a prime")
      : print("The chosen number is not a prime");
}
```
</details>

### Exercise 11
Write a program that takes a list of numbers for example

```
a = [5, 10, 15, 20, 25]
```
and makes a new list of only the first and last elements of the given list. For practice, write this code inside a function.

<details>
<summary> Solution </summary>

``` dart
import 'dart:math';

void main() {
  // Initialize the random list
  final random = Random();
  List<int> randList = List.generate(10, (_) => random.nextInt(100));

  // Pass it to the function
  print(randList);
  print(newList(randList));
}

// Function that returns the first and the last element of given list
List<int> newList(List<int> initialList) {
  return [initialList.first, initialList.last];
}
```
</details>

### Exercise 12
Write a program that asks the user how many Fibonnaci numbers to generate and then generates them. Take this opportunity to think about how you can use functions.

Make sure to ask the user to enter the number of numbers in the sequence to generate.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  stdout.write("How many Fibonacci numbers do you want? ");
  int chosenNumber = int.parse(stdin.readLineSync());

  List<int> result = fibonacciNumbers(chosenNumber);
  print(result);
}

// Function to calulcate the Fibonacci numbers
List<int> fibonacciNumbers(int chosenNumber) {
  List<int> fibList = [1, 1];

  for (var i = 0; i < chosenNumber; i++) {
    fibList.add(fibList[i] + fibList[i + 1]);
  }
  return fibList;
}
```
</details>

### Exercise 13
Write a program (function) that takes a list and returns a new list that contains all the elements of the first list minus all the duplicates.

<details>
<summary> Solution </summary>

``` dart
import 'dart:math';

void main() {
  final random = Random();
  List<int> randList = List.generate(10, (_) => random.nextInt(10));

  print("Initial list is $randList\n");
  print("Cleaned list is ${removeDuplicates(randList)}");
}

List<int> removeDuplicates(List<int> initialList) {
  return initialList.toSet().toList();
}
```
</details>

### Exercise 14
Write a program (using functions!) that asks the user for a long string containing multiple words. Print back to the user the same string, except with the words in backwards order.

For example, say I type the string:
```
  My name is Michele
```
Then I would see the string:
```
  Michele is name My
```
<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  stdout.write("Please give a sentence: ");
  String sentence = stdin.readLineSync();

  reverseSentence(sentence);
}

void reverseSentence(String sentence) {
  /* Split the sentence into a list of words
  Reverse the list, then join the words back */
  String a = sentence.split(" ").reversed.toList().join(" ");
  print(a);
}
```
</details>

### Exercise 15
Write a password generator in Dart. Be creative with how you generate passwords - strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols. The passwords should be random, generating a new password every time the user asks for a new password. Include your run-time code in a main method.

Ask the user how strong they want their password to be. For weak passwords, pick a word or two from a list.

Do not use the generated password in your real accounts. Use 1password.

<details>
<summary> Solution </summary>

``` dart
import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  stdout.write("How strong a password do you want? Weak, Medium or Strong: ");
  String choice = stdin.readLineSync().toLowerCase();

  passwordGenerator(choice);
}

// Create a random sequence of characters
void shuffleGenerator(int strength) {
  final random = Random.secure();
  List<int> intList = List.generate(strength, (_) => random.nextInt(255));
  List charList = base64UrlEncode(intList).split('').toList();
  charList.shuffle();
  print("\nYour password is: ${charList.join('')}\n");
}

void passwordGenerator(String strength) {
  if (strength == "weak") {
    shuffleGenerator(5);
  } else if (strength == "medium") {
    shuffleGenerator(15);
  } else if (strength == "strong") {
    shuffleGenerator(25);
  } else {
    print("Incorrect word is given");
  }
}
```
</details>

### Exercise 16
Create a program that will play the “cows and bulls” game with the user. The game works like this:

Randomly generate a 4-digit number. Ask the user to guess a 4-digit number. For every digit the user guessed correctly in the correct place, they have a “cow”. For every digit the user guessed correctly in the wrong place is a “bull.”
Every time the user makes a guess, tell them how many “cows” and “bulls” they have. Once the user guesses the correct number, the game is over. Keep track of the number of guesses the user makes throughout the game and tell the user at the end.
<details>
<summary> Solution </summary>

``` dart
import 'dart:io';
import 'dart:math';

void main() {
  /* Generate random number
  Range is between 1000 and 9999 */
  final random = Random();
  String randomNumber = (1000 + random.nextInt(9999 - 1000)).toString();
  print(randomNumber);

  stdout.write("Welcome to Cows and Bulls\nType 'exit' to stop the game\n");

  int attempts = 0;

  // Actual game
  while (true) {
    int cows = 0;
    int bulls = 0;
    attempts += 1;

    stdout.write("\nPlease choose a four digit number: ");
    String chosenNumber = stdin.readLineSync();

    // Conditions to check if the game is over
    if (chosenNumber == randomNumber) {
      print("Bullseye! You took $attempts attempts");
      break;
    } else if (chosenNumber == "exit") {
      print("Bye bye!");
      break;
    } else if (chosenNumber.length != randomNumber.length) {
      print("Incorrect number. Make sure to give 4 digit number");
      continue;
    }

    /* If a digit is in the same index increase the cow
    If it is somewhere else increase the bull*/
    for (var i = 0; i < randomNumber.length; i++) {
      if (chosenNumber[i] == randomNumber[i]) {
        cows += 1;
      } else if (randomNumber.contains(chosenNumber[i])) {
        bulls += 1;
      }
    }
    print("\nAttempts: $attempts \nCows: $cows, Bulls: $bulls");
  }
}
```
</details>

### Exercise 17
Time for some fake graphics! Let’s say we want to draw game boards that look like this:
```
 --- --- --- 
|   |   |   | 
 --- --- ---  
|   |   |   | 
 --- --- ---  
|   |   |   | 
 --- --- --- 
```

This one is 3x3 (like in tic tac toe).

Ask the user what size game board they want to draw, and draw it for them to the screen using Dart’s print statement.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  stdout.write("What square size do you want: ");
  int userChoice = int.parse(stdin.readLineSync());
  print("Here is a $userChoice by $userChoice board: \n");

  drawBoard(userChoice);
}

void drawBoard(int squareSize) {
  // Basic building blocks
  String rowLines = " ---";
  String colLines = "|   ";

  // For loop for drawing the board
  for (var i = 0; i < squareSize; i++) {
    print(rowLines * squareSize);
    print(colLines * (squareSize + 1));
  }

  // Add the last line to the board
  print("${rowLines * squareSize}\n");
}
```
</details>

### Exercise 18
As you may have guessed, we are trying to build up to a full tic-tac-toe board.
For now, we will simply focus on checking whether someone has WON the game, not worrying about how the moves were made.

If a game of Tic Tac Toe is represented as a list of lists, like so:

```
game = [[1, 2, 0],
        [2, 1, 0],
        [2, 1, 1]]
```

where a 0 means an empty square, a 1 means that player 1 put their token in that space, and a 2 means that player 2 put their token in that space.

Your task: given a 3 by 3 list of lists that represents a Tic Tac Toe game board, tell whether anyone has won, and tell which player won, if any.

A Tic Tac Toe win is 3 in a row - either in a row, a column, or a diagonal. Don’t worry about the case where TWO people have won - assume that in every board there will only be one winner.

<details>
<summary> Solution </summary>

``` dart
void main() {
  List<List<int>> finalBoard = [
    [1, 0, 0],
    [0, 1, 0],
    [2, 1, 0]
  ];

  theGame(finalBoard);
}

void theGame(List<List<int>> board) {
  /*
  Accepts: list of list of integers
  Does: first checks the rows, then columns then diagonals
        and prints the results if conditions are met
  Returns: nothing
  */
  if (rowCheck(board)) {
    print("Row wins");
  } else if (rowCheck(transpose(board))) {
    print("Column wins");
  } else if (rowCheck(diagonals(board))) {
    print("Diagonal wins");
  } else {
    print("Draw!");
  }
}

bool rowCheck(List<List<int>> board) {
  /* 
  Accepts: list of lists of integers
  Does: checks if any row consists of the same values
  Returns: true if any, false otherwise 
  */
  for (List<int> row in board) {
    if (row.toSet().length == 1) {
      return true;
    }
  }
  return false;
}

List<List<int>> transpose(List<List<int>> board) {
  /* 
  Accepts: list of lists of integers
  Does: transposes it so each row becomes a column
  Returns: the transposed list of lists
  */
  return [
    for (var i = 0; i < board.length; i++) [for (List<int> r in board) r[i]]
  ];
}

List<List<int>> diagonals(List<List<int>> board) {
  /* 
  Accepts: list of list of integers
  Does: takes both diagonals and adds them to a new list
  Returns: new list of lists
  
  Left-to-right diagonal is fairly easy.
  To take the right-to-left diagonal, first we reverse the each row
  then take left-to-right diagonal one more time
  */
  return [
    [for (var i = 0; i < board.length; i++) board[i][i]],
    [for (var i = 0; i < board.length; i++) board[i].reversed.toList()[i]]
  ];
}
```
</details>

### Exercise 19
In a previous exercise we explored the idea of using a list of lists as a “data structure” to store information about a tic tac toe game. In a tic tac toe game, the “game server” needs to know where the Xs and Os are in the board, to know whether player 1 or player 2 (or whoever is X and O) won.

There has also been an exercise (17) about drawing the actual tic tac toe gameboard using text characters.

The next logical step is to deal with handling user input. When a player (say player 1, who is X) wants to place an X on the screen, they can’t just click on a terminal. So you are going to approximate this clicking simply by asking the user for a coordinate of where they want to place their piece.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  // Empty board
  List<List<String>> initialBoard =
      List.generate(3, (_) => List.generate(3, (_) => ' '));
  drawBoard(initialBoard, 2);
}

void drawBoard(List<List<String>> board, int currentUser) {
  /*
  Takes an initial board and populates it 
  either with X or with O depending on
  the currentUser
  */
  var move;
  currentUser == 1 ? move = 'X' : move = 'O';

  stdout.write("Please choose a coordinate: ");
  List choice = stdin.readLineSync().split(" ");
  board[int.parse(choice[0])][int.parse(choice[1])] = move;
  print(board);
}
```
</details>

### Exercise 20
In 3 previous exercises, we built up a few components needed to build a Tic Tac Toe game in Dart:

Draw the Tic Tac Toe game board
Checking whether a game board has a winner
Handle a player move from user input
The next step is to put all these three components together to make a two-player Tic Tac Toe game!

Your challenge in this exercise is to use the functions from those previous exercises all together in the same program to make a two-player game that you can play with a friend. There are a lot of choices you will have to make when completing this exercise, so you can go as far or as little as you want with it.

Here are a few things to keep in mind:

You should keep track of who won - if there is a winner, show a congratulatory message on the screen.
If there are no more moves left, don’t ask for the next player’s move!
Keep in mind, the current solution is not just a copy pase of functions from the previous exercises, but rather a rework of them.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  // Empty board
  List<List<String>> theBoard =
      List.generate(3, (_) => List.generate(3, (_) => ' '));

  // Print out the rules and instructions
  startGame(theBoard);

  // Alternate between users: 1 or 2
  int a = 1, user = 2, tmp;

  while (true) {
    // Establish the current user
    tmp = a;
    a = user;
    user = tmp;
    currentBoard(theBoard);

    // Ask for coordinates
    stdout.write("Please User $user, choose a coordinate: ");
    List userChoice = stdin.readLineSync().split(" ");
    if (userChoice.join(" ") == "exit") {
      print("\nGame quitted in the following state: ");
      break;
    }

    // Populate the board with the choice
    theBoard = makeMove(theBoard, user, userChoice);

    // Check the game
    if (rowCheck(theBoard)) {
      print("\nUser $user: Row win!");
      break;
    } else if (rowCheck(transpose(theBoard))) {
      print("\nUser $user: Column win!");
      break;
    } else if (rowCheck(diagonals(theBoard))) {
      print("\nUser $user: Diagonal win!");
      break;
    } else if (drawGame(theBoard) == 1) {
      print("\nThe game ended in draw!");
      break;
    }
  }

  // Current state of the game
  currentBoard(theBoard);
}

void startGame(List<List<String>> board) {
  print("""\n
  Welcome to Tic Tac Toe!
  The game is for two users: User 1 (X) and User 2 (O).
  To make a move, give the coordinates of the board separated by space.
  For instance, 0 0 is the top left corner, 1 1 is the middle cell
  and 2 2 is the bottom right corner and so on.
  If you want to quite the game, type exit.
  """);
}

void currentBoard(List<List<String>> board) {
  /*
  Draws the current board
  Rows and borders are hard coded
  Feel free to reimplement them with for loops
  But for exercise purposes it suffices
  */
  String row1 = "| ${board[0][0]} | ${board[0][1]} | ${board[0][2]} |";
  String row2 = "| ${board[1][0]} | ${board[1][1]} | ${board[1][2]} |";
  String row3 = "| ${board[2][0]} | ${board[2][1]} | ${board[2][2]} |";
  String border = "\n --- --- ---\n";

  print(border + row1 + border + row2 + border + row3 + border);
}

List<List<String>> makeMove(
    List<List<String>> board, int currentUser, List choice) {
  /*
  Takes an initial board and populates it 
  either with X or with O depending on
  the currentUser
  */
  var move;
  currentUser == 1 ? move = 'X' : move = 'O';

  board[int.parse(choice[0])][int.parse(choice[1])] = move;
  return board;
}

bool rowCheck(List<List<String>> board) {
  /* 
  Accepts: list of lists of ints
  Does: checks if any row consists of the same values
  Returns: true if any, false otherwise 
  */
  for (List<String> row in board) {
    if (row.toSet().length == 1 && row.any((e) => e != ' ')) {
      return true;
    }
  }
  return false;
}

List<List<String>> transpose(List<List<String>> board) {
  /* 
  Accepts: list of lists of integers
  Does: transposes it so each row becomes a column
  Returns: the transposed list of lists
  */
  return [
    for (var i = 0; i < board.length; i++) [for (List<String> r in board) r[i]]
  ];
}

List<List<String>> diagonals(List<List<String>> board) {
  /* 
  Accepts: list of list of integers
  Does: takes both diagonals and adds them to a new list
  Returns: new list of lists
  
  Left-to-right diagonal is fairly easy.
  To take the right-to-left diagonal, first we reverse the each row
  then take left-to-right diagonal one more time
  */
  return [
    [for (var i = 0; i < board.length; i++) board[i][i]],
    [for (var i = 0; i < board.length; i++) board[i].reversed.toList()[i]]
  ];
}

int drawGame(List<List<String>> board) {
  /*
  Counts the number of empty cells in the board
  If the count is 1 and game has not ended
  it means the game is a draw
  */
  int count = 0;
  for (var row in board) {
    for (var e in row) {
      if (e == " ") {
        count += 1;
      }
    }
  }
  return count;
}
```
</details>

### Exercise 21
You, the user, will have in your head a number between 0 and 100. The program will guess a number, and you, the user, will say whether it is too high, too low, or your number.

At the end of this exchange, your program should print out how many guesses it took to get your number.

<details>
<summary> Solution </summary>

``` dart
import 'dart:io';
import 'dart:math';

void main() {
  print("""\n
  Hello boss. I am your laptop.
  Please, think of a number between 0 and 100.
  I will try to guess it and blow your mind.

  If my guess is too low, type "low". If I am too high, type "high".
  If I guess your number correctly, type "yes".
  """);

  compGuess();
}

void compGuess() {
  /* 
  Generates a list from 0 to 100
  Picks a random number from it
  Asks the user if the guess is correct
  If low, removes the lower numbers from the list
  If high, removes the higher numbers from the list
  Keeps repeating it until it guesses correctly
  */

  final random = Random();
  List<int> numList = List.generate(101, (i) => i);
  int guess = numList[random.nextInt(numList.length)];
  int count = 0;

  while (true) {
    count += 1;

    stdout.write("\nIs $guess your number? ");
    String response = stdin.readLineSync().toLowerCase();

    if (response == "yes") {
      print("\nI got it! Attempts: $count\n");
      break;
    } else if (response == "low") {
      numList = numList.where((e) => e > guess).toList();
      guess = numList[random.nextInt(numList.length)];
    } else if (response == "high") {
      numList = numList.where((e) => e < guess).toList();
      guess = numList[random.nextInt(numList.length)];
    }
  }
}
```
</details>

### Exercise 22
Implement a function that takes as input three variables, and returns the largest of the three. Do this without using the Dart max() function!

The goal of this exercise is to think about some internals that Dart normally takes care of for us. All you need is some variables and if statements!

<details>
<summary> Solution </summary>

``` dart
void main() {
  var max;
  int a = 32;
  int b = 12;
  int c = 64;

  if (a > b) {
    max = a;
  } else {
    max = b;
  }

  if (c > max) {
    max = c;
  }
  print(max);

  // Another method, which will work with any length
  List l = [a, b, c, 4, 5, 2, 1];
  l.sort();
  print(l.last);
}
```
</details>

### Exercise 23
In this exercise, the task is to write a function that picks a random word from a list of words from the SOWPODS dictionary.

Download this file and save it in the same directory as your Dart code. Each line in the file contains a single word.

Use the Dart random library for picking a random word.

Solution
import 'dart:io';
import 'dart:math';

void main() {
  String word = randomWord("sowpods.txt");
  print(word);
}

String randomWord(String txt) {
  /*
  Reads the given file as a list
  Then picks a random word from it
  */
  final random = Random();
  var file = File(txt);
  List<String> wordList = file.readAsLinesSync();
  String word = wordList[random.nextInt(wordList.length)];
  return word;
}

### Exercise 24
In the game of Hangman, a clue word is given by the program that the player has to guess, letter by letter. The player guesses one letter at a time until the entire word has been guessed. (In the actual game, the player can only guess 6 letters incorrectly before losing).

Let’s say the word the player has to guess is EVAPORATE.
For this exercise:

Write the logic that asks a player to guess a letter and displays letters in the clue word that were guessed correctly. For now, let the player guess an infinite number of times until they get the entire word.

As a bonus, keep track of the letters the player guessed and display a different message if the player tries to guess that letter again.

Remember to stop the game when all the letters have been guessed correctly! Don’t worry about choosing a word randomly or keeping track of the number of guesses the player has remaining - we will deal with those in a future exercise.
<details>
    <summary> Solution </summary>

``` dart
import 'dart:io';

void main() {
  // Pick a random word
  String randomWord = "EVAPORATE";
  hangman(randomWord);
}

void hangman(String word) {
  /*
  Takes the word and create a clue
  Ask the user to guess a letter
  Check if the letter is in the word
  If yes, put the letter in the same index of the clue
  */

  List clue = ("___ " * word.length).split(" ");

  // Initial state
  print(clue.join(" "));
  int count = 0;

  // Game
  while (true) {
    // User input
    count += 1;
    stdout.write("\nPlease guess a letter: ");
    String choice = stdin.readLineSync().toUpperCase();

    /* 
    Allow user to type the whole word or exit the game
    Any other incorrect case, demand a single letter */
    if (choice == word) {
      print("\nBingo! Attemps: $count");
      break;
    } else if (choice == "EXIT") {
      print("\nBye bye!\n");
      break;
    } else if (choice.length > 1) {
      print("\nNope!");
      continue;
    }

    // Check the word for guessed letter
    for (var i = 0; i < word.length; i++) {
      if (clue[i] == choice) {
        continue;
      } else if (word[i] == choice) {
        clue[i] = choice;
      }
    }

    // Current state
    print(clue.join(" "));

    // End the game if there are no more guesses
    if (clue.join("") == word) {
      print("\nBingo! Attemps:$count\n");
      break;
    }
  }
}
```
</details>

### Exercise 25
In this exercise, we will finish building Hangman. In the game of Hangman, the player only has 6 incorrect guesses (head, body, 2 legs, and 2 arms) before they lose the game.

In Part 1, we loaded a random word list and picked a word from it.
In Part 2, we wrote a logic for guessing the letter and displaying that information to user.
In this exercise, we have to put it all together and add logic for handling guesses.

Copy your code from Parts 1 and 2 into a new file as a starting point. Now add the following features:

Only let the user guess 6 times, and tell the user how many guesses they have left.
Keep track of the letters user guessed. If the user guesses a letter they had already guessed, don’t penalize them - let them guess again.
Optional additions:

When the player wins or loses, let them start a new game.
Rather than telling the user "You have 4 incorrect guesses left", display some picture art for the Hangman. This is challenging - do the other parts of the exercise first!
Your solution will be a lot cleaner if you make use of functions to help you!

<details>
    <summary> Solution </summary>

``` dart
import 'dart:io';
import 'dart:math';

void main() {
  // Pick a random word
  String theWord = randomWord("sowpods.txt");

  intro();
  hangman(theWord);
}

void hangman(String word) {
  /*
  Takes the word and create a clue
  Ask the user to guess a letter
  Check if the letter is in the word
  If yes, put the letter in the same index of the clue
  */

  List clue = ("___ " * word.length).split(" ");

  // Initial state
  print(clue.join(" "));
  int count = 0;
  int attempts = word.length + 1;
  List history = [];

  // Game
  while (true) {
    count += 1;
    attempts -= 1;

    // User input
    stdout.write("\nPlease guess a letter: ");
    String choice = stdin.readLineSync().toUpperCase();
    if (history.contains(choice)) {
      print("\nYou already tried this letter!");
      attempts += 1;
    } else {
      history.add(choice);
    }

    /* 
    Allow user to type the whole word or exit the game
    Any other incorrect case, demand a single letter */
    if (choice == word) {
      print("\nBingo! Attemps: $count");
      break;
    } else if (choice == "EXIT") {
      print("\nBye bye!\n");
      break;
    } else if (choice.length > 1) {
      attempts += 1;
      print("\nNope! Attemps left: $attempts");
      continue;
    } else if (attempts < 1) {
      print("\nAttemps left: $attempts. \nGame over!");
      print("\nThe word was: $word");
      break;
    }

    // Check the word for guessed letter
    for (var i = 0; i < word.length; i++) {
      if (word[i] == choice) {
        clue[i] = choice;
      }
    }
    print("\nAttempts left: $attempts");

    // Current state
    print(clue.join(" "));

    // End the game if there are no more guesses
    if (clue.join("") == word) {
      print("\nBingo! Attemps:$count\n");
      break;
    }
  }
}

String randomWord(String txt) {
  /*
  Reads the given file as a list
  Then picks a random word from it
  */
  final random = Random();
  var file = File(txt);
  List<String> wordList = file.readAsLinesSync();
  String word = wordList[random.nextInt(wordList.length)];
  return word;
}

void intro() {
  print("""\n
  Welcome to Hangman!
  We prepared a word for you.
  You have 6 attempts to guess it correctly
  You can type the whole word anytime before attempts are over
  To quit the game type "exit"
  """);
}
```
</details>

### Exercise 26
For this exercise, we will keep track of when our friend’s birthdays are, and be able to find that information based on their name.

Create a dictionary (in your file) of names and birthdays. When you run your program it should ask the user to enter a name, and return the birthday of that person back to them. The interaction should look something like this:

```
>>> Welcome to the birthday dictionary. We know the birthdays of:
Albert Einstein
Benjamin Franklin
Ada Lovelace
>>> Who's birthday do you want to look up?
Benjamin Franklin
>>> Benjamin Franklin's birthday is 01/17/1706.
```

<details>
    <summary>Solution</summary>

``` dart 
import 'dart:io';

void main() {
  // Map of birthdays of people
  Map<String, Object> birthdays = {
    "Albert Einstein": "14/03/1879",
    "Benjamin Franklin": "17/01/1706",
    "Ada Lovlace": "10/12/1815",
  };

  print("\nHello there!. We know the birthdays of the following people: \n");

  birthdays.forEach((key, value) {
    print(key);
  });

  stdout.write("\nWho's birthday do you want to know? ");
  String choice = stdin.readLineSync();

  print("\n$choice's birthday is ${birthdays[choice]}\n");
}
```
</details>

### Exercise 27
In the previous exercise we created a dictionary of famous scientists’ birthdays.

In this exercise, modify your program from Part 1 to load the birthday dictionary from a JSON file on disk, rather than having the dictionary defined in the program.

Bonus:

Ask the user for another scientist’s name and birthday to add to the dictionary, and update the JSON file you have on disk with the scientist’s name. If you run the program multiple times and keep adding new names, your JSON file should keep getting bigger and bigger.

<details>
    <summary> Solution </summary>

``` dart
import 'dart:io';
import 'dart:convert';

void main() {
  birthdays("birthdays.json");
}

void birthdays(String txt) {
  // Read the file and decode to Json
  var file = File(txt);
  Map<String, Object> data = json.decode(file.readAsStringSync());

  // Current list of people
  print("\nHello there!. We know the birthdays of the following people: \n");
  data.forEach((key, value) {
    print(key);
  });

  // User interaction
  stdout.write("\nWho's birthday do you want to know? ");
  String choice = stdin.readLineSync();
  print("\n$choice's birthday is ${data[choice]}\n");

  stdout.write("\nWould you like to add more people's birthdays? ");
  String answer = stdin.readLineSync().toLowerCase();

  // Update the file
  if (answer == "yes") {
    stdout.write("Give us a name: ");
    String name = stdin.readLineSync();
    stdout.write("Give us their birthday (dd/mm/yyyy): ");
    String birthday = stdin.readLineSync();

    data[name] = birthday;
    file.writeAsStringSync(json.encode(data));

    print("\nThank you! We have more people now!\n");

    data.forEach(
      (key, value) {
        print("$key: $value");
      },
    );
  } else {
    print("\nOK. Bye bye!\n");
  }
}
```
</details>

### Exercise 28
In the previous exercise we saved information about famous scientists’ names and birthdays to disk.

In this exercise, load that JSON file from disk, extract the months of all the birthdays, and count how many scientists have a birthday in each month.

Your program should output something like:
```
{
    "May": 3,
    "November": 2,
    "December": 1
}
```

<details>
    <summary>Solution</summary>

``` dart
import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';

void main() {
  // Read the Json file
  File file = File("birthdays.json");
  Map<String, Object> data = json.decode(file.readAsStringSync());

  // Extract the months to a list
  DateFormat extractor = DateFormat("MMMM");
  List<String> months = [
    for (var d in data.values) extractor.format(formatter(d))
  ];

  // Count the occurance of each month
  counter(months);
}

DateTime formatter(String birthday) {
  /*
  Takes a string and returns a Datetime object
  */
  return DateFormat("dd/MM/yyyy").parse(birthday);
}

void counter(List m) {
  /*
  Takes a lits of months and counts their occurances
  Saves them to a map and prints the results
  */
  Map<String, int> occurances = {};

  m.forEach((e) {
    if (!occurances.containsKey(e)) {
      occurances[e] = 1;
    } else {
      occurances[e] += 1;
    }
  });

  print("\nHere are the counts:\n");
  occurances.forEach((key, value) {
    print("$key: $value");
  });
}
```
</details>