import 'package:flutter/material.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppTitle extends StatelessWidget {
  final String text;
  const AppTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: 280,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.title, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}
