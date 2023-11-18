import 'dart:convert';
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
    // print(resultBody);
    if(resultCode ==200 && resultBody['status'] =="success"){
      // print(resultBody);
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
  var url = Uri.parse("$baseUrl/registration");
  var postBody = json.encode(formValues);
  var response = await http.post(url, headers: requestHeader, body: postBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  
  if(resultCode ==200 && resultBody['status'] == 'success'){
    // successToast("Request success");
    return true;
  }else{
    // errorToast("Request Fail! try again");
    return false;
  }
}

Future<bool> verifyEmailRequest(email)async{
  var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$email");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    // successToast("Request Success");
    return true;
  }else
    {
      // errorToast("Request Fail! try again");
      return false;
    }
}
Future<bool> verifyOTPRequest(email, otp)async{
  var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$email/$otp");
  var response = await http.get(url, headers: requestHeader);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    // successToast("Request Success");
    return true;
  }else
    {
      // errorToast("Request Fail! try again");
      return false;
    }
}

Future<bool> setPasswordRequest(formValue)async{
  var url = Uri.parse("$baseUrl/RecoverResetPass");
  var postBody = json.encode(formValue);
  var response = await http.post(url, headers: requestHeader, body: postBody );
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
  if(resultCode == 200 && resultBody['status'] == "success"){
    // successToast("Request Success");
    return true;
  }else
    {
      // errorToast("Request Fail! try again");
      return false;
    }
}