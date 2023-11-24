import 'package:flutter/material.dart';
import 'package:taskmanager/component/task_list_widget.dart';

import '../api/api_client.dart';

class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({super.key});

  @override
  State<CompletedTaskList> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskList> {

  List taskItems = [];
  bool isLoading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calledData();
  }


  calledData() async{
    var data = await taskListCalled("Completed");
    setState(() {
      taskItems = data;
      isLoading = false;
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
