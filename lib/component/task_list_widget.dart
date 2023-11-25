import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/utility/utility.dart';

import '../api/api_client.dart';
import '../style/style.dart';

ListView taskListWidget(taskItem, deleteAlert, updateStatus){
  return ListView.builder(
      itemCount: taskItem.length,
      itemBuilder: (context, index){
        Color statusColors = Colors.green;
        if(taskItem[index]['status'] == "New"){
          statusColors = Colors.blue;
        }else if(taskItem[index]['status'] == "Progress"){
          statusColors = Colors.orange;
        }else if(taskItem[index]['status'] == "Cancelled"){
          statusColors = Colors.red;
        }else if(taskItem[index]['status'] == "Completed"){
          statusColors =  Colors.green;
        }

        return Card(
          child: sizeItemSizeBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskItem[index]['title'], style: heading6Text(Colors.black),),
                Text(taskItem[index]['description'],),
                Text(taskItem[index]['createdDate'],),
                const SizedBox(height: 5,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(child: statusPilContainer(taskItem[index]['status'], statusColors),),
                    Row(
                      children: [
                        SizedBox(
                          child: IconButton.outlined(onPressed: ()async{
                            await updateStatus(taskItem[index]['title'], taskItem[index]['_id']);
                          }, icon: const Icon(Icons.edit)),
                        ),
                        SizedBox(
                          child: IconButton.outlined(onPressed: (){
                            deleteAlert(taskItem[index]['_id']);
                          }, icon: const Icon(Icons.delete)),
                        )
                      ],
                    )
                  ],
                )
              ],
            )
          ),
        );
      });
}



