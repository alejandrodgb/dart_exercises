// Create a program that asks the user to enter their name and their age. 
// Print out a message that tells how many years they have to be 100 years old.

import 'dart:io';

void main() {
  stdout.write("Enter your name\n");

  String? name = stdin.readLineSync();

  print(name);

  stdout.write("Enter your age\n");

  int? age = int.tryParse(stdin.readLineSync() ?? '');

  if (age != null && age >= 0 && age <= 100) {
    print('$name, you are ${100 - age} years away from being 100 years old.');
  } else {
    print('Please enter a valid age and try again');
  }
}