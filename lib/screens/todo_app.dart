import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/provider/todo_provider.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<String>>((ref) {
  return TodoList();
});

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pushAddTodoScreen(context, ref),
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Todo App"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildTodoItem(context, ref, todoList[index], index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}

Widget _buildTodoItem(
    BuildContext context, WidgetRef ref, String todoText, int index) {
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    tileColor: Colors.amberAccent,
    contentPadding: const EdgeInsets.all(12),
    title: Text(
      todoText,
      style: const TextStyle(fontSize: 16),
    ),
    trailing: const Icon(Icons.check_box_outline_blank_rounded),
    onTap: () => _promptRemoveTodoItem(context, ref, index),
  );
}

void _promptRemoveTodoItem(BuildContext context, ref, index) {
  final todoList = ref.read(todoListProvider);
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Mark "${todoList[index]}" as done?',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: const TextStyle(fontSize: 16, color: Colors.black),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('MARK AS DONE'),
              onPressed: () {
                ref.read(todoListProvider.notifier).removeTodo(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

void _pushAddTodoScreen(BuildContext context, WidgetRef ref) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add a new task'),
          ),
          body: TextField(
            autofocus: true,
            onSubmitted: (val) {
              ref.read(todoListProvider.notifier).addTask(val);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              hintText: 'Enter something to do...',
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        );
      },
    ),
  );
}
