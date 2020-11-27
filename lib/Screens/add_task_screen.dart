import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Modal/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Modal/task_data.dart';



class AddTaskScreen extends StatelessWidget {

  // final Function addTaskCallback;
  // AddTaskScreen(this.addTaskCallback);
  //removing to add provider code to update list

  String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),


            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),


            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: FlatButton(
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlueAccent,
                onPressed: (){
                  Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                  // removing for provider code
                  // addTaskCallback(newTaskTitle);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}



