import 'package:email_validator/email_validator.dart';
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
  final _emailTEController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 65),
                Text('Your Email Address', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text(
                  'A 6 digit PIN will be sent to your Email Address',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (value) => EmailValidator.validate(value?.trim() ?? '') ? null : 'Enter a valid email',
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _onTapVerifyButton,
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Continue'),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                      text: 'Already have an account? ',
                      children: [
                        TextSpan(
                          text: 'Log In',
                          style: const TextStyle(color: Colors.green),
                          recognizer: TapGestureRecognizer()..onTap = _onTapLoginButton,
                        ),
                      ],
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

  void _onTapLoginButton() {
    Navigator.pop(context);
  }

  void _onTapVerifyButton() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpScreen()));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
