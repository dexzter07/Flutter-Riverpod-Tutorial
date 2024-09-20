import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/provider/counter_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You have clicked this many times",
              style: TextStyle(fontSize: 16),
            ),
            Consumer(builder: (context, WidgetRef ref, Widget? child) {
              final counter = ref.watch(counterProvider);

              return Text(
                counter.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).decrement();
                },
                child: const Icon(Icons.delete))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
