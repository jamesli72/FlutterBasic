import 'package:flutter/material.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppTextFieldConfig extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController controller;
  const AppTextFieldConfig(
      {super.key,
      required this.text,
      required this.hint,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text(hint),
                hintStyle: const TextStyle(color: AppColors.colorFontField),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.white),
          ),
        ),
      ],
    );
  }
}
