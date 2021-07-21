import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasks extends ChangeNotifier {
  static SharedPreferences prefs;

  static List<Task> _tasks = [
    //Task(task: 'Buy milk'),
  ];

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> saveTasks = [];
    saveTasks = prefs.getStringList('tasks');
    if (saveTasks != null) {
      for (String task in saveTasks) {
        if (prefs.getBool(task) == true) {
          _tasks.add(Task(task: task, isChecked: true));
        } else {
          _tasks.add(Task(task: task));
        }
      }
    }
  }

  void addTask(String newTask) async {
    _tasks.add(Task(task: newTask));
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    List<String> saveTasks = [];
    saveTasks = prefs.getStringList('tasks');
    if (saveTasks == null) {
      await prefs.setStringList('tasks', [newTask]);
    } else {
      saveTasks.add(newTask);
      await prefs.setStringList('tasks', saveTasks);
    }
    prefs.setBool(newTask, false);
  }

  void removeTask(int index) async {
    _tasks.removeAt(index);
    notifyListeners();
    List<String> saveTasks = [];
    final prefs = await SharedPreferences.getInstance();
    saveTasks = prefs.getStringList('tasks');
    await prefs.remove(saveTasks.removeAt(index));
    saveTasks.removeAt(index);
    if (saveTasks != null) {
      await prefs.setStringList('tasks', saveTasks);
    }
  }

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  // void addTask(String newTask) {
  //   _tasks.add(Task(task: newTask));
  //   notifyListeners();
  // }

  void toggleChecked(int index) async {
    final prefs = await SharedPreferences.getInstance();
    String task = _tasks[index].task;
    bool isChecked = prefs.getBool(task);
    prefs.setBool(_tasks[index].task, !isChecked);
    _tasks[index].isChecked = !_tasks[index].isChecked;
    notifyListeners();
  }

  // void removeTask(int index) {
  //   _tasks.removeAt(index);
  //   notifyListeners();
  // }
}
