import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  var box = Hive.box('names');

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
              onPressed: () {
                box.put(1, 'alireza');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'create',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var text = box.get(1);
                print(text);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'read',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                box.put(1, 'Seif');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'update',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                box.delete(1);
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
