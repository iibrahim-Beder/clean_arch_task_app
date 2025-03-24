import 'package:clean_arch_task_app/Features/Task/domain/entities/task_entitie.dart';

abstract class FetchAllTasksState {}

abstract class FetchAllTasksInitial extends FetchAllTasksState {}

abstract class FetchAllTasksLoading extends FetchAllTasksState {}

abstract class FetchAllTasksSuccess extends FetchAllTasksState {
  List<TaskEntitie> taskList;
  FetchAllTasksSuccess({required this.taskList});
}

abstract class FetchAllTasksFailure extends FetchAllTasksState {
  final String errMessage;
  FetchAllTasksFailure({required this.errMessage});
}
