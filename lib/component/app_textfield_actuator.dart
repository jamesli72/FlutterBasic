import 'package:flutter/material.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppTextFieldActuator extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController controller;
  const AppTextFieldActuator(
      {super.key,
      required this.title,
      required this.label,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 120,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(3, 5))
      ]),
      child: Column(
        children: [
          Container(
            width: 350,
            height: 60,
            decoration: const BoxDecoration(
                color: AppColors.titleCard,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Center(child: Text(title)),
          ),
          SizedBox(
            width: 350,
            height: 60,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: label,
                  border:
                      const UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }
}
