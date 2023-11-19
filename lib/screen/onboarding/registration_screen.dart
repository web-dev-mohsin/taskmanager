import 'package:flutter/material.dart';

import '../../api/api_client.dart';
import '../../style/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Map<String, String> formValues = {"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"", 'cpassword':""};

    inputOnchange(mapKey, mapValue){
    setState(() {
      formValues.update(mapKey, (value) => mapValue);
    });
  }

  formOnSubmit() async{
      if(formValues['email']!.isEmpty){
        print("Email must be not empty");

      }else if(formValues['firstName']!.isEmpty){
        print("First name must be not empty");
      }else if(formValues['password']!.isEmpty || formValues['cpassword']!.isEmpty) {
        print("Password empty ");
      }else if(formValues['password'] != formValues['cpassword']){
        print("Password not matched ");
      }else{
       var res = await registrationRequest(formValues);
       if(res==true){
         print("Success");
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Get Started with", style: heading1Text(Colors.black26),),
                  SizedBox(height: 1,),
                  Text("Learn with Rabbil Hasan", style: heading6Text(Colors.black26),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged:(value){
                        inputOnchange("firstName", value);
                    },
                    decoration: appInputDecoration("First Name"),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged:(value){
                        inputOnchange("lastName", value);
                    },decoration: appInputDecoration("Last Name"),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged:(value){
                        inputOnchange("mobile", value);
                    },decoration: appInputDecoration("Phone Number"),),
                  SizedBox(height: 20,),
              
                  TextFormField(
                    onChanged:(value){
                        inputOnchange("email", value);
                    },decoration: appInputDecoration("Email Address"),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged:(value){
                        inputOnchange("password", value);
                    },decoration: appInputDecoration("Password"),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged:(value){
                        inputOnchange("cpassword", value);
                    },decoration: appInputDecoration("Confirm Password"),),
                  const SizedBox(height: 20,),
                  Container(child: ElevatedButton(
                      style: appButtonStyle(),
                      onPressed: (){
                        formOnSubmit();
                      }, child: successButtonChild("Registration")),),

                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, "/login");
                  }, child: const Text("Login"))
              
              
              
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
