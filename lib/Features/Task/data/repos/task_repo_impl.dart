import 'package:clean_arch_task_app/Features/Task/data/data_sources/task_remote_data_source.dart';
import 'package:clean_arch_task_app/Features/Task/domain/entities/task_entitie.dart';
import 'package:clean_arch_task_app/Features/Task/domain/repos/task_repo.dart';
import 'package:clean_arch_task_app/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';

class TaskRepoImpl implements TaskRepo {
  final TaskRemoteDataSource taskRemoteDataSource;

  TaskRepoImpl({required this.taskRemoteDataSource});

  @override
  Future<Either<Failure, TaskEntitie>> addNewTask(TaskEntitie taskEntitie) {
    // TODO: implement addNewTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskEntitie>> editTask(TaskEntitie taskEntitie) {
    // TODO: implement editTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TaskEntitie>>> fetchAllTasks() async {
    List<TaskEntitie> taskList;

    try {
      taskList = await taskRemoteDataSource.fetchAllTasks();
      return Right(taskList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
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
