import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 280,
      child: Divider(
        color: Colors.black,
        height: 40,
        thickness: 0.6,
      ),
    );
  }
}
