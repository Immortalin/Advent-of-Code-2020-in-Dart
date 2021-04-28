import 'dart:io';

// import 'package:day_two_password_philosophy/day_two_password_philosophy.dart'
//     as day_two_password_philosophy;

void main(List<String> arguments) async {
  var lines = await File('puzzle_input.txt').readAsLines();
  var valid = 0;
  for (var line in lines) {
    var items = line.split(' ');

    var target_range = items[0].split('-');
    print(target_range);
    var target_char = items[1].split(':')[0];
    print(target_char);
    var target_string = items[2];
    print(target_string);
    var upper = int.parse(target_range[1]);
    var lower = int.parse(target_range[0]);
    // var exp = RegExp('{${target_range[0]}, ${target_range[1]}}');
    var count = 0;
    for (var char in target_string.split('')) {
      if (char == target_char) {
        count += 1;
      }
    }

    if (lower <= count && count <= upper) {
      valid += 1;
    }
  }
  print('Valid passwords: $valid');
  // print('Hello world: ${day_two_password_philosophy.calculate()}!');
}
