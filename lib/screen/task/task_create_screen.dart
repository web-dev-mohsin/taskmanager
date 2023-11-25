import 'package:flutter/material.dart';

import '../../api/api_client.dart';
import '../../style/style.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  Map<String, String> formValues = {"title":"", "description":"", "status":"New"};
  bool isLoading = true;

  inputOnChange(mapKey, mapValue){
    setState(() {
      formValues.update(mapKey, (value) => mapValue);
    });
  }

  onSubmit() async{
    if(formValues['title']!.isEmpty){
      print("Title must be not empty");
    }else if(formValues['description']!.isEmpty){
      print("Description must be not empty");
    }else{
      setState(() {
        isLoading =false;
      });
        var res = await taskCreateRequest(formValues);
        if(res == true){
          setState(() {
            isLoading =true;
          });
          Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          print("task created");

        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Task Create", style: TextStyle(color: Colors.white),),),
      body: Stack(
        children: [

          // background Screen--------------
          screenBackground(context),
          // background Screen--------------

          Center(
            child: isLoading ==false ? const CircularProgressIndicator() : Container(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Add new task", style: heading1Text(Colors.black26),),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: appInputDecoration("Title"),
                      onChanged: (value){
                        inputOnChange("title", value);
                      },),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: appInputDecoration("Description"),
                      maxLines: 10,
                      onChanged: (value){
                        inputOnChange("description", value);
                      },),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                        style: appButtonStyle(),
                        onPressed: (){
                          onSubmit();
                        }, child: successButtonChild("Create")),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
