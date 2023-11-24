
import 'package:flutter/material.dart';
import 'package:taskmanager/utility/contents.dart';
import 'package:taskmanager/utility/utility.dart';

AppBar appBar(context, userProfileData){
  var fullName =userProfileData['firstName'];
  print(userProfileData);
  var email =userProfileData['email'] ;
  var photo =userProfileData['photo'] ;
  return AppBar(
    backgroundColor: Colors.green,
    flexibleSpace: Container(
      margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: ClipRRect(
              child: Image.memory(showBase64Image(defaultProfileImage)),
            ),
          ),
          const SizedBox(width: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$fullName", style: TextStyle(color: Colors.white),),
              Text("$email", style: TextStyle(color: Colors.white),),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(onPressed: (){
        Navigator.pushNamed(context, "/createNewTask");
      }, icon: const Icon(Icons.add_circle_outline, color: Colors.white,)),
      IconButton(onPressed: ()async{
        await removeToken();
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }, icon: const Icon(Icons.logout,color: Colors.white,)),
    ],

  );
}