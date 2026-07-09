import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/login_screen.dart';
import 'otp_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailTEController = TextEditingController();
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
                    "Your Email Address",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "A 6 digits PIN will be sent to your Email Address",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _onTapVerifyButton,
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          text: "Already have an Account?? ",
                          children: [
                            TextSpan(
                              text: "Log In",
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapLoginButton,
                            ),
                          ],
                        ),
                      ),
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
  void _onTapLoginButton(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  void _onTapVerifyButton(){
    Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpScreen()));
  }
  @override
  void dispose(){
    _emailTEController.dispose();
    super.dispose();
  }
}
