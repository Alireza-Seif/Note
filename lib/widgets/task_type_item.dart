

import 'package:flutter/material.dart';
import 'package:note_application/widgets/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    required this.taskType,
    required this.index,
    required this.selectedItemmList,
    super.key,
  });

  TaskType taskType;

  int index, selectedItemmList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (selectedItemmList == index)
            ? const Color(0xff18DAA3)
            : Colors.white,
        border: Border.all(
          color: (selectedItemmList == index)
              ? const Color(0xff18DAA3)
              : Colors.grey,
          width: (selectedItemmList == index) ? 3 : 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.all(8),
      width: 140,
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
              fontSize: (selectedItemmList == index) ? 18 : 20,
              color: (selectedItemmList == index) ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}