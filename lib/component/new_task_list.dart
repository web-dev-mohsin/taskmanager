import 'package:flutter/material.dart';
import 'package:taskmanager/component/task_list_widget.dart';
import 'package:taskmanager/utility/utility.dart';

import '../api/api_client.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({super.key});

  @override
  State<NewTaskList> createState() => _PendingTaskScreenState();
}

class _PendingTaskScreenState extends State<NewTaskList> {
  List taskItems = [];
  bool isLoading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calledData();
  }


  Future<void> calledData() async{
    try{
      var data = await taskListCalled("New");
      setState(() {
        isLoading = false;
        taskItems = data;
      });
    }catch(e){
      print("$e");

    }
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
