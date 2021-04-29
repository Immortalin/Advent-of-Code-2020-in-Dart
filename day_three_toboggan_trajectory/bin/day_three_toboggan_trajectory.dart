// import 'package:day_three_toboggan_trajectory/day_three_toboggan_trajectory.dart' as day_three_toboggan_trajectory;
//

import 'dart:io';
import 'package:worker_manager/worker_manager.dart';

/// Wraparound a 0-indexed integer [n] of an arbitrary [size] using the
/// standard modulo algorithm incrementing by [step_size]
///
@pragma('vm:prefer-inline')
int rollover(int n, int size, int step_size) {
  var result = n + step_size;
  var remainder = result % size;
  if (remainder != 0) {
    return remainder;
  }
  return 0;
}

/// Traverses toboggan slope with [n] right steps and [m] down steps
/// and returns number of [trees]
///
int right_n_down_m(List<String> lines, int n, int m) {
  var counter = 0;
  var trees = 0;

  for (var i = 0; i < lines.length; i += m) {
    var line = lines[i];
    // print(line[counter]);
    if (line[counter] == '#') {
      trees += 1;
    }
    counter = rollover(counter, 31, n);
  }
  return trees;
}

int right_three_down_one(List<String> lines) {
  return right_n_down_m(lines, 3, 1);
}

int right_one_down_one(List<String> lines) {
  return right_n_down_m(lines, 1, 1);
}

int right_five_down_one(List<String> lines) {
  return right_n_down_m(lines, 5, 1);
}

int right_seven_down_one(List<String> lines) {
  return right_n_down_m(lines, 7, 1);
}

int right_one_down_two(List<String> lines) {
  return right_n_down_m(lines, 1, 2);
}

void main(List<String> arguments) async {
  // int i = 11;
  // i = rollover_13(i);
  // print(i);
  // i = rollover_13(i);
  // print(i);
  //
  await Executor().warmUp();
  var lines = await File('puzzle_input.txt').readAsLines();

  var right_1_down_1_trees =
      await Executor().execute(arg1: lines, fun1: right_one_down_one);
  print('Trees found with right 1 down 1: $right_1_down_1_trees');

  var right_3_down_1_trees =
      await Executor().execute(arg1: lines, fun1: right_three_down_one);
  print('Trees found with right 3 down 1: $right_3_down_1_trees');

  var right_5_down_1_trees =
      await Executor().execute(arg1: lines, fun1: right_five_down_one);
  print('Trees found with right 5 down 1: $right_5_down_1_trees');

  var right_7_down_1_trees =
      await Executor().execute(arg1: lines, fun1: right_seven_down_one);
  print('Trees found with right 7 down 1: $right_7_down_1_trees');

  var right_1_down_2_trees =
      await Executor().execute(arg1: lines, fun1: right_one_down_two);
  print('Trees found with right 1 down 2: $right_1_down_2_trees');
  // print('Hello world: ${day_three_toboggan_trajectory.calculate()}!');
  //
  print(
      'Product of trees: ${right_1_down_1_trees * right_3_down_1_trees * right_5_down_1_trees * right_7_down_1_trees * right_1_down_2_trees}');
  exit(0);
}
