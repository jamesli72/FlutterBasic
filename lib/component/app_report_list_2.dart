import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/helper/data_helper.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AppReportListTwo extends StatelessWidget {
  final bool isFanTurnOn;
  final bool isWaterTurnOn;
  final bool isBlinderTurnOn;
  final bool isLightTurnOn;
  final bool isCo2TurnOn;
  const AppReportListTwo(
      {super.key,
      required this.isFanTurnOn,
      required this.isWaterTurnOn,
      required this.isBlinderTurnOn,
      required this.isLightTurnOn,
      required this.isCo2TurnOn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 340,
        height: 77,
        decoration:
            const BoxDecoration(color: AppColors.reportCard, boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 4))
        ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataHelper(
                  isFanTurnOn: isFanTurnOn,
                  isWaterTurnOn: isWaterTurnOn,
                  isBlinderTurnOn: isBlinderTurnOn,
                  isLightTurnOn: isLightTurnOn,
                  isCo2TurnOn: isCo2TurnOn),
              Row(
                children: [
                  const Text('Điều kiện môi trường ổn định'),
                  const AppSpace(height: 0, width: 20),
                  SvgPicture.asset('assets/icons/mood.svg'),
                ],
              ),
            ]),
      ),
    );
  }
}
