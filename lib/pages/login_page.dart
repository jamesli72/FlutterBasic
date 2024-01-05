import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_textfield.dart';
import 'package:garden_iot/styles/app_colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //lấy input của người dùng
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //phương thức đăng nhập
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Center(
            child: Text(
              message,
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/garden_logo.png'),
                      const SizedBox(
                        height: 36,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/squared_id.svg'),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Account',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AppTextField(
                          hint: 'Tài khoản',
                          textController: usernameController),
                      AppSpace(height: 8, width: 0),
                      AppTextField(
                        hint: 'Mật khẩu',
                        textController: passwordController,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      AppButton(title: 'Đăng nhập', onPressed: signUserIn),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              showErrorMessage(
                                  'Xin lỗi tính năng chưa hữu dụng');
                            },
                            child: Text('Quên mật khẩu?')),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset('assets/icons/face_id.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset('assets/icons/fingerprint.svg')
                        ],
                      ),
                      Row(
                        children: [
                          Text('Chưa có tài khoản?'),
                          TextButton(
                              onPressed: () => showBottom(context),
                              child: Text('Đăng ký tại đây')),
                        ],
                      ),
                    ]),
              ),
              Image.asset(
                'assets/image/garden_background.png',
                color: AppColors.background,
                colorBlendMode: BlendMode.darken,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showBottom(BuildContext context) {
  showModalBottomSheet(
    elevation: 2,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * .60,
          decoration: const BoxDecoration(
              color: AppColors.reportCard,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Center(
            child: SingleChildScrollView(child: SignUp()),
          ),
        ),
      );
    },
  );
}

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final username = TextEditingController();

  final email = TextEditingController();

  final password = TextEditingController();

  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          AppDivider(),
          AppTextField(hint: 'Họ và tên', textController: username),
          AppSpace(height: 20, width: 0),
          AppTextField(
            hint: 'Tài khoản gmail',
            textController: email,
          ),
          AppSpace(height: 20, width: 0),
          AppTextField(
            hint: 'Mật khẩu',
            textController: password,
          ),
          AppSpace(height: 20, width: 0),
          AppTextField(
            hint: 'Xác nhận mật khẩu',
            textController: confirmPassword,
          ),
          AppSpace(height: 20, width: 0),
          AppButton(title: 'Xác nhận', onPressed: () => signUp(context)),
          AppSpace(height: 20, width: 0)
        ],
      ),
    );
  }

  signUp(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (password.text == confirmPassword.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
        Navigator.of(context).pop();
        showErrorMessage('Tạo tài khoản thành công', context);
        username.clear();
        email.clear();
        password.clear();
        confirmPassword.clear();
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        showErrorMessage(e.code, context);
      }
    } else {
      Navigator.pop(context);
      showErrorMessage('Mật khẩu không khớp', context);
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
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}
