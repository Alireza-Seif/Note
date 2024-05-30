import 'package:note_application/data/type_enum.dart';
import 'package:note_application/data/task_type.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: 'assets/images/meditate.png',
      title: 'تمرکز',
      taskTypeEnum: TaskTypeEnum.foucs,
    ),
    TaskType(
      image: 'assets/images/social_frends.png',
      title: 'میتینگ',
      taskTypeEnum: TaskTypeEnum.date,
    ),
    TaskType(
      image: 'assets/images/hard_working.png',
      title: 'کار',
      taskTypeEnum: TaskTypeEnum.working,
    ),
  ];

  return list;
}
