

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/models/customModels.dart';

class TaskWidget extends StatelessWidget{
  // index:index,task

  Function toggleDone;
  Function deleteDone;
  Todo todo;

  TaskWidget({ required this.todo, required this.toggleDone, required this.deleteDone });



  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(bottom: 10),
     child: GestureDetector(
       onTap: ()=>toggleDone(todo.id),
       child: Row(
         children: [
           Container(
             decoration: BoxDecoration(
                  color:todo.isDone?Colors.red:Colors.grey[400],
                 borderRadius: BorderRadius.circular(5)
             ),
             height: 20,
             width: 20,
             margin: EdgeInsets.only(left: 10),
             child: todo.isDone?Icon(Icons.check,size:12 ,color: Colors.white,):null,
           ),
           Expanded(child: Text(todo.title,style: TextStyle(color: todo.isDone?Colors.red:null,decoration:  todo.isDone?TextDecoration.lineThrough:null),)),
           IconButton(onPressed: ()=>deleteDone(todo.id), icon: Icon(Icons.delete,color: Colors.red,size:20.0 ,))

         ],
       ),
     )
   );

  }

}