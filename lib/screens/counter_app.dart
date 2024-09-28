import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Move counterProvider outside of the widget
final counterProvider = StateProvider<int>((ref) => 0);

class CounterApp extends ConsumerWidget {
  const CounterApp({super.key});

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
            // This watches the counterProvider to get the latest value
            Consumer(builder: (context, ref, _) {
              final counterState = ref.watch(counterProvider);
              return Text(
                counterState.toString(),
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final counterState =
                    ref.read(counterProvider); // Use read instead of watch
                if (counterState > 0) {
                  ref.read(counterProvider.notifier).state--;
                }
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
