import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/screen/login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newpasswordTEController = TextEditingController();
  final TextEditingController _confirmpasswordTEController = TextEditingController();
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
                    "Set Password",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 7,),
                  Text(
                    "Passowrd Should be at least 6 character or more ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _newpasswordTEController,
                    decoration: InputDecoration(hintText: "New Password"),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _confirmpasswordTEController,
                    decoration: InputDecoration(hintText: "Confirm Password"),
                  ),
                  const SizedBox(height: 14),
                  FilledButton(
                    onPressed: _afterResetPassword,
                    child: Text("Confirm"),
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
 void _afterResetPassword(){
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>LoginScreen()),
        (predicate)=>false);
 }
  @override
  void dispose(){
    _confirmpasswordTEController.dispose();
    _newpasswordTEController.dispose();
    super.dispose();
  }
}
