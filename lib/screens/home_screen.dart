import 'package:flutter/material.dart';
import 'package:test_task/screens/widgets/home_background_widget.dart';
import 'package:test_task/screens/widgets/home_text.dart';

/// [HomeScreen] is the home screen of the app
class HomeScreen extends StatefulWidget {
  /// Creates a [HomeScreen]
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          HomeBackgroundWidget(
            colorGenerationType: ColorGenerationType.rgb,
          ),
          HomeText(),
        ],
      ),
    );
  }
}
