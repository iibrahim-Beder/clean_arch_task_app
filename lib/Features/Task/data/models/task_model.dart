
import 'package:clean_arch_task_app/Features/Task/domain/entities/task_entitie.dart';

class TaskModel extends TaskEntitie {
  int taskId;
  String taskName;
  int taskStatus;

  TaskModel(
      {required this.taskId, required this.taskName, required this.taskStatus})
      : super(taskId: taskId, taskName: taskName, taskStatus: taskStatus);
}
