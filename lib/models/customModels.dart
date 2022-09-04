import 'package:flutter/cupertino.dart';

class Todo{

  final String title;
  final bool isDone;

  Todo({required this.title, required this.isDone});
}

class TaskModel{
  late final int id;
  late  String title;
  String? description;
  TaskModel({required this.title, required this.id,this.description});
}