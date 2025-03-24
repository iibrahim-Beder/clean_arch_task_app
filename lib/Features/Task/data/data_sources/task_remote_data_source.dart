import 'package:clean_arch_task_app/Features/Task/domain/entities/task_entitie.dart';
import 'package:clean_arch_task_app/core/utils/api_service.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskEntitie>> fetchAllTasks();
  Future<TaskEntitie> addNewTask(TaskEntitie taskEntitie);
  Future<TaskEntitie> editTask(TaskEntitie taskEntitie);
  Future<void> deleteTask(int taskId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final ApiService apiService;

  TaskRemoteDataSourceImpl({required this.apiService});

  @override
  Future<TaskEntitie> addNewTask(TaskEntitie taskEntitie) {
    // TODO: implement addNewTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskEntitie> editTask(TaskEntitie taskEntitie) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<List<TaskEntitie>> fetchAllTasks() async {
    var data = await apiService.get(endPoint: "GetAllTask");

    return getTaskList(data);
  }

    List<TaskEntitie> getTaskList(Map<String, dynamic> data) {
    List<TaskEntitie> Tasks = [];
    for (var TaskMap in data.values) {
      Tasks.add(TaskEntitie(
          taskId: TaskMap["taskId"],
          taskName: TaskMap["taskName"],
          taskStatus: TaskMap["taskStatus"]));
    }

    return Tasks;
  }
}
