/*

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/blocs/tasks/tasks_cubit.dart';
import 'package:test1/blocs/tasks/tasks_state.dart';
import 'package:test1/classes/edit_task.dart';
import 'package:test1/widgets/progress_indicator.dart';
import '../classes/add_new_task.dart';
import '../classes/task.dart';
import '../utils/constants.dart';
import '../utils/function.dart';
import '../widgets/alert.dart';
import '../widgets/app_bar.dart';

TextEditingController nameController = TextEditingController();
TextEditingController jobController = TextEditingController();

class TaskPage extends StatefulWidget {
  final int userId;
  const TaskPage({required this.userId}) : super();
  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TasksCubit>(context).getTasks(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: showAppBarWithOneActionIconAndOneLeadingIcon(
          AppConstants.taskAppbarTitle,
          AppConstants.appbarTitleFontSize,
          AppConstants.myWhite,
          AppConstants.fontFamily,
          AppConstants.primaryColor,
          Icons.arrow_back,
          AppConstants.myWhite,
          onPressed: () { Navigator.of(context).pop(); },
      ),

      body: BlocConsumer<TasksCubit, TasksState>(
        listener: (context, state) {
          if (state is GetTasksFailure) {
            showDialog(
              context: context,
              builder: (_) =>showAlertDialog(
                  state.error,
                  context,
                  AppConstants.loginFailedMessage,
                  AppConstants.loginFailedMessage,
                  AppConstants.dialogButtonText),
            );
          }
          if (state is AddTasksFailure) {
            showAlertDialog(
                state.error,
                context,
                AppConstants.loginFailedMessage,
                AppConstants.loginFailedMessage,
                AppConstants.dialogButtonText);
          }
          if (state is EditTasksFailure) {
            showAlertDialog(
                state.error,
                context,
                AppConstants.loginFailedMessage,
                AppConstants.loginFailedMessage,
                AppConstants.dialogButtonText);
          }
        },
        builder: (context, state) {
          if (state is TasksLoading) {
            return Center(
              child:
                  showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is GetTasksSuccess) {
            return Task(task: state.tasks);
          }
          else if (state is AddTasksLoading) {
            return Center(
              child:
              showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is AddTasksSuccess) {
            return AddNewTask( addTask: state.addTask,);
          }
          else if (state is EditTasksLoading) {
            return Center(
                child:
                showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is EditTasksSuccess) {
            return EditTaskClass( editTask: state.editTask,);
          }
          else {
            return Container();
          }
        },
      ),
    );
  }


}






*/
