import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'task_tile.dart';
import 'package:todoey_flutter/models/tasks.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              task: taskData.tasks[index].task,
              isChecked: taskData.tasks[index].isChecked,
              checkboxCallback: (value) {
                //setState(
                // () {
                //tasks[index].isChecked = value;
                Provider.of<Tasks>(context, listen: false).toggleChecked(index);
                // },
                //);
              },
              onLongPress: () {
                Provider.of<Tasks>(context, listen: false).removeTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

// children: [
// TaskTile(task: tasks[0].task, isChecked: tasks[0].isChecked),
// TaskTile(task: tasks[1].task, isChecked: tasks[1].isChecked),
// TaskTile(task: tasks[2].task, isChecked: tasks[2].isChecked),
// ],
