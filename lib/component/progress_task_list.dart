import 'package:flutter/material.dart';
import 'package:taskmanager/component/task_list_widget.dart';

import '../api/api_client.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskList> {
  List taskItems = [];
  bool isLoading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calledData();
  }


  calledData() async{
    var data = await taskListCalled("Progress");
    setState(() {
      isLoading = false;
      taskItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body:  RefreshIndicator(
    onRefresh: ()async{
     await calledData();
    } ,
    child: isLoading ? const Center(child: CircularProgressIndicator(),) : Center(child: taskItems.length >0 ? taskListWidget(taskItems) : const Center(child: Text("Empty"),)),
    )
    );
  }
}
