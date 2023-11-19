import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/email_verification_screen.dart';
import 'package:taskmanager/screen/onboarding/login_screen.dart';
import 'package:taskmanager/screen/onboarding/pin_verification_screen.dart';
import 'package:taskmanager/screen/onboarding/registration_screen.dart';
import 'package:taskmanager/screen/onboarding/set_password_screen.dart';
import 'package:taskmanager/screen/onboarding/splash_screen.dart';
import 'package:taskmanager/screen/task/new_task_screen.dart';
import 'package:taskmanager/utility/utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token = await getUserData('token');
  if(token ==null){
    runApp( MyApp('/login'));
  }else{
    runApp( MyApp('/newTaskScreen'));
  }

}

class MyApp extends StatelessWidget {
  final intialRoute;
    MyApp(this.intialRoute);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: "/login",
      routes: {
        '/':(context)=>SplashScreen(),
        '/login':(context)=>LoginScreen(),
        '/registration':(context)=>RegistrationScreen(),
        '/pinVerification':(context)=>PinVerificationScreen(),
        '/emailVerification':(context)=>EmailVerificationScreen(),
        '/setPassword':(context)=>SetPasswordScreen(),
        '/newTaskScreen':(context)=>NewTaskScreen(),
      },
    );
  }
}

