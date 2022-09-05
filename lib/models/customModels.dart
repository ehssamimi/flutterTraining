import 'package:flutter/cupertino.dart';

class Todo{
  final int id;

  final String title;
  late   bool isDone;

  Todo({required this.title, required this.isDone,required this.id});
}

class TaskModel{
  late  int id;
  late  String title;
  String? description;

  List <Todo> ?todos;
  TaskModel({ required this.title , required this.id , this.description , this.todos });


  addNewTodo(value) {
    todos?.add(
        Todo(
            id: DateTime.now().microsecondsSinceEpoch,
            title: value,
            isDone: false
        )
    );
  }

  toggleDoneTodo(id) {
    todos = todos?.map((todo) {
      if(todo.id == id) {
        todo.isDone = ! todo.isDone;
      }
      return todo;
    }).toList();
  }

  DeleteTodo(id){
    todos = todos?.where((todo) => todo.id!=id).toList();
  }



  // TaskModel({required this.title, required this.id,this.description});

}