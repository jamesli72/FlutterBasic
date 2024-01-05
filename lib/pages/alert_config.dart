import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_back_button.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_textfield_alert.dart';
import 'package:garden_iot/component/app_textfield_config.dart';
import 'package:garden_iot/component/app_title.dart';
import 'package:garden_iot/model/alert_config_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AlertConfig extends StatelessWidget {
  const AlertConfig({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigAlertCloud db = ConfigAlertCloud();
    final maxTemp = TextEditingController();
    final minTemp = TextEditingController();
    final maxHumid = TextEditingController();
    final minHumid = TextEditingController();
    final maxpH = TextEditingController();
    final minpH = TextEditingController();
    final maxFrame = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child:
                              SvgPicture.asset('assets/icons/logo_garden.svg')),
                      const AppBackButton(),
                    ]),
                const AppSpace(height: 10, width: 0),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: 350,
                    height: MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight -
                        96,
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          const AppTitle(text: 'Tùy chỉnh ngưỡng'),
                          const AppSpace(height: 20, width: 0),
                          AppTextFieldAlert(
                            text: 'Nhiệt độ:',
                            hint: 'Min',
                            hint2: 'Max',
                            controller1: minTemp,
                            controller2: maxTemp,
                          ),
                          const AppSpace(height: 30, width: 0),
                          AppTextFieldAlert(
                            text: 'Độ ẩm:',
                            hint: 'Min',
                            hint2: 'Max',
                            controller1: minHumid,
                            controller2: maxHumid,
                          ),
                          const AppSpace(height: 30, width: 0),
                          AppTextFieldAlert(
                            text: 'Độ pH:',
                            hint: 'Min',
                            hint2: 'Max',
                            controller1: minpH,
                            controller2: maxpH,
                          ),
                          const AppSpace(height: 30, width: 0),
                          AppTextFieldConfig(
                              text: 'Lưu trữ ảnh tối đa:',
                              hint: '100-300',
                              controller: maxFrame),
                          const AppSpace(height: 30, width: 0),
                          AppButton(
                            title: 'Thêm',
                            onPressed: () {
                              if (maxTemp.text.isEmpty &&
                                  minTemp.text.isEmpty &&
                                  maxHumid.text.isEmpty &&
                                  minHumid.text.isEmpty &&
                                  maxpH.text.isEmpty &&
                                  minpH.text.isEmpty &&
                                  maxFrame.text.isEmpty) {
                                showErrorDialog(context);
                              } else {
                                showSuccessDialog(context);
                                db.createData(
                                    maxTemp.text,
                                    minTemp.text,
                                    maxHumid.text,
                                    minHumid.text,
                                    maxpH.text,
                                    minpH.text,
                                    maxFrame.text);
                              }
                              maxTemp.clear();
                              minTemp.clear();
                              maxHumid.clear();
                              minHumid.clear();
                              maxpH.clear();
                              minpH.clear();
                              maxFrame.clear();
                            },
                          ),
                          const AppDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

void showErrorDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Lỗi cài đặt'),
        content: const Text('Hãy điền thông tin vào khung'),
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
