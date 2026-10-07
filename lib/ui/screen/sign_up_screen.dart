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
  final _emailTEController = TextEditingController();
  final _firstnameTEController = TextEditingController();
  final _lastTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final _mobileTEController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _signUpInProgress = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Text('Join With Us', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Email'),
                  validator: (value) => EmailValidator.validate(value?.trim() ?? '') ? null : 'Enter a valid email',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _firstnameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (value) => value?.trim().isEmpty ?? true ? 'Enter first name' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _lastTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (value) => value?.trim().isEmpty ?? true ? 'Enter last name' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _mobileTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: 'Phone Number'),
                  validator: (value) => value?.trim().isEmpty ?? true ? 'Enter your number' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (value) => (value?.length ?? 0) < 6 ? 'Password must be at least 6 characters' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: _signUpInProgress
                      ? const Center(child: CircularProgressIndicator())
                      : FilledButton(onPressed: _onTapSubmitButton, child: const Text('Join')),
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
                          recognizer: TapGestureRecognizer()..onTap = _onTapLogin,
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

  void _onTapSubmitButton() {
    if (_signUpInProgress) return;
    if (_formKey.currentState?.validate() ?? false) _signUp();
  }

  Future<void> _signUp() async {
    setState(() => _signUpInProgress = true);

    final response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: {
        'email': _emailTEController.text.trim(),
        'firstName': _firstnameTEController.text.trim(),
        'lastName': _lastTEController.text.trim(),
        'mobile': _mobileTEController.text.trim(),
        'password': _passwordTEController.text,
      },
    );

    if (!mounted) return;
    setState(() => _signUpInProgress = false);

    if (response.isSucccess) {
      _clearTextFields();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration successful. Please log in.')),
      );
      await Future<void>.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
            (_) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errorMessage)));
    }
  }

  void _onTapLogin() {
    Navigator.pop(context);
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _firstnameTEController.clear();
    _lastTEController.clear();
    _passwordTEController.clear();
    _mobileTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _lastTEController.dispose();
    _firstnameTEController.dispose();
    super.dispose();
  }
}
