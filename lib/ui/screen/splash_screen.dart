import 'package:flutter/material.dart';
import 'package:helpful_flutter/ui/contollers/auth_contoller.dart';
import 'package:helpful_flutter/ui/screen/login_screen.dart';

import 'main_navbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    final bool isLoggedIn=await AuthContoller.isUserAlreadyLoggedIn();
    if(isLoggedIn){
      await AuthContoller.getUserData();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => const MainNavbarScreen(),
      ),
      );
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'WELCOME!!',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
            Text(
              'SAKIB HOSSEN',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}