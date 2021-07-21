import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.task, this.isChecked, this.checkboxCallback, this.onLongPress});

  final String task;
  final bool isChecked;
  final Function checkboxCallback;
  final Function onLongPress;

  // void checkboxCallBack(bool checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        task,
        style: TextStyle(
            fontSize: 20,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}

// TaskCheckBox(
// checkBoxState: isChecked,
// toggleCheckboxState: (bool checkBoxState) {
// setState(() {
// isChecked = checkBoxState;
// });
// }),

// class TaskCheckBox extends StatelessWidget {
//   TaskCheckBox({this.checkBoxState, this.toggleCheckboxState});
//   final bool checkBoxState;
//   final Function toggleCheckboxState;
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.teal,
//       value: checkBoxState,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }
