import 'package:blank_street/provider/counter_provider.dart';
import 'package:blank_street/screen/state/state_first_screen.dart';
import 'package:blank_street/screen/state/state_second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({super.key});

  @override
  State<StateScreen> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const StateFirstScreen(),
            const SizedBox(height: 16),
            const StateSecondScreen(),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CounterProvider>(context, listen: false)
                      .increment();
                },
                child: const Text('Count'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
