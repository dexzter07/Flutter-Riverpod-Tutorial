import 'package:flutter/material.dart';
import 'package:riverpod_tut/screens/counter_app.dart';
import 'package:riverpod_tut/screens/todo_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Riverpod Tutorial"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        children: [
          const SizedBox(
            height: 20,
          ),
          containerBuilder("Counter App", () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CounterApp()),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          containerBuilder("TODO App", () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TodoApp()),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          containerBuilder("Network Request App", () {}),
        ],
      ),
    );
  }
}

containerBuilder(String value, GestureTapCallback? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.amberAccent,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 0.5)),
          ],
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
          const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 18,
          )
        ],
      ),
    ),
  );
}
