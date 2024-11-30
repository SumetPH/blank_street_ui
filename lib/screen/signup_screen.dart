import 'package:blank_street/util/custom_colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _countryCode = '+66';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: CustomColors().brown,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: CustomColors().brown,
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: CustomColors().brownDark, width: 1.5),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
                      labelText: 'Full Name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: CustomColors().brown,
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: CustomColors().brownDark, width: 1.5),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      labelText: 'Email',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: CustomColors().brown,
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: CustomColors().brownDark, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      DropdownButton(
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        value: _countryCode,
                        items: ['+66', '+91', '+1']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _countryCode = value as String;
                          });
                        },
                        icon: const Icon(Icons.expand_more),
                      ),
                      const SizedBox(width: 8.0),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your mobile',
                            labelText: 'Mobile',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                      activeColor: CustomColors().brownDark,
                    ),
                    const Text('By signing up, you agree to our'),
                  ],
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors().green,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
