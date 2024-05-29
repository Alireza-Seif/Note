import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application/data/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                      value: isBoxChecked,
                      onChanged: (isChecked) {
                        setState(() {
                          isBoxChecked = isChecked!;
                        });
                      }),
                  Text(widget.task.title)
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              getTimeAndEditBadgs()
            ],
          ),
        ),
        const SizedBox(width: 20),
        Image.asset('assets/images/workout.png'),
      ],
    );
  }

  Row getTimeAndEditBadgs() {
    return Row(
      children: [
        Container(
          width: 95,
          height: 28,
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              const Text(
                '10:30',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset('assets/images/icon_time.png'),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Container(
          width: 95,
          height: 28,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xffE2F6F1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              const Text(
                'ویرایش',
                style: TextStyle(
                  color: Color(0xff18DAA3),
                ),
              ),
              const SizedBox(width: 10),
              Image.asset('assets/images/icon_edit.png'),
            ],
          ),
        ),
      ],
    );
  }
}
