import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/data/models/user_model.dart';
import 'package:helpful_flutter/data/services/api_caller.dart';
import 'package:helpful_flutter/data/utils/urls.dart';
import 'package:helpful_flutter/ui/contollers/auth_contoller.dart';
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
  bool _logInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Email"),
                      validator: (String? value) {
                        String inputText = value ?? '';
                        if (EmailValidator.validate(inputText) == false) {
                          return 'Enter valide email';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password"),
                      validator: (String? value) {
                        if((value?.length ?? 0) <= 6 ){
                          return 'Password should more than 6 letters';
                        }
                        return null;
                    }
                  ),
                  const SizedBox(height: 24),
                  Visibility(
                    visible: _logInProgress==false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: FilledButton(
                      onPressed:_afterLogIn,
                      child: Icon(Icons.arrow_circle_right_outlined),
                    ),
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
    if(_formkey.currentState!.validate()){
      _logIn();
    }
  }
  Future<void> _logIn() async {
    _logInProgress=true;
    setState(() {});
    Map<String,dynamic> requestBody = {
            "email":_passwordTEController.text.trim(),
            "password":_passwordTEController.text,
    };
    final ApiResponse response = await ApiCaller.postRequest(url:Urls.logInUrl,body: requestBody);

    if(response.isSucccess && response.responseData['status']=='success'){

      UserModel model=UserModel.fromJson(response.responseData['data']);
      String accessToken=response.responseData['token'];
      await AuthContoller.saveUserData(model,accessToken);

    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>MainNavbarScreen()),
            (predicate)=>false);
    }
    else{
      _logInProgress=false;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errorMessage)));
    }
  }
    @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
