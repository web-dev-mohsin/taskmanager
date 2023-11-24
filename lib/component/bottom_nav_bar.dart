

import 'package:flutter/material.dart';

BottomNavigationBar appNavigationBar(currentIndex, onItemTappedIndex){
  return BottomNavigationBar(
      items:  const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "New",
      ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: "Progress",
      ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: "Completed",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.cancel_outlined),
          label: "Cancelled",
      ),


  ],
      selectedItemColor: Colors.green,

      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
       onTap: onItemTappedIndex,
      type: BottomNavigationBarType.fixed,

  );
}