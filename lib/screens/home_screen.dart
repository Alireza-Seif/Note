import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5e5e5),
      body: Center(
        child: getTaskItem(),
      ),
    );
  }

  Container getTaskItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
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
                  MSHCheckbox(
                    value: isChecked,
                    size: 32,
                    checkedColor: const Color(0xff18DAA3),
                    style: MSHCheckboxStyle.fillScaleCheck,
                    onChanged: (selected) {
                      setState(() {
                        isChecked = selected;
                      });
                    },
                  ),
                  const Text('ببا دوستام ورزش کنم')
                ],
              ),
              const Text('Second Text'),
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
