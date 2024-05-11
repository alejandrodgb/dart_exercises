/*
In this exercise, the task is to write a function that picks a random word from a list of words from the SOWPODS dictionary.

Download this file and save it in the same directory as your Dart code. Each line in the file contains a single word.

Use the Dart random library for picking a random word.
*/

import 'dart:io';
import 'dart:math';

void main() {

  print(readFile('sowpods.txt'));

}

String readFile (String filePath) {
  var myFile = File(filePath);

  List<String> wordList = myFile.readAsLinesSync();

  return wordList[Random().nextInt(wordList.length)];
}
