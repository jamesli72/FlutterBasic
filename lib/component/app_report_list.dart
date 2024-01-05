import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/helper/time_helper.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppReportList extends StatelessWidget {
  final DateTime timeStamp;
  final String temp;
  final String humid;
  final String pH;
  final String frame;
  final String overView;
  const AppReportList(
      {super.key,
      required this.timeStamp,
      required this.temp,
      required this.humid,
      required this.pH,
      required this.frame,
      required this.overView});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 340,
      height: 90,
      decoration: const BoxDecoration(color: AppColors.reportCard, boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
      ]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HelperDateTime(now: timeStamp),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SvgPicture.asset('assets/icons/dew_point_little.svg'),
              Text(temp),
              SvgPicture.asset('assets/icons/humidity_little.svg'),
              Text(humid),
              SvgPicture.asset('assets/icons/water_ph_little.svg'),
              Text(pH),
              SvgPicture.asset('assets/icons/camera_little.svg'),
              Text(frame),
            ]),
            Row(
              children: [
                Text(overView),
                const AppSpace(height: 0, width: 20),
                SvgPicture.asset('assets/icons/mood.svg'),
              ],
            ),
          ]),
    );
  }
}
