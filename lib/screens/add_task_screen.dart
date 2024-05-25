import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/data/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();

  final box = Hive.box<Task>('taskBox');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskTitle,
                    focusNode: negahban1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: negahban1.hasFocus
                            ? const Color(0xff18DAA3)
                            : const Color(0xffC5C5C5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff18DAA3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskSubTitle,
                    maxLines: 2,
                    focusNode: negahban2,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: negahban2.hasFocus
                            ? const Color(0xff18DAA3)
                            : const Color(0xffC5C5C5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide:
                            BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: Color(0xff18DAA3),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  String taskTitle = controllerTaskTitle.text;
                  String taskSubTitle = controllerTaskSubTitle.text;
                  addTask(taskTitle, taskSubTitle);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff18DAA3),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(200, 48)),
                child: const Text(
                  'اضافه کردن تسک',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    //add task

    var task = Task(title: taskTitle, subTitle: taskSubTitle);
    box.add(task);
    print(box.get(1)!.title);
  }
}
