import 'package:flutter/material.dart';
import 'package:patient_app/auth/signin_form.dart';
import 'package:patient_app/auth/signup_form.dart';
import 'package:patient_app/widgets/sign_switcher.dart';
import 'package:patient_app/widgets/auth_button.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  bool isSignIn = true;

  // Animation controllers
  late AnimationController _switcherController;
  late Animation<Offset> _switcherAnimation;

  late AnimationController _quoteController;
  late Animation<Offset> _quoteAnimation;

  late AnimationController _formController;
  late Animation<Offset> _formAnimation;

  late AnimationController _buttonController;
  late Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _initializeAnimations();

    // Start animations with delays for sequential effect
    _startAnimations();
  }

  void _initializeAnimations() {
    _switcherController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _switcherAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _switcherController, curve: Curves.easeInOut),
    );

    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _quoteAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _quoteController, curve: Curves.easeInOut),
    );

    _formController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _formAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _formController, curve: Curves.easeInOut),
    );

    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _buttonAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );
  }

  void _startAnimations() async {
    _switcherController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _quoteController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _formController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _switcherController.dispose();
    _quoteController.dispose();
    _formController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 393,
            height: 852,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                // Animated Sign Switcher
                Positioned(
                  left: 41,
                  top: 33,
                  child: SlideTransition(
                    position: _switcherAnimation,
                    child: SignSwitcher(
                      isSignIn: isSignIn,
                      onSwitch: (selected) {
                        setState(() {
                          isSignIn = selected;
                        });
                      },
                    ),
                  ),
                ),
                // Animated Quote Text
                Positioned(
                  left: 44,
                  top: 222,
                  child: SlideTransition(
                    position: _quoteAnimation,
                    child: Container(
                      width: 309,
                      child: Text(
                        'You are few steps away from something great',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 28,
                          color: Colors.black,
                          letterSpacing: -0.05,
                        ),
                      ),
                    ),
                  ),
                ),
                // Animated Form fields
                Positioned(
                  left: 41,
                  top: 344,
                  child: SlideTransition(
                    position: _formAnimation,
                    child: isSignIn
                        ? SignInForm(
                            onLoginSuccess: (token) {
                              setState(() {
                                // Do nothing with token as no JWT required
                              });
                            },
                            buttonAnimation: _buttonAnimation,
                          )
                        : SignUpForm(
                            buttonAnimation: _buttonAnimation,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
