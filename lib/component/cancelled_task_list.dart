import 'package:flutter/material.dart';
import 'package:taskmanager/api/api_client.dart';
import 'package:taskmanager/component/task_list_widget.dart';

import '../style/style.dart';

class CancelledTaskList extends StatefulWidget {
  const CancelledTaskList({super.key});

  @override
  State<CancelledTaskList> createState() => _CancelledTaskListState();
}

class _CancelledTaskListState extends State<CancelledTaskList> {
  List taskItems = [];
  bool isLoading =true;
  String? status = "Cancelled";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calledData();
  }


  calledData() async {
    if (mounted) {
      var data = await taskListCalled("Cancelled");
      setState(() {
        isLoading = false;
        taskItems = data;
      });
    }
  }

  deleteAlert(id) async{
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Are you sure want to delete?"),
            actions: [
              OutlinedButton(onPressed: ()async{
                Navigator.pop(context);
                isLoading = true;
                var res = await deleteTaskRequest(id);
                if(res){
                 await calledData();
                }
              }, child: const Text("Yes")),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("No")),
            ],
          );
        }
    );
  }

  updateCallData(id)async{
      try{
        setState((){ isLoading = true; });
        Navigator.pop(context);
        await updateTaskStatus(id, status);
        await  calledData();
        setState((){ status = "Cancelled"; });
      }catch(e){
        print("$e");
      }
  }

  updateStatus(title, id) async {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.all(50),
                height: 500,
                width: double.infinity,
                child: Column(
                  children: [
                    RadioListTile(
                        title: Text("New"),
                        value: "New",
                        groupValue: status,
                        onChanged: (value){
                          setState((){
                            status = value!;
                          });
                        }
                    ),
                    RadioListTile(
                        title: const Text("Progress"),
                        value: "Progress",
                        groupValue: status,
                        onChanged: (value){
                          setState((){
                            status = value!;
                          });
                        }
                    ),
                    RadioListTile(
                        title: const Text("Completed"),
                        value: "Completed",
                        groupValue: status,
                        onChanged: (value){
                          setState((){
                            status = value!;
                          });
                        }
                    ),
                    RadioListTile(
                        title: const Text("Cancelled"),
                        value: "Cancelled",
                        groupValue: status,
                        onChanged: (value){
                          setState((){
                            status = value!;
                          });
                        }
                    ),

                    ElevatedButton(
                        style: appButtonStyle(),
                        onPressed: ()  {
                          updateCallData(id);
                        }, child: successButtonChild("Confirm"))
                  ],
                ),

              );
            },
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  RefreshIndicator(
          onRefresh: ()async{
            if (mounted) {
              await calledData();
            }
          } ,
          child: isLoading == true  ? const Center(child: CircularProgressIndicator(),) :
          Center(child: taskItems.length > 0 ? taskListWidget(taskItems,deleteAlert,updateStatus) : const Center(child: Text("Empty"),)),
        )
    );
  }
}
