
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';


// store user data to shared preference
Future<void> storeUserData(userData)async{
  if (userData == null) {
    return ;
  }else {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', userData['token'] ?? '');
    await prefs.setString('email', userData['data']['email'] ?? '');
    await prefs.setString('firstName', userData['data']['firstName'] ?? '');
    await prefs.setString('lastName', userData['data']['lastName'] ?? '');
    await prefs.setString('mobile', userData['data']['mobile'] ?? '');
    await prefs.setString('photo', userData['data']['photo'] ?? '');

    if(userData['token'] !=null){
      await prefs.setBool('isLogin', true);
    }
  }
}

Future<void> otpStore(otp)async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('otp', otp);
}


Future<void> storeEmailForVerification(email) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("emailVerification", email);
}

// top store
Future<void> setOTP(otp)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("otpVerification", otp);

}

// get data dynamically from shared preference
Future<String?> getUserData(keyText)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString(keyText);
  return data;
}

// user token remove from shared preference
Future<bool> removeToken()async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("token");
  return true;
}


// based 64 image convert
showBase64Image(String? base64){
  if (base64 == null) {
    return null;
  }
  UriData? data =  Uri.parse(base64!).data;
  if (data == null) { 
    return null;
  }
  Uint8List? image = data.contentAsBytes();
  return image;
}



