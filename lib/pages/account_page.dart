import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/component/app_button.dart';
import 'package:garden_iot/component/app_card_account.dart';
import 'package:garden_iot/component/app_divider.dart';
import 'package:garden_iot/component/app_note_list.dart';
import 'package:garden_iot/component/app_space.dart';
import 'package:garden_iot/component/app_textfield.dart';
import 'package:garden_iot/model/note_data.dart';
import 'package:garden_iot/styles/app_colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(children: [
                  AppCardAccount(
                    text: 'Thiết lập tài khoản',
                    opTap: () => showBottom(context),
                  ),
                  AppCardAccount(
                      text: 'Nhận diện khuôn mặt',
                      opTap: () => showExcuseDialog(context)),
                  AppCardAccount(
                      text: 'Quét vân tay',
                      opTap: () => showExcuseDialog(context)),
                  AppCardAccount(
                      text: 'Nhật ký trồng cây',
                      opTap: () => showBottom_2(context)),
                ]),
              ))
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
          child: const Center(
            child: SingleChildScrollView(child: IdConfig()),
          ),
        ),
      );
    },
  );
}

class IdConfig extends StatelessWidget {
  const IdConfig({super.key});

  @override
  Widget build(BuildContext context) {
    final oldPassWord = TextEditingController();
    final oldGmail = TextEditingController();
    final newPassWord = TextEditingController();
    final newGmail = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppDivider(),
            AppTextField(
              hint: 'Nhập mật khẩu cũ của bạn',
              textController: oldPassWord,
            ),
            const AppSpace(height: 20, width: 0),
            AppTextField(
                hint: 'Nhập gmail cũ của bạn', textController: oldGmail),
            const AppSpace(height: 20, width: 0),
            AppTextField(
              hint: 'Nhập gmail mới',
              textController: newGmail,
            ),
            const AppSpace(height: 20, width: 0),
            AppTextField(
              hint: 'Nhập mật khẩu mới',
              textController: newPassWord,
            ),
            const AppSpace(height: 20, width: 0),
            AppButton(
                title: 'Cập nhật', onPressed: () => showExcuseDialog(context))
          ],
        ),
      ),
    );
  }

  /*void updateAccount(
      BuildContext context,
      TextEditingController email,
      TextEditingController password,
      TextEditingController oldEmail,
      TextEditingController oldPassword) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    
    async function firebaseEmailReset(user: User, email: string) {
    try {
        await verifyBeforeUpdateEmail(user, email);
        await signOut(firebaseAuth);
        window.location.reload();
    } catch (error: any) {
        handleFirebaseError(error.message);
    }
}
    try {
      User user = FirebaseAuth.instance.currentUser!;

      if (user != null) {
        await user.updateEmail(email.text.trim());
        await user.updatePassword(password.text.trim());
        Navigator.of(context).pop();
        showErrorMessage('Cập nhật tài khoản thành công', context);
        email.clear();
        password.clear();
      } else if (oldEmail.text != user.email) {
        showErrorMessage('Tài khoản cũ chưa chính xác', context);
      } else {
        Navigator.pop(context);
        showErrorMessage('Không thể cập nhật tài khoản', context);
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code, context);
      Navigator.pop(context);
    }
  }*/
}

showBottom_2(BuildContext context) {
  showModalBottomSheet(
    elevation: 2,
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * .60,
        decoration: const BoxDecoration(
            color: AppColors.reportCard,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: const SingleChildScrollView(child: NoteBook()),
      );
    },
  );
}

class NoteBook extends StatelessWidget {
  const NoteBook({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteCloud notes = NoteCloud();
    return Column(
      children: [
        SizedBox(
          child: StreamBuilder(
            stream: notes.readData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List configList = snapshot.data!.docs;

                //display a listview builder
                return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (context, index) {
                      //get each individual doc
                      DocumentSnapshot document = configList[index];
                      // ignore: unused_local_variable
                      String docID = document.id;

                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return AppNoteList(
                        content: data['content'],
                        text: data['title'],
                        timeStamp: data['timestamp'].toDate(),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const AppSpace(height: 15, width: 0),
                    itemCount: configList.length);
              } else {
                return const Center(child: Text('Chưa tạo nhật ký'));
              }
            },
          ),
        ),
        AppButton(
          title: 'Thêm',
          onPressed: () => Navigator.pushNamed(context, '/create_note_page'),
        ),
        const AppSpace(height: 50, width: 0),
      ],
    );
  }
}

void showExcuseDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Xin lỗi'),
        content: const Text('Tính năng chưa hữu dụng'),
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
