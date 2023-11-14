import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../style/style.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
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
                Text("Pin Verification", style: heading1Text(Colors.black26),),
                SizedBox(height: 1,),
                Text("A 6 digit verification pin will send to your mobile number", style: heading6Text(Colors.black26),),
                SizedBox(height: 20,),

              PinCodeTextField(
                  appContext: context,
                  length: 6,
                pinTheme: appOTPStyle(),
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v){

                },
                onChanged: (v){

                },


              ),

                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){}, child: successButtonChild("Verify")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
