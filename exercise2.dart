// Ask the user for a number. Depending on whether the number is even or odd, 
// print out an appropriate message to the user.

import 'dart:io';

String isEven(int number) {
  switch (number % 2 == 0) {
    case true:
      return 'The number is even';
    default:
      return 'The value is odd';
  }
}
void main() {
  stdout.write("Enter a whole number\n");

  int? number = int.tryParse(stdin.readLineSync() ?? '');

  if (number == null || number.runtimeType != int) {
    print('Please enter a valid whole number');
  } else {
    print(isEven(number));    
  }
}