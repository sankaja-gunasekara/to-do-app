import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:todoey_flutter/models/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  // AddTaskScreen(this.addTask);
  // final Function addTask;

  @override
  Widget build(BuildContext context) {
    String typedTask;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50
            //bottom: MediaQuery.of(context).viewInsets.bottom
            ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 30,
              ),
            ),
            Theme(
              data: ThemeData(primaryColor: Colors.teal),
              child: TextField(
                //scrollPadding: EdgeInsets.only(bottom: 80),
                //autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  typedTask = value;
                },
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // We can add to the list as this, but it doesn't invoke notifyListeners() and update others;
                // Therefore, we write a getter only to view the date, but not to modify. This provides additional safety
                // When adding using the following, it gives an error mentioning Cannot add to an unmodifiable list

                //Provider.of<Tasks>(context, listen: false).tasks.add(Task(task: typedTask));
                Provider.of<Tasks>(context, listen: false).addTask(typedTask);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
