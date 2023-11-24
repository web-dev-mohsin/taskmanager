import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/utility/utility.dart';
import 'dart:async';


var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {'Content-Type': 'application/json'};

var requestHeaderWithToken = {
  'Content-Type': 'application/json',
  'token': '',
};

Future<bool> loginRequest(Map<String, String> formValues) async{
  var url = Uri.parse("$baseUrl/login");
  var postBody = json.encode(formValues);

  try {

    var response = await http.post(url, headers: requestHeader, body: postBody);
    var responseCode = response.statusCode;
    var responseBody = json.decode(response.body);
    if(responseCode ==200 && responseBody['status'] =="success"){
      storeUserData(responseBody);
      print(responseBody);
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

    try{

      var response = await http.post(url, headers: requestHeader, body: postBody);
      var responseCode = response.statusCode;
      var responseBody = json.decode(response.body);

      if(responseCode ==200 && responseBody['status'] == 'success'){
        print(responseBody);
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
    var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$email");

    try{

      var response = await http.get(url, headers: requestHeader);
      var responseCode = response.statusCode;
      var responseBody = json.decode(response.body);

      if(responseCode == 200 && responseBody['status'] =="success"){
        await writeEmailVerification(email);
        return true;
      }else {
        return false;
      }

    }catch(e){
      print("$e");
      return false;
    }


}

Future<bool> verifyOTPRequest(email, otp)async{
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$email/$otp");

  try{

    var response = await http.get(url, headers: requestHeader);
    await setOTP(otp);
    var responseCode = response.statusCode;
    var responseBody =   json.decode(response.body);

    if(responseCode ==200 && responseBody['status'] =="success"){
       return true;
    }else{
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

  try{

    var response = await http.post(url, headers: requestHeader, body: postBody );
    var responseCode = response.statusCode;
    var responseBody = json.decode(response.body);

    if(responseCode == 200 && responseBody['status'] == "success"){
      print("success");
      return true;
    }else {
      print("$responseBody");
      return false;
    }

  }catch(e){
    print("$e");
    return false;
  }

}

Future<dynamic> taskListCalled(param) async{
  var url = Uri.parse("$baseUrl/ListTaskByStatus/$param");
  var token = await getUserData("token");
  requestHeaderWithToken['token'] = token!;

  try{

    var response = await http.get(url, headers: requestHeaderWithToken);
    var responseCode = response.statusCode;
    var responseBody = json.decode(response.body);

    if(responseCode == 200 && responseBody['status'] == "success"){
      print(responseBody);
      return responseBody['data'];
    }else{
      print(responseBody);
      return [];
    }

  }catch(e){
    print("$e");
    return [];
  }


}







