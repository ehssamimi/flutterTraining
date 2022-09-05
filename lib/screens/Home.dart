// ignore: file_names


import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:study/models/customModels.dart';
import 'package:study/screens/Task.dart';

class Home extends StatefulWidget{
  List <TaskModel> tasks=[];


  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}
class HomeState extends State<Home> {

  addToTask(task){
    setState(() {
      widget.tasks.add(TaskModel(title: task.title, id: task.id,description:task.description??"توضیحات مربوط به اون" ,todos:task.todos??[]));
    });
  }


  updateTask(eachTask){


    List<TaskModel> NewTask=  widget.tasks.map((taskItem) {
      // print(taskItem.id);
      if(taskItem.id == eachTask.id) {
        return eachTask;
      }

      return taskItem;
    }).toList().cast<TaskModel>();

    setState(() {
      widget.tasks= NewTask;
    });
  }

  DeleteTask(taskID){
    setState(() {
      widget.tasks=widget.tasks.where((taskItem)=>taskItem.id !=taskID).toList();
    });
  }



  void SwitchToCreateTasl(context)async{
    TaskModel task  =await Navigator.push(context, MaterialPageRoute(
        builder: (context)=>Task())
    );
    // print("task");
    // print(task);
    if(task != null) {
      addToTask(task);
    }

  }




  @override
  Widget build(BuildContext context)   {
      return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        width: 40,
                        height: 40,
                        image: AssetImage('assets/image/task_logo.png'),
                      ),
                      Icon(Icons.menu,size: 24.0,)
                    ],
                  ),

                  Row(children: [
                      Expanded(child:
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.only(top: 15,bottom: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("header in ast " ,style: TextStyle(color: Colors.grey[800],fontSize:17,fontWeight: FontWeight.bold ),),
                            Text("in tozihate in ast va in khahad bood agar ma inja ino benevisim injori mishe dige",style: TextStyle(color: Colors.grey[300],fontSize:16 ))
                          ],
                        ),
                      )

                      )
                    ],
                  ),
                  Expanded(
                      child:
                          Stack(
                            children: [
                              ListView.builder(
                                itemCount: widget.tasks.length,

                                itemBuilder: (BuildContext context, int index){
                                  return Container(

                                    // height: 50.0,

                                    margin: EdgeInsets.only(bottom: 12.0),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:BorderRadius.circular(12),
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(child:
                                            GestureDetector(
                                                onTap:()async{
                                                 TaskModel eachTask= await Navigator.push(context,MaterialPageRoute(
                                                      builder: (contex)=>Task( task:widget.tasks[index] ,))
                                                  );
                                                 updateTask(eachTask);


                                                },

                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(widget.tasks[index].title, style: TextStyle(color: Colors.green[800],fontWeight: FontWeight.bold,fontSize: 16),),
                                                  Text(widget.tasks[index].description??"" ,style: TextStyle(color: Colors.grey),)
                                                ],
                                              ))
                                            ),
                                        GestureDetector(
                                          onTap:(){
                                            // print(widget.tasks[index].id);
                                            DeleteTask(widget.tasks[index].id);
                                          },
                                          child:Icon(Icons.delete,color: Colors.red,size: 20,) ,
                                        )


                                      ],
                                    ),
                                  );
                                },),
                              Positioned(
                                  bottom: 10,
                                  left: 0,
                                  child:
                             GestureDetector(
                               onTap: (){
                                 SwitchToCreateTasl(context);
                               },
                               child:  Container(
                                 width: 50.0,
                                 height:50.0 ,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: Colors.red
                                 ),
                                 child: Icon(Icons.add,
                                   color: Colors.white,
                                 ),

                               ),
                             )

                              )

                            ],
                          )

                  )

                ],
              ),
            ),
          ),
        )
    );
  }

}