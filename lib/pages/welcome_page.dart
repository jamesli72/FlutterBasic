import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/styles/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('assets/icons/logo_garden.svg'),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Xin chào !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SvgPicture.asset('assets/icons/happy_face.svg'),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 340,
                    height: 540,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ]),
                    child: Column(
                      children: [
                        const Text('Báo cáo chi tiết trong 24h bạn đã rời đi :',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                            )),
                        const Text(
                            'Khu vườn được đặt trong chế độ làm mát ở nhiệt độ 24*C và độ ẩm 60%.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            )),
                        const Text('Hệ thống làm mát mở ở chế độ nhẹ.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            )),
                        const Text(
                            'Lá cây vẫn giữ màu tương thích với yêu cầu.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            )),
                        const Text(
                            'Phát hiện một số loại côn trùng đã đột nhập.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 67,
                          width: 297,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/home',
                                (Route<dynamic> route) => false),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.elevatedButton,
                              foregroundColor: AppColors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            child: const Text(
                              'Tiếp tục',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () => signOut(), child: Text('Thoát ra'))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
