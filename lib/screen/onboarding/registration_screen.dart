import 'package:flutter/material.dart';

import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get Started with", style: heading1Text(Colors.black26),),
                SizedBox(height: 1,),
                Text("Learn with Rabbil Hasan", style: heading6Text(Colors.black26),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("First Name"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Last Name"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Phone Number"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Email Address"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Password"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Confirm Password"),),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){}, child: successButtonChild("Registration")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
