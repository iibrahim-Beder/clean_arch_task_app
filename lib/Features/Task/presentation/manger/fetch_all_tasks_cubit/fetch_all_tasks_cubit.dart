import 'package:clean_arch_task_app/Features/Task/domain/repos/task_repo.dart';
import 'package:clean_arch_task_app/Features/Task/presentation/manger/fetch_all_tasks_cubit/fetch_all_tasks_state.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchAllTasksCubit extends Cubit<FetchAllTasksState> {
  // FetchAllTasksCubit(super.initialState);
  FetchAllTasksCubit(this.taskRepo) : super(FetchAllTasksInitial());

  late TaskRepo taskRepo;

  Future<void> fetchAllTasks() async {
    emit(FetchAllTasksLoading());
    var result = taskRepo.fetchAllTasks();

    result.fold((failure) {
      emit(FetchAllTasksFailure(errMessage: failure.message));
    }, (tasks) {
      emit(FetchAllTasksSuccess(taskList: tasks));
    });
  }
}
