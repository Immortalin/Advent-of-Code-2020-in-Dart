// import 'package:day_three_toboggan_trajectory/day_three_toboggan_trajectory.dart' as day_three_toboggan_trajectory;
//

import 'dart:io';

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

/// Wraparound an 0-indexed integer [n] of max value 30 (31-1) using the
/// standard modulo algorithm incrementing by 3
///
@pragma('vm:prefer-inline')
int rollover_31(int n) {
  return rollover(n, 31, 3);
}

void main(List<String> arguments) {
  // int i = 11;
  // i = rollover_13(i);
  // print(i);
  // i = rollover_13(i);
  // print(i);
  //
  var counter = 0;
  var trees = 0;
  var lines = File('puzzle_input.txt').readAsLinesSync();
  for (var line in lines) {
   // print(line[counter]);
    if (line[counter] == '#') {
      trees += 1;
    }
    counter = rollover_31(counter);
  }
  print('Trees found: $trees');
  // print('Hello world: ${day_three_toboggan_trajectory.calculate()}!');
}
