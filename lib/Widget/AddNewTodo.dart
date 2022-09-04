

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewTodo extends StatelessWidget{
  final Function addTodo;
  AddNewTodo({required this.addTodo});


  TextEditingController  newInputController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: newInputController,
        onSubmitted: (value){
          addTodo(value);
          newInputController.clear();
        },
        style:TextStyle(fontSize: 14,) ,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "کار جدیدی به لیست اضافه کنید  "
        ),
      );
  }

}