import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppCard2 extends StatelessWidget {
  final String title;
  final String temp;
  final String humid;
  final String pH;
  final String frame;
  const AppCard2(
      {super.key,
      required this.temp,
      required this.humid,
      required this.pH,
      required this.frame,
      required this.title});

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
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/mode_fan.svg'),
                          SvgPicture.asset('assets/icons/shower.svg'),
                          SvgPicture.asset('assets/icons/shades_closed.svg'),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/flare.svg'),
                          SvgPicture.asset('assets/icons/co2.svg'),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: 110,
                          height: 25,
                          decoration: BoxDecoration(
                              color: const Color(0xff8646ED),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text(
                            'Tự động',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 1,
                    height: 90,
                    child: VerticalDivider(
                      color: AppColors.black,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 96,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
