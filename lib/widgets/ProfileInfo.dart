import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 120),
          child: ClipRect(
            child: Image.asset(height: 175, 'assets/images/avatar.png'),
          ),
        ),
        Text(
          'Dr Mohammed Wagdy',
          style: TextStyle(
              fontSize: 25, fontFamily: 'Inter', fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
