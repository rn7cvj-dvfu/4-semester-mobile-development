import 'dart:io';

void main(List<String> arguments) {
  print("Enter your string:");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("You didn't enter anything");
    return;
  }

  String lowerCase = input.toLowerCase();
  String upperCase = input.toUpperCase();
  String withoutSpaces = lowerCase.replaceAll(" ", "");
  int totalCount = withoutSpaces.length;

  print("Your string in lowercase: $lowerCase");
  print("Your string in UPPERCASE: $upperCase");
  print('Your string without spaces in lowecase: $withoutSpaces');
  print("Total count of characters: $totalCount");
}
