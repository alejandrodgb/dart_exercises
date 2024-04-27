// Ask the user for a string and print out whether this string is a palindrome or not.
// A palindrome is a string that reads the same forwards and backwards.

void main() {
  var words = ['ireri','alex','civic','caSsandra','kayak','Noon','1221','Julie','parangaricutirimicuaro'];
  Map<String,bool>? palindromes = Map.fromIterables(words, [for (final w in words) isPalindrome(w)]);

  print(palindromes);
}

bool isPalindrome(String str) {
  var word = str.toLowerCase();
  var reversedWord = word.split('').reversed.join('');

  return word == reversedWord;
}