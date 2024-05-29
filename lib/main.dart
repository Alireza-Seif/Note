import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/data/task.dart';
import 'package:note_application/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: const TextTheme(
          displayLarge:
              TextStyle(fontFamily: 'GB', fontSize: 16, color: Colors.white),
        ),
      ),
      home:  HomeScreen(),
    );
  }
}
