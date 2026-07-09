import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/fogot_password_verify.dart';
import 'package:helpful_flutter/ui/screen/sign_up_screen.dart';

import 'main_navbar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 65),
                  Text(
                    "Get Started with ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed:_afterLogIn,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: _onTapForgetButton,
                          child: Text(
                            "Fogot Password??",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Don't have an Account?? ",
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()..onTap = _onTapSignupButton,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignupButton(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
    }

    void _onTapForgetButton(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=> ForgotPassword()));
    }
  void _afterLogIn(){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MainNavbarScreen()),
            (predicate)=>false);
  }
    @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
