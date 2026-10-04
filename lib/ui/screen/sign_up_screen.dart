import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/data/services/api_caller.dart';
import 'package:helpful_flutter/data/utils/urls.dart';
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
  bool _signUpInProgress = false;

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
                  Visibility(
                    visible: _signUpInProgress==false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: FilledButton(
                      onPressed: (){},
                      //_afterSignup,
                      child: Text('Join'),
                    ),
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

  void _onTapSubmitonButton(){
      if(_formkey.currentState!.validate()){
          _signUp();
      }
  }
  Future<void> _signUp() async {
      _signUpInProgress=true;
      setState(() {});
      Map<String,dynamic> requestBody={
          "email":_emailTEController.text.trim(),
          "firstName":_firstnameTEController.text.trim(),
        "lastName":_lastTEController.text.trim(),
        "mobile":_mobileTEController.text.trim(),
        "password":_passwordTEController.text,
      };
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody
    );
    _signUpInProgress=false;
    setState(() {});
    if(response.isSucccess){
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('registration success!! Please Log in ')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.errorMessage)));
    }
  }
  void _onTapLogin(){
    Navigator.pop(context);
  }
/*  void _afterSignup(){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()),
            (predicate)=>false);
  }*/
  void _clearTextFields(){
    _emailTEController.clear();
    _firstnameTEController.clear();
    _lastTEController.clear();
    _passwordTEController.clear();_mobileTEController.clear();
  }
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
