import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

class TodoState {
  List<String> todoList;
  TextEditingController todoData;

  TodoState({required this.todoList, required this.todoData});
}

@riverpod
class Todo extends _$Todo {
  @override
  TodoState build() {
    return TodoState(todoList: [], todoData: TextEditingController());
  }

  void addTodo() {
    if (state.todoData.text.isNotEmpty) {
      state = TodoState(
          todoList: [...state.todoList, state.todoData.text],
          todoData: state.todoData);

      state.todoData.clear();
    }
  }
}
