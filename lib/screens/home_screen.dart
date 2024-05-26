import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application/data/task.dart';
import 'package:note_application/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();


  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      body: Center(
        child: ListView.builder(
          itemCount: taskBox.values.length,
          itemBuilder: (BuildContext context, int index) {
            var task = taskBox.values.toList()[index];
            return TaskWidget(task: task);
          },
        ),
      ),
    );
  }

}
