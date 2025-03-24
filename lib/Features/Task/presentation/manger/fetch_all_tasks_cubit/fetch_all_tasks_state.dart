import 'package:clean_arch_task_app/Features/Task/domain/entities/task_entitie.dart';

abstract class FetchAllTasksState {}

class FetchAllTasksInitial extends FetchAllTasksState {}

class FetchAllTasksLoading extends FetchAllTasksState {}

class FetchAllTasksSuccess extends FetchAllTasksState {
  List<TaskEntitie> taskList;
  FetchAllTasksSuccess({required this.taskList});
}

class FetchAllTasksFailure extends FetchAllTasksState {
  final String errMessage;
  FetchAllTasksFailure({required this.errMessage});
}
