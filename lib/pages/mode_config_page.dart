import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_back_button.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_textfield_config.dart';
import 'package:garden_iot/component/app_title.dart';
import 'package:garden_iot/model/mode_config_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class ModeConfig extends StatelessWidget {
  const ModeConfig({super.key});

  @override
  Widget build(BuildContext context) {
    final ModeConfigCloud crudPage = ModeConfigCloud();
    final temp = TextEditingController();
    final humid = TextEditingController();
    final pH = TextEditingController();
    final frame = TextEditingController();

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
                          const AppTitle(text: 'Tạo chế độ'),
                          const AppSpace(height: 20, width: 0),
                          AppTextFieldConfig(
                              text: 'Nhiệt độ mong muốn:',
                              hint: '0-99',
                              controller: temp),
                          const AppSpace(height: 30, width: 0),
                          AppTextFieldConfig(
                            text: 'Độ ẩm mong muốn:',
                            hint: '0-99',
                            controller: humid,
                          ),
                          const AppSpace(height: 30, width: 0),
                          AppTextFieldConfig(
                            text: 'Độ pH mong muốn:',
                            hint: '0-14',
                            controller: pH,
                          ),
                          const AppSpace(height: 30, width: 0),
                          AppTextFieldConfig(
                              text: 'Số frame mong muốn:',
                              hint: '0-30',
                              controller: frame),
                          const AppSpace(height: 30, width: 0),
                          AppButton(
                            title: 'Thêm',
                            onPressed: () {
                              if (temp.text.isEmpty &&
                                  humid.text.isEmpty &&
                                  pH.text.isEmpty &&
                                  frame.text.isEmpty) {
                                showErrorDialog(context);
                              } else {
                                showSuccessDialog(context);
                                crudPage.createData(
                                    temp.text, humid.text, pH.text, frame.text);
                                Navigator.of(context).pop();
                              }
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
