/*
Implement a function that takes as input three variables, and returns the largest of the three. Do this without using the Dart max() function!

The goal of this exercise is to think about some internals that Dart normally takes care of for us. All you need is some variables and if statements!
*/

void main() {
  print(largesttNumber(3, 1, 7));
}

int largesttNumber (int one, int two, int three) {
  int largest = one;
  for (var e in [two, three]) {
    if (e > largest) {
      largest = e;
    }
  }

  return largest;
}