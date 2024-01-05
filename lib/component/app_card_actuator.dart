import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppCardActuator extends StatelessWidget {
  final String title;
  final String iconLeading;
  final double fontsize;
  final bool clicked;
  final VoidCallback? onTap;

  // ignore: prefer_const_constructors_in_immutables
  AppCardActuator(
      {super.key,
      required this.title,
      required this.iconLeading,
      this.onTap,
      required this.fontsize,
      required this.clicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: 330,
          height: 100,
          decoration: BoxDecoration(
              color: AppColors.listTile,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ]),
          child: Center(
            child: ListTile(
                leading: SvgPicture.asset(iconLeading),
                title: Text(
                  title,
                  style: TextStyle(fontSize: fontsize),
                ),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: clicked ? AppColors.turnOn : AppColors.turnOff,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(1, 3))
                          ]),
                      child: clicked
                          ? const Center(
                              child: Text(
                                'Mở',
                                style: TextStyle(color: AppColors.black),
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Tắt',
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                    ))),
          ),
        ));
  }
}
