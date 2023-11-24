import 'package:flutter/material.dart';
import 'package:taskmanager/utility/utility.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _PendingTaskScreenState();
}

class _PendingTaskScreenState extends State<NewTaskScreen> {

  String email = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callUserData();
  }

  callUserData()async{
    String? getEmail = await getUserData("email");
    setState(() {
      email = getEmail!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(email),
      ),
    );
  }
}
