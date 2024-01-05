import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_textfield.dart';
import 'package:garden_iot/helper/time_helper.dart';
import 'package:garden_iot/model/note_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class CreateNotePage extends StatelessWidget {
  const CreateNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteCloud notes = NoteCloud();
    final TextEditingController title = TextEditingController();
    final TextEditingController content = TextEditingController();
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: SingleChildScrollView(
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
                              92,
                          decoration: const BoxDecoration(
                              color: AppColors.reportCard,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const AppSpace(height: 30, width: 0),
                                HelperDateTime(
                                  now: DateTime.timestamp(),
                                ),
                                const AppSpace(height: 30, width: 0),
                                AppTextField(
                                  hint: 'Tiêu đề',
                                  textController: title,
                                ),
                                const AppSpace(height: 20, width: 0),
                                const Text(
                                  'Nội dung',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const AppSpace(height: 20, width: 0),
                                SizedBox(
                                  height: 270,
                                  child: TextField(
                                    //controller: Provider.of<TextEditingController>(context),
                                    expands: true,
                                    maxLines: null,
                                    style: const TextStyle(height: 2.0),
                                    controller: content,
                                    decoration: const InputDecoration(
                                        labelText: 'Nội dung nhật ký',
                                        labelStyle: TextStyle(
                                            color: AppColors.colorFontField),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: AppColors.white),
                                  ),
                                ),
                                const AppSpace(height: 20, width: 0),
                                AppButton(
                                  title: 'Xác nhận',
                                  onPressed: () {
                                    if (title.text.isEmpty ||
                                        content.text.isEmpty) {
                                      showErrorMessage(
                                          'Chưa điền thông tin', context);
                                    } else {
                                      notes.createData(
                                          title.text, content.text);
                                      title.clear();
                                      content.clear();
                                      showErrorMessage(
                                          'Tạo nhật ký thành công', context);
                                    }
                                  },
                                ),
                                const Spacer()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}

void showErrorMessage(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.background,
        title: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
    },
  );
}
