import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get Started with", style: heading1Text(Colors.black26),),
                SizedBox(height: 1,),
                Text("Learn with Rabbil Hasan", style: heading6Text(Colors.black26),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Email Address"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Password"),),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                  style: appButtonStyle(),
                    onPressed: (){}, child: successButtonChild("Login")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
