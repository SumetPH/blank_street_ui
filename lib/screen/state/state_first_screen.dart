import 'package:blank_street/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateFirstScreen extends StatelessWidget {
  const StateFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CounterProvider>(builder: (context, counterProvider, child) {
          return Text('State First Screen ${counterProvider.count}');
        })
      ],
    );
  }
}
