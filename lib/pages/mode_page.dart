import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_back_button.dart';
import 'package:garden_iot/component/app_card_2.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_title.dart';
import 'package:garden_iot/model/mode_config_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class ModePage extends StatelessWidget {
  /*final List configParam = const [
    ['Chế độ làm mát', '27*C', '70%', '4pH', "1 Fr/5'"],
    ['Chế độ làm ấm', '31*C', '50%', '3pH', "2 Fr/5'"],
    ['Chế độ 01', '10*C', '60%', '5pH', "5 Fr/5'"]
  ];*/
  ModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ModeConfigCloud crudPage = ModeConfigCloud();
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
                        const AppTitle(text: 'Tùy chỉnh chế độ'),
                        SizedBox(
                            height: 430,
                            child: StreamBuilder(
                                stream: crudPage.readData(),
                                builder: (context, snapshot) {
                                  //if snapshot has data get all the docs
                                  if (snapshot.hasData) {
                                    List configList = snapshot.data!.docs;

                                    //display a listview builder
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        itemBuilder: (context, index) {
                                          //get each individual doc
                                          DocumentSnapshot document =
                                              configList[index];
                                          // ignore: unused_local_variable
                                          String docID = document.id;

                                          Map<String, dynamic> data = document
                                              .data() as Map<String, dynamic>;

                                          return AppCard2(
                                              title: "Chế độ $index",
                                              temp: "${data['temp']}*C",
                                              humid: "${data['humid']}%",
                                              pH: "${data['pH']}pH",
                                              frame: "${data['frame']} Fr/5'");
                                        },
                                        separatorBuilder: (context, index) =>
                                            const AppSpace(
                                                height: 15, width: 0),
                                        itemCount: configList.length);
                                  } else {
                                    return const Center(
                                        child: Text('Chưa tạo chế độ'));
                                  }
                                })),
                        const AppDivider(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FloatingActionButton(
                            backgroundColor: const Color(0xff8646ED),
                            onPressed: () => Navigator.pushNamed(
                                context, '/mode_page_config'),
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
