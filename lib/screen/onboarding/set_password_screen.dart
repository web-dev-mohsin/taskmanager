import 'package:flutter/material.dart';

import '../../style/style.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
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
                Text("St Password", style: heading1Text(Colors.black26),),
                SizedBox(height: 1,),
                Text("Minimum 6 character ", style: heading6Text(Colors.black26),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Password"),),
                SizedBox(height: 20,),
                TextFormField(decoration: appInputDecoration("Confirm Password"),),
                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){}, child: successButtonChild("Confirm")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
