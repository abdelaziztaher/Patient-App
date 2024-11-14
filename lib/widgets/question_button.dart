import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  const QuestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(160, 0, 10, 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xffBD5127),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100))),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/images/question_icon.png'),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Ask a question',
                  style: TextStyle(
                      fontFamily: 'Epilogue',
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          )),
    );
  }
}
