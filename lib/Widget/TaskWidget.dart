

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget{
  final String title;
  final bool isDone;
  TaskWidget({required this.title,required this.isDone});

  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(bottom: 10),
     child: Row(
       children: [
         Container(
           decoration: BoxDecoration(
               color: isDone?Colors.red:Colors.grey[400],
               borderRadius: BorderRadius.circular(5)
           ),
           height: 20,
           width: 20,
           margin: EdgeInsets.only(left: 10),
           child: isDone?Icon(Icons.check,size:12 ,color: Colors.white,):null,
         ),
         Expanded(child: Text(title,style: TextStyle(color: isDone?Colors.red:null,decoration:  isDone?TextDecoration.lineThrough:null),))
       ],
     ),
   );

  }

}