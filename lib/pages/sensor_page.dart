import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_card.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/styles/app_colors.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({super.key});

  @override
  State<SensorPage> createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _dailySpecialStream;
  double temp_display = 0.0;
  int humid_display = 0;
  int pH_display = 0;

  void _activateListeners() {
    _dailySpecialStream = _database.child('Sensor').onValue.listen((event) {
      final data = (event.snapshot.value as Map).cast<String, dynamic>();
      final temp = double.tryParse(data['Nhietdo'].toString()) ?? 0.0;
      final humid = int.tryParse(data['Doam'].toString()) ?? 0;
      final pH = int.tryParse(data['DopH'].toString()) ?? 0;
      setState(() {
        temp_display = temp;
        humid_display = humid;
        pH_display = pH;
      });
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
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: SvgPicture.asset('assets/icons/logo_garden.svg'),
            ),
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
                child: Column(
                  children: [
                    AppCard(
                      title: 'Nhiệt độ: $temp_display*C',
                      iconLeading: 'assets/icons/dew_point.svg',
                      iconTrailing: '',
                      fontsize: 20,
                    ),
                    AppCard(
                      title: 'Độ ẩm: $humid_display%',
                      iconLeading: 'assets/icons/humidity_mid.svg',
                      iconTrailing: '',
                      fontsize: 20,
                    ),
                    AppCard(
                      title: 'Độ pH: ${pH_display}pH',
                      iconLeading: 'assets/icons/water_ph.svg',
                      iconTrailing: '',
                      fontsize: 20,
                    ),
                    AppCard(
                      title: 'Hình ảnh:',
                      iconLeading: 'assets/icons/camera.svg',
                      iconTrailing: 'assets/icons/arrow_forward.svg',
                      fontsize: 20,
                      onTap: () =>
                          Navigator.of(context).pushNamed('/picture_page'),
                    ),
                    const AppDivider(),
                    AppButton(
                      title: 'Tùy chọn chế độ',
                      onPressed: () =>
                          Navigator.pushNamed(context, '/mode_page'),
                    ),
                    const AppSpace(height: 8, width: 0),
                    AppButton(
                      title: 'Điều chỉnh ngưỡng',
                      onPressed: () =>
                          Navigator.pushNamed(context, '/threshold_page'),
                    )
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
}
