import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/component/app_back_button.dart';
import 'package:garden_iot/component/app_card.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/model/photo_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class PhotoPage extends StatelessWidget {
  const PhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    PhotoStorage photoStorage = PhotoStorage();

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
            const AppSpace(height: 20, width: 0),
            Center(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: MediaQuery.of(context).size.height -
                  kBottomNavigationBarHeight -
                  106,
              width: 350,
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: FutureBuilder(
                  future: photoStorage.getImageUrls(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return ListView.separated(
                        reverse: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => AppCard(
                          title: 'Photo-$index.png',
                          iconLeading: 'assets/icons/images.svg',
                          iconTrailing: '',
                          fontsize: 28,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: FadeInImage.assetNetwork(
                                    placeholder: 'assets/loading.gif',
                                    image: snapshot.data![index],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Close'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        separatorBuilder: (context, index) => const SizedBox(),
                      );
                    } else {
                      return const Center(
                        child: Text('Chưa chụp hình ảnh nào'),
                      );
                    }
                  }),
            ))
          ],
        ),
      )),
    );
  }
}
