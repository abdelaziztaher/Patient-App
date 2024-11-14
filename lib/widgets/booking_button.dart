import 'package:flutter/material.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 50, 20, 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xff007AFF)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 8),
          child: Text('Book Now',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  fontSize: 30,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
