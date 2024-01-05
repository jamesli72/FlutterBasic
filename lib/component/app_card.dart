import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String iconLeading;
  final String iconTrailing;
  final double fontsize;
  final VoidCallback? onTap;
  // ignore: prefer_const_constructors_in_immutables
  AppCard(
      {super.key,
      required this.title,
      required this.iconLeading,
      required this.iconTrailing,
      this.onTap,
      required this.fontsize});

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
                  padding: const EdgeInsets.only(right: 20),
                  child: iconTrailing != ''
                      ? SvgPicture.asset(iconTrailing)
                      : const SizedBox(),
                ))),
      ),
    );
  }
}
