import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'screens/tasks_screen.dart';
import 'models/tasks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Tasks().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (context) => Tasks(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
