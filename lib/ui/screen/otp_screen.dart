import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/login_screen.dart';
import 'package:helpful_flutter/ui/screen/reset_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
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
                  const SizedBox(height: 70),
                  Text(
                    "Enter Your OTP",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    "A 6 digits OTP has been sent to your Email Address",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 24),

              PinInput(
              length: 4,
              builder: (context, cells) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cells.map((cell) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cell.isFocused ? Colors.blue : Colors.grey[200],
                      ),
                      child: Center(
                        child: Text(
                          cell.character ?? '',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
              onCompleted: (pin) => print('PIN: $pin'),
            ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: _onTapPasswordButton,
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
  void _onTapPasswordButton(){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>ResetPasswordScreen()),
        (predicate)=>false);
  }
  @override
  void dispose(){
    _otpTEController.dispose();
    super.dispose();
  }
}
