import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppCardAlert extends StatelessWidget {
  final String title;
  final String temp;
  final String humid;
  final String pH;
  final String frame;

  const AppCardAlert(
      {super.key,
      required this.temp,
      required this.humid,
      required this.pH,
      required this.title,
      required this.frame});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 140,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ]),
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 96,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/dew_point_little.svg'),
                            Text(temp),
                            SvgPicture.asset(
                                'assets/icons/humidity_little.svg'),
                            Text(humid),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/water_ph_little.svg'),
                            Text(pH),
                            SvgPicture.asset('assets/icons/camera_little.svg'),
                            Text(frame),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ])));
  }
}
