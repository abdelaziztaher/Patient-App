import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/auth_button.dart';
import '../services/api_service.dart';

class SignInForm extends StatefulWidget {
  final Function(String) onLoginSuccess;
  final Animation<Offset> buttonAnimation;

  SignInForm({required this.onLoginSuccess, required this.buttonAnimation});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _loginUser() async {
    final response = await ApiService.login(emailController.text, passwordController.text);
    if (response != null && response['access_token'] != null) {
      widget.onLoginSuccess(response['access_token']);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login successful"))
      );
      Navigator.pushReplacementNamed(context, '/home');  // الانتقال إلى HomeScreen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response?['error'] ?? "Login error")),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputField(controller: emailController, hint: 'Email / phone number'),
        InputField(controller: passwordController, hint: 'Password', obscureText: true),
        SizedBox(height: 20),
        SlideTransition(
          position: widget.buttonAnimation,
          child: AuthButton(
            label: "Login",
            onPressed: _loginUser,
          ),
        ),
      ],
    );
  }
}
