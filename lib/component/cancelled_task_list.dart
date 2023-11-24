import 'package:flutter/material.dart';
import 'package:taskmanager/api/api_client.dart';
import 'package:taskmanager/component/task_list_widget.dart';

class CancelledTaskList extends StatefulWidget {
  const CancelledTaskList({super.key});

  @override
  State<CancelledTaskList> createState() => _CancelledTaskListState();
}

class _CancelledTaskListState extends State<CancelledTaskList> {
  List taskItems = [];
  bool isLoading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calledData();
  }


  calledData() async{
    var data = await taskListCalled("Cancelled");
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
