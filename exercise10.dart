// Ask the user for a number and determine whether the number is prime or not.
// Do it using a function
import 'dart:math';

void main () {

  
  /* var numbers = [1,2,3,4,5];

  for (var e in numbers) {
    print('$e isPrime = ${isPrime(e)} | isPrimeRecursive = ${isPrimeRecursive(e)}');
  }
  */

  int num = Random().nextInt(10000);

 Stopwatch stopwatch = new Stopwatch()..start();
  print('${num}, is prime = ${isPrime(num)}');
  print('isPrime() executed in ${stopwatch.elapsed}');

  stopwatch = new Stopwatch()..start();
  print('${num}, is prime = ${isPrimeRecursive(num)}');
  print('isPrimeRecursive() executed in ${stopwatch.elapsed}');

}

// Brute force
bool isPrime (int number) {
  if (number == 1) {return false;}
  for (var i = number-1; i > 1; i--) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

// Recursive
bool isPrimeRecursive (int n, {int i = 2}) {

  // Base cases
  if (n < 2){
    return false;
  } else if (n==2){
    return true;
  }

  if (n % i == 0) {
    return false;
  }

  if (i * i > n) {
    return true;
  }

  // Check for next divisor
  return isPrimeRecursive(n,i: i+1);
}