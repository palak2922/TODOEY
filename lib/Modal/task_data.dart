import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';


class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];


  UnmodifiableListView<Task> get task{
    return UnmodifiableListView(_tasks);
  }


  int get taskCount{
    return _tasks.length;
  }


  void addTask(String newtaskTitle){
    final task = Task(name: newtaskTitle);
    _tasks.add(task);
    notifyListeners();
  }



  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }


  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }



}

