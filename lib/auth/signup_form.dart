// lib/screens/signup_form.dart
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/auth_button.dart';
import '../services/api_service.dart';
import '../models/user.dart';

class SignUpForm extends StatefulWidget {
  final Animation<Offset> buttonAnimation;

  SignUpForm({required this.buttonAnimation});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  Future<void> _createUser() async {
    final user = User(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      age: ageController.text,
    );

    final response = await ApiService.register(user);
    if (response != null && !response.containsKey('error')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account created successfully")),
      );
      Navigator.pushReplacementNamed(context, '/home');  // الانتقال إلى HomeScreen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response?['error'] ?? "Account creation error")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(controller: nameController, hint: 'Name'),
        InputField(controller: emailController, hint: 'Email'),
        InputField(controller: phoneController, hint: 'Phone number'),
        InputField(controller: passwordController, hint: 'Password', obscureText: true),
        InputField(controller: ageController, hint: 'Age', obscureText: false),
        SizedBox(height: 20),
        SlideTransition(
          position: widget.buttonAnimation,
          child: AuthButton(
            label: "SignUp",
            onPressed: _createUser,
          ),
        ),
      ],
    );
  }
}
