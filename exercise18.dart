/*
As you may have guessed, we are trying to build up to a full tic-tac-toe board. For now, we will simply focus on checking whether someone has WON the game, not worrying about how the moves were made.

If a game of Tic Tac Toe is represented as a list of lists, like so:

game = [[1, 2, 0],
        [2, 1, 0],
        [2, 1, 1]]
where a 0 means an empty square, a 1 means that player 1 put their token in that space, and a 2 means that player 2 put their token in that space.

Your task: given a 3 by 3 list of lists that represents a Tic Tac Toe game board, tell whether anyone has won, and tell which player won, if any.
*/ 

void main() {
  
  var game = [[1, 2, 0],
              [2, 1, 0],
              [2, 1, 1]];

  var rowResult = winCheck(game);
  var colResult = winCheck(transposeCols(game));
  var diagResult = winCheck(transposeDiag(game));

  if (rowResult!=0) {
    print('Player $rowResult won!');
  } else if (colResult != 0) {
    print('Player $colResult won!');
  } else if (diagResult != 0) {
    print('Player $diagResult won!');
  } else {
    print('Tie');
  }
}


int winCheck (List<List<int>> game) {
  for (var e in game) {
    var eSet = e.toSet();
    if (eSet.length==1){
      return eSet.elementAt(0);
    }
  }
  return 0;
}

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

List<List<int>> transposeDiag (List<List<int>> game) {
  List<int> diagOne = [];
  List<int> diagTwo = [];
  for (var i = 0; i < game.length; i++) {
      diagOne.add(game[i][i]);
      diagTwo.add(game[i][game[i].length-1-i]);
  }
  return [diagOne,diagTwo];
}

