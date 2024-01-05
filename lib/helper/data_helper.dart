import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DataHelper extends StatelessWidget {
  final bool isFanTurnOn;
  final bool isWaterTurnOn;
  final bool isBlinderTurnOn;
  final bool isLightTurnOn;
  final bool isCo2TurnOn;
  DataHelper(
      {super.key,
      required this.isFanTurnOn,
      required this.isWaterTurnOn,
      required this.isBlinderTurnOn,
      required this.isLightTurnOn,
      required this.isCo2TurnOn});

  @override
  Widget build(BuildContext context) {
    var icons = '';
    var text = '';
    List<bool> deviceState = [
      isFanTurnOn,
      isWaterTurnOn,
      isBlinderTurnOn,
      isLightTurnOn,
      isCo2TurnOn,
    ];
    if (deviceState[0]) {
      icons = 'assets/icons/mode_fan.svg';
      text = 'Mở';
    } else if (deviceState[1]) {
      icons = 'assets/icons/shower.svg';
      text = 'Mở';
    } else if (deviceState[2]) {
      icons = 'assets/icons/shades_closed.svg';
      text = 'Mở';
    } else if (deviceState[3]) {
      icons = 'assets/icons/flare.svg';
      text = 'Mở';
    } else if (deviceState[4]) {
      icons = 'assets/icons/co2.svg';
      text = 'Mở';
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(icons),
        Text(text),
      ],
    );
  }
}
