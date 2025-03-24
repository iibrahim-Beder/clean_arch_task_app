import 'package:clean_arch_task_app/Features/Task/presentation/manger/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:clean_arch_task_app/Features/Task/presentation/manger/fetch_all_tasks_cubit/fetch_all_tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskHomeBody extends StatefulWidget {
  const TaskHomeBody({super.key});

  @override
  State<TaskHomeBody> createState() => _TaskHomeBodyState();
}

class _TaskHomeBodyState extends State<TaskHomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllTasksCubit, FetchAllTasksState>(
        builder: (context, state) {
      if (state is FetchAllTasksLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is FetchAllTasksSuccess) {
        return  Center(child: Text("${state.taskList[0].taskName}"));
      } else {
        return Center(child: Text("sorry, there was an error"));
      }
    });
  }
}
