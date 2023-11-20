import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/utility/utility.dart';
import 'dart:async';


var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {'Content-Type': 'application/json','Content-Length': "" };



Future<bool> loginRequest(Map<String, String> formValues) async{
  var url = Uri.parse("$baseUrl/login");
  var postBody = json.encode(formValues);
  requestHeader['Content-Length'] = postBody.length.toString();
  try {
    var response = await http.post(url, headers: requestHeader, body: postBody);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if(resultCode ==200 && resultBody['status'] =="success"){
      storeUserData(resultBody);
      return true;
    }else{
      return false;
    }
  } catch (e) {
    print('Error: $e,  uri=$url');
    return false;
  }

}

Future<bool> registrationRequest(formValues)async{
  if(formValues !=null){
    var url = Uri.parse("$baseUrl/registration");
    var postBody = json.encode(formValues);
    requestHeader['Content-Length'] = postBody.length.toString();
    try{
      var response = await http.post(url, headers: requestHeader, body: postBody);
      var resultCode = response.statusCode;
      var resultBody = json.decode(response.body);
      if(resultCode ==200 && resultBody['status'] == 'success'){
        return true;
      }else{

        return false;
      }
    }catch(e){
      print("$e");
      return false;
    }

  }else{
    print("form value is empty");
    return false;
  }

}

Future<bool> verifyEmailRequest(email)async{
  if(email !=null){
    var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$email");
    try{
      var response = await http.get(url, headers:  {'Content-Type': 'application/json'});
      var resultCode = response.statusCode;
      var resultBody = json.decode(response.body);
      if(resultCode == 200 && resultBody['status'] == "success"){
        await writeEmailVerification(email);
        return true;
      }else
      {
        // errorToast("Request Fail! try again");
        return false;
      }
    }catch(e){
      print("$e");
      return false;
    }

  }else{
    return false;
  }

}


Future<bool> verifyOTPRequest(email, otp)async{
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$email/$otp");

  try{
    var response = await http.get(url, headers:{'Content-Type': 'application/json'});
    await writeOTPVerification(otp);
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);
    if(resultBody['status'] =="success"){

      return true;
    }else
    {
      // errorToast("Request Fail! try again");
      return false;
    }
  }catch(e){
    if (kDebugMode) {
      print("$e");

    }
    return false;
  }

}

Future<bool> setPasswordRequest(formValue)async{
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = json.encode(formValue);

  requestHeader['Content-Length'] = postBody.length.toString();
  try{
    var response = await http.post(url, headers: requestHeader, body: postBody );
    var resultCode = response.statusCode;
    var resultBody = json.decode(response.body);

    if(resultCode == 200 && resultBody['status'] == "success"){
      // successToast("Request Success");
      print("success");
      return true;
    }else {
      print("Return false $resultBody");
      return false;
    }
  }catch(e){
    print("$e");
    return false;
  }

}