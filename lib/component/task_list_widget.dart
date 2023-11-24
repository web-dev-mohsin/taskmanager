import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

ListView taskListWidget(taskItem){
  return ListView.builder(
      itemCount: taskItem.length,
      itemBuilder: (context, index){
        return Card(
          child: sizeItemSizeBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskItem[index]['title'], style: heading6Text(Colors.black),),
                Text(taskItem[index]['description'],),
              ],
            )
          ),
        );
      });
}