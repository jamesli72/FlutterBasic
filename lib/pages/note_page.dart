import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/helper/time_helper.dart';
import 'package:garden_iot/styles/app_colors.dart';

class NotePage extends StatelessWidget {
  final String? content;
  final String? title;
  final DateTime? timeStamp;
  const NotePage({super.key, this.content, this.title, this.timeStamp});

  @override
  Widget build(BuildContext context) {
    //String text = Provider.of<TextEditingController>(context).text;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 310,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          title!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const AppSpace(height: 30, width: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        content!,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const AppSpace(height: 50, width: 0),
                    Center(
                        child: HelperDateTime(
                      now: timeStamp!,
                    )),
                    const AppSpace(height: 20, width: 0),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(''),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
