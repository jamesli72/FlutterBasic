import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_report_list.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/model/report_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ReportCloud dataConfig = ReportCloud();
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                          child: StreamBuilder(
                        stream: dataConfig.readData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List config = snapshot.data!.docs;

                            return ListView.separated(
                                itemBuilder: (context, index) {
                                  DocumentSnapshot document = config[index];
                                  // ignore: unused_local_variable
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: AppReportList(
                                      timeStamp: data['timestamp'].toDate(),
                                      temp: '${data['temp']}*C',
                                      humid: "${data['humid']}%",
                                      pH: "${data['ph']}pH",
                                      frame: "${data['frame']}Fr",
                                      overView: data['overview'].toString(),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const AppSpace(height: 0, width: 0),
                                itemCount: config.length);
                          } else if (snapshot.hasError) {
                            print('Catch exception: ${snapshot.error}');
                            return const Text('Error');
                          } else {
                            return const Center(
                                child: Text('Đang tải báo cáo...'));
                          }
                        },
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
