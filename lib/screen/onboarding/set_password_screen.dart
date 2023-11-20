import 'package:flutter/material.dart';

import '../../api/api_client.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});
  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  Map<String, String> formValues = {'email':'', 'OTP':'','password':'', 'cpassword':''};
  bool isLoading = false;

   @override
   initState(){

     callStoreData();
     super.initState();
   }


  inputOnchange(mapKey,textValue){
    setState(()  {
      formValues.update(mapKey, (value) => textValue);
    });

  }


  callStoreData() async{
    var email =  await getUserData("emailVerification");
    var otp =  await getUserData("otpVerification");
    formValues.update("email", (value) => email!);
    formValues.update("OTP", (value) => otp!);
  }

  formOnSubmit() async{


  if(formValues['email'] !=null && formValues['OTP'] !=null){
    if(formValues['password'] != formValues['cpassword']){
      print("Password and confirm password not matched");
    }else{
      var res = await setPasswordRequest(formValues);
      if(res ==true){
        print("success");
      }
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
                Text("Set Password", style: heading1Text(Colors.black26),),
                const SizedBox(height: 1,),
                Text("Minimum 6 character ", style: heading6Text(Colors.black26),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("Password"),
                  onChanged: (value){
                    inputOnchange("password", value);
                  },

                ),

                const SizedBox(height: 20,),
                TextFormField(
                  decoration: appInputDecoration("C Password"),
                  onChanged: (value){
                    inputOnchange("cpassword", value);
                  },
                ),
                const SizedBox(height: 20,),
                Container(child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){
                      formOnSubmit();
                    }, child: successButtonChild("Confirm")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
