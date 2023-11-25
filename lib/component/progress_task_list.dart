import 'package:flutter/material.dart';
import 'package:taskmanager/component/task_list_widget.dart';

import '../api/api_client.dart';
import '../style/style.dart';

class ProgressTaskList extends StatefulWidget {
  const ProgressTaskList({super.key});

  @override
  State<ProgressTaskList> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskList> {
  List taskItems = [];
  bool isLoading =true;
  String status = "Progress";

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

  deleteAlert(id){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete"),
            content: Text("Are you sure want to delete?"),
            actions: [
              OutlinedButton(onPressed: ()async{
                var res = await deleteTaskRequest(id);
                if(res){
                 await calledData();
                  Navigator.pop(context);
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
      await calledData();
      setState((){ status = "New"; });
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
                      onPressed: () async {
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
     await calledData();
    } ,
    child: isLoading ? const Center(child: CircularProgressIndicator(),) :
    Center(child: taskItems.length >0 ? taskListWidget(taskItems,deleteAlert, updateStatus)
          : const Center(child: Text("Empty"),)),
    )
    );
  }
}
