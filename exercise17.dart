/* 
Time for some fake graphics! Let’s say we want to draw game boards that look like this:

 --- --- --- 
|   |   |   | 
 --- --- ---  
|   |   |   | 
 --- --- ---  
|   |   |   | 
 --- --- --- 
This one is 3x3 (like in tic tac toe).

Ask the user what size game board they want to draw, and draw it for them to the screen using Dart’s print statement.
*/

void main() {

  var size = 4;
  var rowLines = ' ---';
  var columnLines = '|   ';

  for (var i = 0; i < size; i++) {
    print(rowLines * size);
    print(columnLines * (size+1));
  }
  
  print(rowLines * size);
}