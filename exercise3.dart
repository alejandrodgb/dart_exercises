// Take a list, say for example this one: 
// a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] 
// and write a program that prints out all the elements of the list that are less than 5.

void main() {
  List<int> lst = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  print(lst);

  print('Method 1: forEach');

  lst.forEach(
    (number) {
      if (number < 5) {
        print(number);
      }
    }
  );

  print('Method 2: for i in list');

  for (final i in lst) {
    if (i < 5) {
      print(i);
    }
  }

  print('Method 3: one liner');
  print([for (final i in lst) if (i < 5) i]);

}