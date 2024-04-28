// Write a program that asks the user how many Fibonnaci numbers to generate and then generates them. 
// Take this opportunity to think about how you can use functions.
// Make sure to ask the user to enter the number of numbers in the sequence to generate.

void main () {

  List<Duration>? fibonacciRecursiveResults = [];
  List<Duration>? fibonacciNumbersResults = [];

  Stopwatch stopwatch = new Stopwatch();
  
  for (var i = 0; i < 1000; i++) {
    stopwatch.start();
    fibonacciRecursive(i);
    fibonacciRecursiveResults.add(stopwatch.elapsed);

    stopwatch.start();
    fibonacciNumbers(i);
    fibonacciNumbersResults.add(stopwatch.elapsed);
  }
  
  // Difference in each iteration
  List<Duration> fibonacciRecursiveDifferences = listDifferences(fibonacciRecursiveResults);
  List<Duration> fibonacciNumbersDifferences = listDifferences(fibonacciNumbersResults);

  print('Fibonacci Recursive average increase = ${(listSum(fibonacciRecursiveDifferences).inMicroseconds)/fibonacciRecursiveDifferences.length}');
  print('Fibonacci Numbers average increase = ${(listSum(fibonacciNumbersDifferences).inMicroseconds)/fibonacciNumbersDifferences.length}');
}

//Recursive solution
/// Fibonacci recursive function. Input must be a positive integer > 0.
List<int> fibonacciRecursive (int n, {int firstNumber = 0, int secondNumber = 1, List<int> lst = const [0,1]}) {
  
  // Base case
  if (n <= 2) {
    return lst.sublist(0,n);
  }
  
  int placeholder = 0;
  List<int> tempLst = <int>[] + lst;

  placeholder = secondNumber;
  secondNumber = firstNumber + secondNumber;
  firstNumber = placeholder;

  tempLst.add(secondNumber);

  if (tempLst.length >= n) {
    return tempLst;
  } else {
    return fibonacciRecursive(n, firstNumber: firstNumber, secondNumber: secondNumber, lst: tempLst);
  }
}

//Fibonacci List
List<int> fibonacciNumbers (int numberOfNumbers) {
  List<int> fib = [0,1];

  for (var i = 0; i < numberOfNumbers; i++) {
    fib.add(fib[i]+fib[i+1]);
  }

  return fib;
}

List<Duration> listDifferences (List<Duration> lst) {
  
  List<Duration> differences = [];

  for (var i = 1; i < lst.length; i++) {
    differences.add(lst[i]-lst[i-1]);
  }

  return differences;
}

Duration listSum (List<Duration> lst) {
  Duration sum = Duration(hours: 0, minutes: 0, seconds: 0);
  for (var i = 0; i < lst.length; i++) {
    sum = sum + lst[i];
  }
  return sum;
}