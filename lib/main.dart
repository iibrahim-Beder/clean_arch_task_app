import 'package:clean_arch_task_app/Features/Task/data/data_sources/task_remote_data_source.dart';
import 'package:clean_arch_task_app/Features/Task/data/repos/task_repo_impl.dart';
import 'package:clean_arch_task_app/Features/Task/domain/repos/task_repo.dart';
import 'package:clean_arch_task_app/Features/Task/presentation/manger/fetch_all_tasks_cubit/fetch_all_tasks_cubit.dart';
import 'package:clean_arch_task_app/Features/Task/presentation/views/task_home_body.dart';
import 'package:clean_arch_task_app/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchAllTasksCubit(TaskRepoImpl(
              taskRemoteDataSource:
                  TaskRemoteDataSourceImpl(apiService: ApiService(Dio()))))..fetchAllTasks(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const TaskHomeBody()),
    );
  }
}
