// Write a program (function) that takes a list and returns a new list that 
// contains all the elements of the first list minus all the duplicates.

import 'dart:math';

void main () {

var originalList = List.generate(100, (_) => Random().nextInt(100));

var newList = Set.from(originalList).toList();

print(originalList.length);
print(newList.length);

}