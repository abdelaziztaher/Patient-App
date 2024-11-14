import 'package:flutter/material.dart';
import 'package:patient_app/widgets/ProfileInfo.dart';
import 'package:patient_app/widgets/question_button.dart';
import 'package:patient_app/widgets/questions_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'Home Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: ClipRect(
            child: InkWell(
          onTap: () {},
          child: Image.asset(
              width: 33, height: 33, 'assets/images/ProfilePic.png'),
        )),
        centerTitle: true,
        title: Text(
          'Find Care',
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              letterSpacing: 1),
        ),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.notifications_active,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfo(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: QuestionsSection()),
          ],
        ),
      ),
    );
  }
}
