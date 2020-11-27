import 'package:flutter/material.dart';
import 'package:todoey/Modal/task_data.dart';
import 'package:todoey/Widgets/task_tile.dart';
import 'package:provider/provider.dart';



class TasksList extends StatefulWidget {

  // final List<Task> tasks;
  // TasksList(this.tasks);
  //don't need this anymore as we are using provider

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {



  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child){
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskdata.task[index];
            return TaskTile(
                taskTitle: task.name,
                //widget.tasks[index].name, // as no widget or task is declared in previous class
                ischecked: task.isDone,
                // widget.tasks[index].isDone,
                checkboxCallback : (checkboxState){

                  taskdata.updateTask(task);

                  // delete this to implement provider manager
                  // setState(() {
                  //   widget.tasks[index].toggleDone();
                  // });
                },
                longPressCallback: (){
                  taskdata.deleteTask(task);
            },
            );
          },
          itemCount: taskdata.taskCount,
        );
      },
    );
  }
}
