import 'package:flutter/material.dart';
import 'package:patient_app/widgets/booking_button.dart';
import 'package:patient_app/widgets/question_button.dart';

class QuestionsSection extends StatelessWidget {
  const QuestionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Questions for doctor',
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              letterSpacing: 1),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              color: Color(0xffF7FAFC),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'What is the best way to get my teeth brushed ?',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Epilogue',
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Asked by Sara',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Epilogue',
                                color: Color(0xff4F7396)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffE8EDF2))),
                        onPressed: () {},
                        child: Text(
                          'View',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Epilogue',
                              color: Color(0xff0D141C),
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
        QuestionButton(),
        BookingButton()
      ],
    );
  }
}
