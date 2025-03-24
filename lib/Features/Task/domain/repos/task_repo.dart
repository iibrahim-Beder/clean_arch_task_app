import 'package:clean_arch_task_app/Features/Task/domain/entities/task_entitie.dart';
import 'package:clean_arch_task_app/core/errors/failure.dart';
import 'package:either_dart/either.dart';

abstract class TaskRepo {
  
  Future<Either<Failure,List<TaskEntitie>>> fetchAllTasks();
  Future<Either<Failure,TaskEntitie>>addNewTask(TaskEntitie taskEntitie);
  Future<Either<Failure,TaskEntitie>>editTask(TaskEntitie taskEntitie);
  Future<void> deleteTask(int taskId);

}
