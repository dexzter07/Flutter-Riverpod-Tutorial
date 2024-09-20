import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/provider/todo_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, WidgetRef ref, Widget? child) {
              final todo = ref.watch(todoProvider);
              return TextFormField(
                controller: todo.todoData,
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, WidgetRef ref, Widget? child) {
              final todo = ref.watch(todoProvider);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: todo.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todo.todoList[index]),
                  );
                },
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoProvider.notifier).addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
