import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/screens/car.dart';
import 'package:note_application/screens/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');
  var carBox = Hive.box<Car>('carBox');
  var studentBox = Hive.box<Student>('studentBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
            ),
            Text(
              box.get(2) ?? 'empty',
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                box.put(2, controller.text);
                setState(() {});
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'read fromm text field',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                studentBox.put(
                  1,
                  Student(name: 'alireza', family: 'seiff', grade: 20, age: 23)
                );
              },
              child: const Text(
                'create',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (studentBox.get(1) == null) {
                  return;
                }
                print(studentBox.get(1)!.name);
                print(studentBox.get(1)!.family);
                print(studentBox.get(1)!.grade);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'read',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                studentBox.put(
                  1,
                  Student(name: 'asal', family: 'al aga', grade: 20, age: 23),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'update',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                studentBox.delete(1);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'delete',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
