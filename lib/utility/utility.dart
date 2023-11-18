

import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeUserData(userData)async{
      print("mytoken $userData");
  if (userData == null) {
    // Handle the case where userData is null, if needed
    return;
  }else {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', userData['token'] ?? '');
    await prefs.setString('email', userData['data']['email'] ?? '');
    await prefs.setString('firstName', userData['data']['firstName'] ?? '');
    await prefs.setString('lastName', userData['data']['lastName'] ?? '');
    await prefs.setString('mobile', userData['data']['mobile'] ?? '');
    await prefs.setString('photo', userData['data']['photo'] ?? '');
  }



}

Future<String?> getUserData(key)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = await prefs.getString('email');
  return data;
}