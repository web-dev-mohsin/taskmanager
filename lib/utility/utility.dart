
import 'package:shared_preferences/shared_preferences.dart';

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

Future<void> writeEmailVerification(email) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("emailVerification", email);
}

Future<void> setOTP(otp)async{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString("otpVerification", otp);

}

Future<String?> getUserData(keyText)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString(keyText);
  return data;
}

