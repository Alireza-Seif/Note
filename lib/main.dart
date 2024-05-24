import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/screens/car.dart';
import 'package:note_application/screens/home_screen.dart';
import 'package:note_application/screens/student.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  Hive.registerAdapter(StudentAdapter());

  await Hive.openBox<Car>('carBox');
  await Hive.openBox<Student>('studentBox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
