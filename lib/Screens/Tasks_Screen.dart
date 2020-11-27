import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey/Modal/task.dart';
import 'package:todoey/Modal/task_data.dart';
import 'package:todoey/Widgets/tasks_list.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';



class TasksScreen extends StatefulWidget {


  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // List<Task> tasks = [
  //   Task(name: 'Buy Milk'),
  //   Task(name: 'Buy Eggs'),
  //   Task(name: 'Buy Bread'),
  // ];
  // moving to task_data to implement provider


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),

                          // now implementing provider to add data to list
                          // (newtasktitle){
                    // setState(() {
                    //   tasks.add(Task(name: newtasktitle));
                    // });
                    // Navigator.pop(context);
                  // }
                  ),
              ),
            );
        },
        backgroundColor: Colors.lightBlueAccent ,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    // fontWeight: FontWeight.w700,
                  ),
                ),

              ],
            ),
          ),


          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: TasksList(),
              //TasksList(tasks), // not using because of provider
            ),
          ),


        ],
      ),
    );
  }
}















