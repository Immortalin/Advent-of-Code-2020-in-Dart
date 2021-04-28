import 'package:day_one_report_repair/day_one_report_repair.dart'
    as day_one_report_repair;

import 'dart:io';

void main(List<String> arguments) async {
  const total = 2020;
  var lines = await File('puzzle_input.txt').readAsLines();
  var values = <int>[];
  for (var line in lines) {
    values.add(int.parse(line));
  }
  int current_variable;
  int second_variable;
  outerLoop:
  for (var i = 0; i < values.length; i++) {
    current_variable = values[i];
    var difference = total - current_variable;
    for (var j = i + 1; j < values.length; j++) {
      var next = values[j];
      if (next == difference) {
        second_variable = next;
        break outerLoop;
      }
    }
  }

  print(second_variable * current_variable);
  // print(values);
  // print('Hello world: ${day_one_report_repair.calculate()}!');
  //
}
