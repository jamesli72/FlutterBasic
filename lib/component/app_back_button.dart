import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.pop(context),
      child: Container(
        width: 110,
        height: 42,
        decoration: BoxDecoration(
            color: AppColors.backButton,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 1,
                offset: Offset(0, 2),
              )
            ]),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset('assets/icons/arrow_back.svg'),
            const Text(
              'Trở lại',
              style: TextStyle(fontSize: 15),
            ),
          ],
        )),
      ),
    );
  }
}
