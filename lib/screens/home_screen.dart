import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/data/task.dart';
import 'package:note_application/screens/add_task_screen.dart';
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
          child: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: taskBox.values.length,
            itemBuilder: (BuildContext context, int index) {
              var task = taskBox.values.toList()[index];
              return TaskWidget(task: task);
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff18DAA3),
        child: Image.asset('assets/images/icon_add.png'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
      ),
    );
  }
}
