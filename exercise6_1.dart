// Ask the user for a string and print out whether this string is a palindrome or not.
// A palindrome is a string that reads the same forwards and backwards.

void main() {
  var words = ['ireri','alex','civic','caSsandra','kayak','Noon','1221','Julie','parangaricutirimicuaro'];
  Map<String,bool>? palindromes = Map.fromIterables(words, [for (final w in words) isPalindrome(w)]);

  print(palindromes);
}

bool isPalindrome(String str) {

  String word = str.toLowerCase();

  int wordLength = word.length;
  int wordCounter = word.length;

  if (isOdd(word.length)) {
    wordLength = word.length - 1;
  }

  for (var  i=0; i < wordLength/2; i++) {
    if (word[i]!=word[wordCounter-1-i]) {
      return false;
    }
  }
  return true;
}

bool isOdd(int number) {
  return number % 2 != 0;
}