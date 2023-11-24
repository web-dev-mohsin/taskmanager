import 'package:flutter/material.dart';
import 'package:taskmanager/api/api_client.dart';

import '../../style/style.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Map<String, String> formValues= {"email":""};

  formOnchange(mapKey, mapValue){
    setState(() {
      formValues.update(mapKey, (value) => mapValue);
    });
  }
  formOnSubmit()async{
    if(formValues['email']!.isEmpty){
      print("email must be not empty");
    }else{
      var res = await verifyEmailRequest(formValues['email']);
      if(res == true){
        Navigator.pushNamed(context, "/pinVerification");
        print("success");
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
                Text("Your email address", style: heading1Text(Colors.black26),),
                SizedBox(height: 1,),
                Text("A 6 digit verification pin will send to your email address", style: heading6Text(Colors.black26),),
                SizedBox(height: 20,),

                TextFormField(
                  onChanged: (value){
                    formOnchange('email', value);
                  },
                  decoration: appInputDecoration("Email Address"),),

                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: appButtonStyle(),
                    onPressed: (){
                      formOnSubmit();
                    }, child: successButtonChild("Next")),)



              ],
            ),
          )
        ],
      ),
    );
  }
}
