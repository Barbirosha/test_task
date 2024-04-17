import 'package:flutter/material.dart';
import 'package:test_task/core/strings.dart';

/// [HomeText] is the text widget on the home screen
class HomeText extends StatelessWidget {
  /// Creates a [HomeText]
  const HomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Center(
        child: Text(
          Strings.homeText,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
