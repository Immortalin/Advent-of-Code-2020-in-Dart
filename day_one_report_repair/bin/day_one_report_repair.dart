import 'package:day_one_report_repair/day_one_report_repair.dart'
    as day_one_report_repair;

import 'dart:io';
import 'package:tuple/tuple.dart';

const total = 2020;

void two_var_sum_up_to_2020() async {
  var lines = await File('puzzle_input.txt').readAsLines();
  var values = <int>[];
  for (var line in lines) {
    values.add(int.parse(line));
  }
  var remainders = <int, int>{};
  values.forEach((element) {
    remainders[element] = null;
  });
  // print(remainders);
  int current_variable;
  int second_variable;
  for (var i = 0; i < values.length; i++) {
    current_variable = values[i];
    var difference = total - current_variable;
    if (remainders.containsKey(difference)) {
      second_variable = difference;
      // print("Found!");
      break;
    }
  }
  print(
      'Sum up to 2020 with two variables: ${second_variable * current_variable}');
}

void three_var_sum_up_to_2020() async {
  var lines = await File('puzzle_input.txt').readAsLines();
  var values = <int>[];
  for (var line in lines) {
    values.add(int.parse(line));
  }
  // Hashmap of <sum, <x, y>> where sum = x + y
  var sum_values = <int, Tuple2<int, int>>{};
  for (var i = 0; i < values.length; i++) {
    for (var j = i; j < values.length; j++) {
      var x = values[i];
      var y = values[j];
      sum_values[x + y] = Tuple2(x, y);
    }
  }

  // print(remainders);
  int current_variable;
  int second_variable;
  int third_variable;
  for (var i = 0; i < values.length; i++) {
    current_variable = values[i];
    var difference = total - current_variable;
    if (sum_values.containsKey(difference)) {
      second_variable = sum_values[difference].item1;
      third_variable = sum_values[difference].item2;
      // print("Found!");
      break;
    }
  }

  print(
      'Sum up to 2020 with three variables: ${second_variable * current_variable * third_variable}');
}

void main(List<String> arguments) async {
  two_var_sum_up_to_2020();
  three_var_sum_up_to_2020();
  // print(values);
  // print('Hello world: ${day_one_report_repair.calculate()}!');
  //
}
