import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppCardAccount extends StatelessWidget {
  final String text;
  final VoidCallback opTap;
  const AppCardAccount({super.key, required this.opTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: opTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        width: 350,
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.reportCard,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4, color: Colors.black26, offset: Offset(0, 4))
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
              SvgPicture.asset('assets/icons/arrow_forward_ios.svg')
            ],
          ),
        ),
      ),
    );
  }
}
