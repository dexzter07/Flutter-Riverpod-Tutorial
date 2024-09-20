import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override

  // initialise the value
  int build() => 0;

  // * methods

  void increment() => state++;
  void decrement() => state--;
}
