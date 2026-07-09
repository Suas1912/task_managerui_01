import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstnameTEController = TextEditingController();
  final TextEditingController _lastTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                  const SizedBox(height: 50),
                  Text(
                    "Join With Us",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (String? value){
                      String inputText=value ?? '';
                      if(EmailValidator.validate(inputText) ==false){
                        return 'Enter valide email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _firstnameTEController,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "First Name"),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _lastTEController,
                      textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Last Name"),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _mobileTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Phone Number"),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Enter your number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordTEController,
                      textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: (String? value) {
                      if((value?.length ?? 0) < 6 ){
                        return 'Enter a password more than 6 letters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: (){},
                    //_afterSignup,
                    child: Text('Join'),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Already have an Account?? ",
                            children: [
                              TextSpan(
                                text: "Log In",
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()..onTap = _onTapLogin,
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
  void _onTapLogin(){
    Navigator.pop(context);
  }
/*  void _afterSignup(){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()),
            (predicate)=>false);
  }*/
  @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _lastTEController.dispose();
    _firstnameTEController.dispose();
    super.dispose();
  }
}
