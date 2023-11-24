import 'package:flutter/material.dart';
import 'package:taskmanager/component/cancelled_task_list.dart';
import 'package:taskmanager/component/completed_task_list.dart';
import 'package:taskmanager/component/new_task_list.dart';
import 'package:taskmanager/component/progress_task_list.dart';
import 'package:taskmanager/utility/utility.dart';

import '../../component/bottom_nav_bar.dart';
import '../../component/task_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  Map<String, String> userProfileData ={
        "firstName":"",
        "lastName":"f",
        "email":"f",
        "mobile":"f",
         "id":"f",
        "photo":""
  };

  readProfileData()async{
    String? firstName =await getUserData("firstName");
    String? lastName =await getUserData("lastName");
    String? email  =await getUserData("email");
    String? photo  =await getUserData("photo");
    String? mobile  =await getUserData("mobile");
    String? id  =await getUserData("_id");
    setState(() {
      userProfileData ={
        "firstName":"$firstName",
        "lastName":"$lastName",
        "email":"$email",
        "mobile":"$mobile",
        "id":"$id",
        "photo":"$photo"
      };
    });
  }

  @override
  initState(){
    super.initState();
    readProfileData();
  }
  onItemTappedIndex(int index){
    setState(() {
      currentIndex = index;
    });
  }

  final widgetOptions =[
      NewTaskList(),
      ProgressTaskList(),
      CompletedTaskList(),
      CancelledTaskList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: appBar(context,userProfileData),
            body: widgetOptions.elementAt(currentIndex),
            bottomNavigationBar: appNavigationBar(currentIndex, onItemTappedIndex),
    );
  }
}
