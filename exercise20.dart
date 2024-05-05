/*
Tic Tac Toe game
*/

import 'dart:io';

void main() {
  var player = 1;
  var gameOn = true;
  Map<int,String> userSymbols = {1:'X',2:'O'};

  // Generate empty game board.
  List<List<String>> gameBoard = List.generate(3, (index) => List.generate(3, (index) => ' '));
  // Generate game board of indexes to calculate the winner.
  List<List<int>> gameBoardIdx = List.generate(3, (_) => List.generate(3, (_) => 0));
  // Initialise the coordinates submitted list with a dummy value.
  List<List<int>> coordinatesSubmitted = [[9,9]];

  stdout.write('Tic Tac Toe\nGame board is ready!\n');
  // Print out visual of the board
  for (var e in gameBoard) {
    print(e);
  }

  while (gameOn) {

    // Get the coordinates from the player
    var pMove = playerInput(player,coordinatesSubmitted);

    // Add submitted coordinates to the list of coordinates already submitted.
    coordinatesSubmitted.add(pMove);
    print('\nPlayer $player move = $pMove');

    // Update visual and indexes boards with the corrdinates of the user if they have not been already entered
    var gameBoardOptions = updateGameBoard(gameBoard, gameBoardIdx, pMove, player, userSymbols);

    // Extract the visual game board
    gameBoard = gameBoardOptions[0];

    // Print the visual game board
    for (var e in gameBoard) {
      print(e);
    }

    // Extract the indexes game board
    var gameBoardMoves = gameBoardOptions[1];

    // Check whether a row, column, or diagonal have a win in the indexes game board
    var rowResult = winCheck(gameBoardMoves);
    var colResult = winCheck(transposeCols(gameBoardMoves));
    var diagResult = winCheck(transposeDiag(gameBoardMoves));

    // Print result if a win or tie has been found
    if (rowResult!=0) {
      print('Player $rowResult won!');
      gameOn = false;
    } else if (colResult != 0) {
      print('Player $colResult won!');
      gameOn = false;
    } else if (diagResult != 0) {
      print('Player $diagResult won!');
      gameOn = false;
    } else if (coordinatesSubmitted.length==10) {
      print('Game ended in a tie!');
      gameOn = false;
    }

    // Swap turns
    if (player == 1) {
      player = 2;
    } else {
      player = 1;
    }
  }


}
/// Function to update the visual and indexes game boards. 
List updateGameBoard (List<List<String>> gameBoard, List<List<int>> gameBoardIdx, List<int> coordinates, int player, Map<int,String> userSymbols) {
  Map<int,String> symbol = userSymbols;
  var updatedGameBoard = gameBoard;
  var updatedGameBoardIdx = gameBoardIdx;

  updatedGameBoard[coordinates[0]][coordinates[1]] = symbol[player]!;
  updatedGameBoardIdx[coordinates[0]][coordinates[1]] = player;

  return [updatedGameBoard,updatedGameBoardIdx];
}

/// Function to parse the player input.
/// It takes in a string, validates it to be a coordinate in format 'row,column' 
/// and returns the integers for the row and column as a list.
List<int> playerInput (int player, List<List<int>> coordinatesSubmitted) {
  List<int> coords = [];

  while (true) {
    stdout.write('Player $player, enter coordinates: row,column\n');
    
    // Get user input
    String? input = stdin.readLineSync();
    RegExp coordsRegex = RegExp(r'^[123],[123]$');

    // If input is valid = not null, length of 3, and matches the pattern
    // parse to a list of integers
    if (input == null || input.length !=3 || !coordsRegex.hasMatch(input)) {
      print('Invalid option, Please enter a coordinate in format row,column. Please try again.');
      continue;
    } else {
      List coordsString = input.split(',');
      coords = [int.parse(coordsString[0])-1,int.parse(coordsString[1])-1]; 
      
      // Check whether the input has already been entered
      if (listExists(coordinatesSubmitted, coords)) {
        print('A player has already played in that position');
        continue;
      } else {
        break;
      }
    }
  }
  return coords;
}

/// Function to check whether a player has won the game.
int winCheck (List<List<int>> game) {
  for (var e in game) {
    var eSet = e.toSet();
    if (eSet.length==1){
      return eSet.elementAt(0);
    }
  }
  return 0;
}

/// Function to transpose the columns in a list of lists into rows.
List<List<int>> transposeCols (List<List<int>> game) {
  List<List<int>> transposedGame = [];
  for (var i = 0; i < game.length; i++) {
    List<int> tempRow = [];
    for (var e in game) {
      tempRow.add(e[i]);
    }
    transposedGame.add(tempRow);
  }
  return transposedGame;
}

/// Function to transpose the diagonals in a list of lists into rows.
List<List<int>> transposeDiag (List<List<int>> game) {
  List<int> diagOne = [];
  List<int> diagTwo = [];
  for (var i = 0; i < game.length; i++) {
      diagOne.add(game[i][i]);
      diagTwo.add(game[i][game[i].length-1-i]);
  }
  return [diagOne,diagTwo];
}

/// Function to check whehter a list exists within a list of lists.
bool listExists (List<List<int>> listOfLists, List<int> listToCheck) {
  var isMatch = true;
  for (var e in listOfLists) {
    isMatch = true;
    for (var i = 0; i < listToCheck.length; i++) {
      if (e[i] != listToCheck[i]) {
        isMatch = false;
      }
    }    
  }
  return isMatch;
}