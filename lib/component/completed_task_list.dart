import 'package:flutter/material.dart';
import 'package:taskmanager/component/task_list_widget.dart';

import '../api/api_client.dart';
import '../style/style.dart';

class CompletedTaskList extends StatefulWidget {
  const CompletedTaskList({super.key});

  @override
  State<CompletedTaskList> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskList> {

  List taskItems = [];
  bool isLoading =true;
  String status = "Completed";
  bool _isMounted = true;



  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }
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

  deleteAlert(id){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Are you sure want to delete?"),
            actions: [
              OutlinedButton(onPressed: ()async{
                var res = await deleteTaskRequest(id);
                if(res){
                 await calledData();
                  Navigator.pop(context);
                }
              },
                  child: const Text("Yes")),
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
        setState((){ status = "Completed"; });
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
              padding: const EdgeInsets.all(50),
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
          child: isLoading ==true ? const Center(child: CircularProgressIndicator(),) :
          Center(
              child: taskItems.length > 0 ? taskListWidget(taskItems,deleteAlert, updateStatus) : const Center(child: Text("Empty"),)),
        )
    );
  }
}
