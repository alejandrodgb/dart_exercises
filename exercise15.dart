// Write a password generator in Dart. Be creative with how you generate passwords - strong passwords
// have a mix of lowercase letters, uppercase letters, numbers, and symbols. The passwords should be random, 
// generating a new password every time the user asks for a new password. Include your run-time code in a main method.
// Ask the user how strong they want their password to be. For weak passwords, pick a word or two from a list.
// Do not use the generated password in your real accounts. Use 1password.

import 'dart:math';

void main () {
  // Strong, Medium, Weak
  // ASCII 33 -> 125

  print(passwordGenerator('strong'));
  print(passwordGenerator('medium'));
  print(passwordGenerator('weak'));

}

String passwordGenerator (String option) {

  var listOfWords = ['map','instrument','happen','cook','observer','maid','prestige','release','cattle','weed','urgency',
  'hurt','escape','breakdown','psychology','magnitude','lemon','housing','parallel','magazine','locate',
  'silver','entry','hammer','soar','match','tired','extension','joy','quota','multimedia','shallow','exchange',
  'wave','job','progressive','nomination','swell','cave','sock','audience','club','river','touch','balance',
  'commitment','struggle','bloodshed','injection','soldier'];

  switch (option) {
    case 'strong':
      return randomCharsGenerator(18);
    case 'medium':
      return randomCharsGenerator(12);
    case 'weak':
      return listOfWords[Random().nextInt(listOfWords.length-1)] + "_" + listOfWords[Random().nextInt(listOfWords.length-1)];
    default:
      return "wrong choice";
  }

}

String randomCharsGenerator (int length) {
  var randomCharacters = List.generate(length, (_) => String.fromCharCode(Random().nextInt(92)+33));

  return randomCharacters.join('');
}
