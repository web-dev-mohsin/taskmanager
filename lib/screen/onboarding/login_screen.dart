import 'package:flutter/material.dart';
import 'package:taskmanager/api/api_client.dart';
import 'package:taskmanager/style/style.dart';
import 'package:toast/toast.dart';

import '../../utility/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Map<String, String> formValues = {"email":"", "password":""};
  bool isLoading = true;

  inputOnChange(mapKey,textValue){
    setState(() {
      formValues.update(mapKey, (value) => textValue);
    });
  }

  onSubmit()async{
    if(formValues['email']!.isEmpty){
    }else if(formValues['password']!.isEmpty){
    }else{
      setState(() {isLoading = true;});
      bool res = await loginRequest(formValues);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
        setState(() {isLoading = false;});
      }else{
        // errorToast("Fail! Please try again");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenBackground(context),
          Center(
            child: isLoading == false ? CircularProgressIndicator() : Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Get Started with", style: heading1Text(Colors.black26),),
                  const SizedBox(height: 1,),
                  Text("Learn with Rabbi Hasan", style: heading6Text(Colors.black26),),
                  const SizedBox(height: 20,),
                  TextFormField(
                  decoration: appInputDecoration("Email Address"),
                    onChanged: (value){
                      inputOnChange("email", value);
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: appInputDecoration("Password"),
                    onChanged: (value){
                      inputOnChange("password", value);
                    },
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    style: appButtonStyle(),
                      onPressed: (){
                        onSubmit();

                      }, child: successButtonChild("Login")),

                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, "/emailVerification");
                  }, child: const Text("Forget Password")),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Flexible(child: Text("You have no account?")),
                     TextButton(onPressed: (){
                       Navigator.pushNamed(context, "/registration");
                     }, child: const Text("SignUp")),

                   ],
                 )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
