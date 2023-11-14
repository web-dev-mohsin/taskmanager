import 'package:flutter/material.dart';

import '../../style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
                Text("Your email address", style: heading1Text(Colors.black26),),
                SizedBox(height: 1,),
                Text("A 6 digit verification pin will send to your email address", style: heading6Text(Colors.black26),),
                SizedBox(height: 20,),

                TextFormField(decoration: appInputDecoration("Email Address"),),

                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){}, child: successButtonChild("Next")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
