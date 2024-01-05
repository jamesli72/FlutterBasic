import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garden_iot/pages/note_page.dart';

class AppNoteList extends StatelessWidget {
  final String text;
  final String? content;
  final DateTime? timeStamp;
  const AppNoteList(
      {super.key, required this.text, this.content, this.timeStamp});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
            title: Text(text),
            trailing: SvgPicture.asset('assets/icons/arrow_forward_ios.svg'),
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotePage(
                      title: text,
                      content: content,
                      timeStamp: timeStamp,
                    ),
                  ),
                )));
  }
}
