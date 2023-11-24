import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/api/api_client.dart';

import '../../style/style.dart';
import '../../utility/utility.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {

  Map<String, String> formValue = {"otp":""};
  inputOnchange(mapKey, mapValue){
    setState(() {
      formValue.update(mapKey, (value) => mapValue);
    });
  }

formOnSubmit() async{
    if(formValue['otp'] !=null){
      var otp = formValue['otp'];
      var verifyEmail = await getUserData("emailVerification");
      var res = await verifyOTPRequest(verifyEmail, otp);
      if(res == true){
        Navigator.pushNamedAndRemoveUntil(context, "/setPassword", (route) => false);
      }
        }
  }
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
                onChanged: (value){
                  inputOnchange("otp", value);
                },


              ),

                SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){
                      formOnSubmit();
                    }, child: successButtonChild("Verify")),),

                TextButton(onPressed: (){
                  Navigator.pushNamed(context, "/setPassword");
                }, child: Text("Change Pass")),



              ],
            ),
          )
        ],
      ),
    );
  }
}
