/*
In a previous exercise we explored the idea of using a list of lists as a “data structure” to store information about a tic tac toe game. In a tic tac toe game, the “game server” needs to know where the Xs and Os are in the board, to know whether player 1 or player 2 (or whoever is X and O) won.

There has also been an exercise (17) about drawing the actual tic tac toe gameboard using text characters.

The next logical step is to deal with handling user input. When a player (say player 1, who is X) wants to place an X on the screen, they can’t just click on a terminal. So you are going to approximate this clicking simply by asking the user for a coordinate of where they want to place their piece.
 */

// TO-DO: create the function that will replace the blank in the gameBoard for the X or O in the coordinates the user sent

import 'dart:io';

void main() {
  var player = 1;
  var gameOn = true;

  List<List<String>> gameBoard = List.generate(3, (index) => List.generate(3, (index) => ' '));

  while (gameOn) {

    var pMove = playerInput(player);
    print('Player $player move = $pMove');
    
    if (player == 1) {
      player = 2;
    } else {
      player = 1;
    }

    gameBoard = updateGameBoard(gameBoard, pMove, player);

    for (var e in gameBoard) {
      print(e);
    }

  }

  

}

List<List<String>> updateGameBoard (List<List<String>> gameBoard, List<int> coordinates, int player) {
  Map<int,String> symbol = {1:'X',2:'O'};var updatedGameBoard = gameBoard;
  
  updatedGameBoard[coordinates[0]][coordinates[1]] = symbol[player]!;
  
  return updatedGameBoard;

}


List<int> playerInput (int player) {
  var loop = true;
  List<int> coords = [];

  while (loop) {
    stdout.write('Player $player, enter coordinates: row,column\n');
    String? input = stdin.readLineSync();
    RegExp coordsRegex = RegExp(r'^[123],[123]$');

    if (input == null || input.length !=3 || !coordsRegex.hasMatch(input)) {
      print('Input error. Please try again.');
      continue;
    } else {
      List coordsString = input.split(',');
      coords = [int.parse(coordsString[0])-1,int.parse(coordsString[1])-1]; 
      break;
    }
  }
  return coords;
}