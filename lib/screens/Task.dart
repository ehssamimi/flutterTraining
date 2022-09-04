

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/Widget/AddNewTodo.dart';
import 'package:study/Widget/TaskWidget.dart';
import 'package:study/models/customModels.dart';

class Task extends StatefulWidget{

  TaskModel? task;
  Task({this.task});
  @override
  State<StatefulWidget> createState() =>TaskState();

}
class TaskState extends State <Task>{
  List <Todo> todos=[];
  TextEditingController InputHeaderController =TextEditingController();
  TextEditingController InputDescriptionController =TextEditingController();

  @override
  initState() {
    super.initState();
    if(widget.task != null) {
      InputHeaderController.text = widget.task?.title ?? "";
      InputDescriptionController.text = widget.task?.description ?? "";
    }
  }

  addTodo(value){
    setState(() {
      todos.add(Todo(title: value, isDone: false));
    });
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(child:
        Directionality(textDirection: TextDirection.rtl,
        child:  Scaffold(
            body:   Container(
              padding: EdgeInsets.only(top: 10.0,left: 10.0,right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.pop(context, widget.task);},
                        // onTap: (){print(widget.task);},
                        child:Icon(Icons.arrow_back,color: Colors.grey[800],),
                      ),
                      Expanded(child:
                      TextField(
                        controller: InputHeaderController,
                        onChanged: (value) {
                          // print(value);
                          if(value != "") {
                            if(widget.task == null) {
                              // widget.task?.title = value;
                              // widget.task?.id = DateTime.now().microsecondsSinceEpoch;
                              setState(() {
                                // widget.task?.title = value;
                                widget.task = TaskModel(
                                    id : DateTime.now().microsecondsSinceEpoch,
                                    title: value,
                                  // description: "asas"
                                );
                              });
                            } else {
                              widget.task?.title = value;
                            }
                          }
                        },
                        decoration: InputDecoration(
                          hintText: " کار اصلی است  ",
                          border: InputBorder.none,
                          fillColor: Colors.grey[800],
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ))
                    ],
                  ),
                Container(
                  margin: EdgeInsets.only(top:15,bottom: 25) ,
                  child: TextField(
                    controller: InputDescriptionController,
                  onChanged: (value) {
                    widget.task?.description = value;
                  },


                    decoration: InputDecoration(
                      hintText: " توضیحات خود را اضافه کنید  ",
                      border: InputBorder.none,
                      fillColor: Colors.grey[800],
                    ),
                    style: TextStyle(

                    ),
                  )
                ),
                  Expanded(child:
                      ListView.builder(
                        itemCount: todos.length,
                          itemBuilder: (context,index)=>TaskWidget(title:todos[index].title, isDone:todos[index].isDone))
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width:1,color: Colors.black26 )
                        ),
                      ),
                      Expanded(child:AddNewTodo(addTodo:addTodo)
                      )
                    ],
                  )
                ],
              ),
            )) ,
        )
    );




  }

}