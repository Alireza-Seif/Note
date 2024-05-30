import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      body: Center(
          child: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                if (notification.direction == ScrollDirection.forward) {
                  isFabVisible = true;
                }
                if (notification.direction == ScrollDirection.reverse) {
                  isFabVisible = false;
                }
              });
              return true;
            },
            child: ListView.builder(
              itemCount: taskBox.values.length,
              itemBuilder: (BuildContext context, int index) {
                var task = taskBox.values.toList()[index];
                return getListItemm(task);
              },
            ),
          );
        },
      )),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
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
      ),
    );
  }

  Widget getListItemm(Task task) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => task.delete(),
      child: TaskWidget(task: task),
    );
  }
}
