import 'package:flutter/material.dart';
import 'package:test_task/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/// [MyApp] is the root widget of the app
// ignore: prefer_match_file_name
class MyApp extends StatelessWidget {
  /// Creates a [MyApp]
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
