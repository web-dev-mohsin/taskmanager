import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/email_verification_screen.dart';
import 'package:taskmanager/screen/onboarding/login_screen.dart';
import 'package:taskmanager/screen/onboarding/pin_verification_screen.dart';
import 'package:taskmanager/screen/onboarding/registration_screen.dart';
import 'package:taskmanager/screen/onboarding/set_password_screen.dart';
import 'package:taskmanager/screen/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: '/pinVerification',
      routes: {
        '/':(context)=>SplashScreen(),
        '/login':(context)=>LoginScreen(),
        '/registration':(context)=>RegistrationScreen(),
        '/pinVerification':(context)=>PinVerificationScreen(),
        '/emailVerification':(context)=>EmailVerificationScreen(),
        '/setPassword':(context)=>SetPasswordScreen(),
      },
    );
  }
}

