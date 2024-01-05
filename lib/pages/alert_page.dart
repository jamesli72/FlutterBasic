import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_back_button.dart';
import 'package:garden_iot/component/app_card_alert.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_title.dart';
import 'package:garden_iot/model/alert_config_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AlertPage extends StatelessWidget {
  AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ConfigAlertCloud dataConfig = ConfigAlertCloud();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset('assets/icons/logo_garden.svg')),
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
                        const AppTitle(text: 'Báo động'),
                        SizedBox(
                            height: 430,
                            child: StreamBuilder(
                              stream: dataConfig.readData(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List config = snapshot.data!.docs;

                                  return ListView.separated(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      itemBuilder: (context, index) {
                                        DocumentSnapshot document =
                                            config[index];
                                        // ignore: unused_local_variable
                                        String docID = document.id;
                                        Map<String, dynamic> data = document
                                            .data() as Map<String, dynamic>;

                                        return AppCardAlert(
                                          title: "Báo động $index",
                                          temp:
                                              "${data['mintemp']}~${data['maxtemp']}*C",
                                          humid:
                                              "${data['minhumid']}~${data['maxhumid']}%",
                                          pH: "${data['minph']}~${data['maxph']}pH",
                                          frame: "${data['maxframe']} frame",
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const AppSpace(height: 15, width: 0),
                                      itemCount: config.length);
                                } else if (snapshot.hasError) {
                                  print('Catch exception: ${snapshot.error}');
                                  return const Text('Error');
                                } else {
                                  return const Center(
                                      child: Text('Chưa tạo chế độ'));
                                }
                              },
                            )),
                        const AppDivider(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton(
                            backgroundColor: const Color(0xff8646ED),
                            onPressed: () => Navigator.pushNamed(
                                context, '/threshold_page_config'),
                            child: const Icon(Icons.add),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
