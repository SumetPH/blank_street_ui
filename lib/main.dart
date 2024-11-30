import 'package:blank_street/provider/counter_provider.dart';
import 'package:blank_street/screen/home_screen.dart';
import 'package:blank_street/screen/permission_screen.dart';
import 'package:blank_street/screen/signup_screen.dart';
import 'package:blank_street/screen/state/state_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFEF7F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFEF7F5),
        ),
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('1. Sign up'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 1.0),
            ListTile(
              title: const Text('2. Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 1.0),
            ListTile(
              title: const Text('3. Permission'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PermissionScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 1.0),
            ListTile(
              title: const Text('3. Provider'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StateScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 1.0),
          ],
        ),
      ),
    );
  }
}
