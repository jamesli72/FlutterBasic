import 'package:flutter/material.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? textController;
  final hint;
  const AppTextField({super.key, required this.hint, this.textController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        controller: textController,
        style: TextStyle(height: 2.0),
        decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(color: AppColors.colorFontField),
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            filled: true,
            fillColor: AppColors.white),
      ),
    );
  }
}
