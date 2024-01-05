import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_card_actuator.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_textfield_actuator.dart';
import 'package:garden_iot/styles/app_colors.dart';

class ActuatorPage extends StatefulWidget {
  ActuatorPage({super.key});

  @override
  State<ActuatorPage> createState() => _ActuatorPageState();
}

class _ActuatorPageState extends State<ActuatorPage> {
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _dailySpecialStream;
  bool turnFan = false;
  bool turnWater = false;
  bool turnBlinder = false;
  bool turnLight = false;
  bool turnCo2 = false;

  void _activateListeners() {
    _dailySpecialStream = _database.child('Actuator').onValue.listen((event) {
      final data = (event.snapshot.value as Map).cast<String, dynamic>();
      turnFan = data['Lammat'].toString() == 'true';
      turnWater = data['Tuoinuoc'].toString() == 'true';
      turnBlinder = data['Luoibaove'].toString() == 'true';
      turnLight = data['Denchieusang'].toString() == 'true';
      turnCo2 = data['Co2'].toString() == 'true';
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/logo_garden.svg'),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 350,
                height: MediaQuery.of(context).size.height -
                    kBottomNavigationBarHeight -
                    98,
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        AppCardActuator(
                          title: 'Làm mát',
                          iconLeading: 'assets/icons/little_fan.svg',
                          fontsize: 20,
                          onTap: ClickFan,
                          clicked: turnFan,
                        ),
                        AppCardActuator(
                          title: 'Tưới nước',
                          iconLeading: 'assets/icons/little_shower.svg',
                          fontsize: 20,
                          onTap: ClickWater,
                          clicked: turnWater,
                        ),
                        AppCardActuator(
                          title: 'Lưới bảo vệ',
                          iconLeading: 'assets/icons/little_window.svg',
                          fontsize: 20,
                          onTap: ClickBlinder,
                          clicked: turnBlinder,
                        ),
                        AppCardActuator(
                          title: 'Đèn chiếu sáng',
                          iconLeading: 'assets/icons/little_flare.svg',
                          fontsize: 20,
                          onTap: ClickLight,
                          clicked: turnLight,
                        ),
                        AppCardActuator(
                          title: 'Cung cấp CO2',
                          iconLeading: 'assets/icons/little_co2.svg',
                          fontsize: 20,
                          onTap: ClickCo2,
                          clicked: turnCo2,
                        ),
                        const AppDivider(),
                        AppButton(
                          title: 'Thiết lập hệ thống',
                          onPressed: showBottom,
                        ),
                        const AppSpace(height: 8, width: 0),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _dailySpecialStream.cancel;
    super.deactivate();
  }

  void ClickFan() {
    setState(() {
      turnFan = !turnFan;
    });
    _database.child('Actuator').update({'Lammat': turnFan});
  }

  void ClickWater() {
    setState(() {
      turnWater = !turnWater;
    });
    _database.child('Actuator').update({'Tuoinuoc': turnWater});
  }

  void ClickBlinder() {
    setState(() {
      turnBlinder = !turnBlinder;
    });
    _database.child('Actuator').update({'Luoibaove': turnBlinder});
  }

  void ClickLight() {
    setState(() {
      turnLight = !turnLight;
    });
    _database.child('Actuator').update({'Denchieusang': turnLight});
  }

  void ClickCo2() {
    setState(() {
      turnCo2 = !turnCo2;
    });
    _database.child('Actuator').update({'Co2': turnCo2});
  }

  void showBottom() {
    showModalBottomSheet<void>(
      elevation: 2,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: MediaQuery.of(context).size.height * .50,
            decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            child: const Center(
              child: SingleChildScrollView(child: ActuatorConfig()),
            ),
          ),
        );
      },
    );
  }
}

class ActuatorConfig extends StatefulWidget {
  const ActuatorConfig({
    super.key,
  });

  @override
  State<ActuatorConfig> createState() => _ActuatorConfigState();
}

class _ActuatorConfigState extends State<ActuatorConfig> {
  @override
  Widget build(BuildContext context) {
    final database = FirebaseDatabase.instance.ref();

    final TextEditingController fanLevel = TextEditingController();
    final TextEditingController waterLevel = TextEditingController();
    final TextEditingController blinderLevel = TextEditingController();
    final TextEditingController lightLevel = TextEditingController();
    final TextEditingController co2Level = TextEditingController();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const AppDivider(),
        AppTextFieldActuator(
          title: 'Hệ thống làm mát',
          label: 'Nhập tốc độ làm mát (100 - 500 RPM)',
          controller: fanLevel,
        ),
        const AppSpace(height: 10, width: 0),
        AppTextFieldActuator(
            title: 'Hệ thống tưới tiêu',
            label: 'Nhập lượng nước sử dụng (500 - 1000 ML)',
            controller: waterLevel),
        const AppSpace(height: 10, width: 0),
        AppTextFieldActuator(
            title: 'Hệ thống lưới bảo vệ',
            label: 'Nhập lượng màn bảo vệ (1 - 4 màn)',
            controller: blinderLevel),
        const AppSpace(height: 10, width: 0),
        AppTextFieldActuator(
          title: 'Hệ thống đèn',
          label: 'Nhập độ sáng đèn (cao - trung - thấp)',
          controller: lightLevel,
        ),
        const AppSpace(height: 10, width: 0),
        AppTextFieldActuator(
          title: 'Hệ thống C02',
          label: 'Nhập lượng CO2 sử dụng (100 - 500 PPM)',
          controller: co2Level,
        ),
        const AppSpace(height: 10, width: 0),
        AppButton(
          title: 'Chạy theo thiết lập',
          onPressed: () {
            database.child('ActuatorConfig').update({
              'blinderlevel': blinderLevel.text,
              'co2level': co2Level.text,
              'fanlevel': fanLevel.text,
              'lightlevel': lightLevel.text,
              'waterlevel': waterLevel.text,
            }).catchError((error) {
              print('Error: $error');
            }).then((_) {
              if (mounted) {
                showSuccessDialog(context);
              }
              blinderLevel.clear();
              co2Level.clear();
              fanLevel.clear();
              lightLevel.clear();
              waterLevel.clear();
            });
          },
        ),
        const AppSpace(height: 10, width: 0)
      ],
    );
  }
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Thành công'),
        content: const Text('Cài đặt đã thiết lập thành công'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
