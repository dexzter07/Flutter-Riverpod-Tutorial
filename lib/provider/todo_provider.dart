import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoList extends StateNotifier<List<String>> {
  TodoList() : super([]);

  void addTask(String task) {
    if (task.isNotEmpty) {
      state = [...state, task];
    }
  }

  void removeTodo(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}
