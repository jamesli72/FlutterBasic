import 'package:flutter/material.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppTextFieldAlert extends StatelessWidget {
  final String text;
  final String hint;
  final String hint2;
  final TextEditingController controller1;
  final TextEditingController controller2;
  const AppTextFieldAlert(
      {super.key,
      required this.text,
      required this.hint,
      required this.hint2,
      required this.controller1,
      required this.controller2});

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
          width: 70,
          child: TextField(
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: AppColors.colorFontField),
                border: const UnderlineInputBorder(),
                filled: true,
                fillColor: AppColors.white),
          ),
        ),
        const SizedBox(
          height: 24,
          child: VerticalDivider(
            color: Colors.black26,
            thickness: 1,
          ),
        ),
        SizedBox(
          width: 80,
          child: TextField(
            controller: controller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: hint2,
                hintStyle: const TextStyle(color: AppColors.colorFontField),
                border: const UnderlineInputBorder(),
                filled: true,
                fillColor: AppColors.white),
          ),
        ),
      ],
    );
  }
}
