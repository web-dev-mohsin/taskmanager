import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanager/utility/utility.dart';
import 'dart:async';


var baseUrl = "https://task.teamrabbil.com/api/v1";
var requestHeader = {'Content-Type': 'application/json'};

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





Future<bool> rxApiCall()async{
  var url = Uri.parse("https://rxapi.navanapharma.com/api/sync/chiefcomplain");
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YTU3ZWY4OS04MjJmLTRkZjYtOGU5MS00NDBiMGMzYzk2MDIiLCJqdGkiOiJhMmE5MzdmZmFhNDZkZGJkZGJlMWQ5YzBmYjA5OTFkMWIxNjBkMDIyM2M0NDFiNTkwMGJjMTY3ODBjNTYxNjhkZWQyMjkyMWQ0OTJmYjI2YiIsImlhdCI6IjE3MDA2MzE2MjYuMzA2MzUzIiwibmJmIjoiMTcwMDYzMTYyNi4zMDYzNTkiLCJleHAiOiIxNzMyMjU0MDI2LjI3Njg2MiIsInN1YiI6IjY3OSIsInNjb3BlcyI6W119.FysskCcXSlBzWcTjgSWtQ-vFn7eDc8w43WggrLRyJhlPPv592lWWW1Mq9tyjV3KUz3QLPSXY1rzggGZQl6iOkEfDQ_jO4AavuYr2gBDSbJheDFMAeAZuyC2C6yOgKb87cXJDkwyuDxt5TrSXDtoJtDYTHhUu5KoiTY8YYBNqT4jqCVQif68V4D3WRF-lgS58xweVEqgUlmLASySvZVeL5CN6GnOAOsiMhyWmVY2LWll7-_5UMBhZ3XddqVGnkmGmAEbNpDsTAw0w6fMhjPjsqVlB_2C3osjY9pA5UaYF4dfy4pTFllupea0RIxHDer0tRnO0-Rs3Bna2cFRqu0eVT3oeb6WAeA6rF8uF2O4hr_Q9IEimhIv5zW27b1lVEQ0PFll_8vdYGGNFG912O2IwI7bqrFCDP73BMoC9Yi9HLut-VAsuCzZq02zLScO15aWcMU8_1dDtAbZiM3CHbipaAywVR7mQzR5R8Odc_M0vQnkIfzIg-gq_p-HJpDM_y_GzFCZGA2oUxh-mdpTdnlWH0nbPFSB3W9uJ1Vy4GakY9EDMZQEhcMjSL65guf2leHVrd5gkBHAdk-yhzDv_wc8zx-adAzWXszdkqUaZj4wJAKxnMTrAxwyIJg9dpzhhYthUuVgBb3eslDnlJWIkPOs5D8v0gZYpvMxg-EVoM2GFFSI',
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  try{
   var bodyFields = {
      'date': '2021-02-02 18:55:01',
      'page': '1',
      'per_page': '50'
    };
    var response = await http.post(url, headers: headers, body: bodyFields);
    var responseCode = response.statusCode;
    var responseBody = json.decode(response.body);
    if(responseCode == 200){
      print("success");
      print(responseBody);
      return true;
    }else {
      print("Return false $responseBody");
      return false;
    }
  }catch(e){
    print("$e");
    return false;
  }

}



