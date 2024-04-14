import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/blocs/task_list/task_list_cubit.dart';
import 'package:test1/blocs/task_list/task_list_state.dart';
import 'package:test1/utils/constants.dart';
import 'package:test1/widgets/progress_indicator.dart';
import 'package:test1/widgets/snack_bar.dart';
import '../classes/page_navigation.dart';
import '../classes/task_list.dart';
import '../utils/var.dart';
import '../widgets/alert.dart';
import '../widgets/app_bar.dart';
import 'add_new_task_screen.dart';
import 'drawer.dart';
TextEditingController descriptionController = TextEditingController();
TextEditingController userIdController = TextEditingController();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _myScaffoldKey= new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TaskListCubit>(context).getTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer:const NavigationDrawerNew() ,
      key: _myScaffoldKey,

      appBar: showAppBarWithOneActionIconAndOneLeadingIcon(
          AppConstants.taskListAppbarTitle,
          AppConstants.appbarTitleFontSize,
          AppConstants.myWhite,
          AppConstants.fontFamily,
          AppConstants.primaryColor,
          Icons.add_card,
        AppConstants.myWhite,
        onPressed: () {  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNewTask()),
        );}
      ),

      body: BlocConsumer<TaskListCubit, TaskListState>(
        listener: (context, state) {
          if (state is TaskListFailure) {
            print("here");
            ScaffoldMessenger.of(context).showSnackBar(
              showSnakBar(AppConstants.snackBarLoadUserText, state.error),
            );
          }
          else if(state is MoreTaskListFailure){
            print("herew2");

            ScaffoldMessenger.of(context).showSnackBar(
              showSnakBar(AppConstants.snackBarLoadUserText, state.error),
            );
          }
          else if (state is EditTaskFailure) {
            showAlertDialog(
                state.error,
                context,
                AppConstants.loginFailedMessage,
                AppConstants.loginFailedMessage,
                AppConstants.dialogButtonText);
          }
          else if (state is AddTaskFailure) {
            showAlertDialog(
                state.error,
                context,
                AppConstants.loginFailedMessage,
                AppConstants.loginFailedMessage,
                AppConstants.dialogButtonText);
          }
          else if (state is DeleteTaskFailure) {
            showAlertDialog(
                state.error,
                context,
                AppConstants.loginFailedMessage,
                AppConstants.loginFailedMessage,
                AppConstants.dialogButtonText);
          }
        },
        builder: (context, state) {
          if (state is TaskListStored) {
            return Column(
              children: [
                Expanded( flex:3,child: TaskList(taskList: state.taskList)),
                PageNavigation(currentPage:  AppVar.pageLoadingCounter,totalPages: (state.pageNumber/10).round() ,onPageChanged: (page) {
                  setState(() {
                    AppVar.pageLoadingCounter = page;
                  });
                },)
              ],
            );
          }
          else if (state is MoreTaskListStored) {
            return Column(
              children: [
                Expanded( flex:3,child: TaskList(taskList: state.taskList)),
                PageNavigation(currentPage:  AppVar.pageLoadingCounter,totalPages: (state.pageNumber/10).round() ,onPageChanged: (page) {
                  setState(() {
                    AppVar.pageLoadingCounter = page;
                  });
                },)
              ],
            );
          }
          else if (state is TaskListLoading) {
            return Center(
              child: showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is TaskListSuccess) {
            return Column(
              children: [
                Expanded( flex:3,child: TaskList(taskList: state.taskList)),
                PageNavigation(currentPage:  AppVar.pageLoadingCounter,totalPages: (AppVar.pageNumber/10).round() ,onPageChanged: (page) {
          setState(() {
            AppVar.pageLoadingCounter = page;
          });
          },)
              ],
            );
          }

          else if (state is MoreTaskListLoading) {
            return Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: showProgressIndicator(AppConstants.secondaryColor),

                  ),
                ),
                PageNavigation(currentPage:  AppVar.pageLoadingCounter,totalPages: (state.pageNumber/10).round() ,onPageChanged: (page) {
                  setState(() {
                    AppVar.pageLoadingCounter = page;
                  });
                },)
              ],
            );
          }
          else if (state is MoreTaskListSuccess) {
            return Column(
              children: [
                Expanded( flex:3,child: TaskList(taskList: state.taskList)),
                PageNavigation(currentPage:  AppVar.pageLoadingCounter,totalPages: (state.pageNumber/10).round() ,onPageChanged: (page) {
                  setState(() {
                    AppVar.pageLoadingCounter = page;
                  });
                },)
              ],
            );
          }
          else if (state is AddTaskLoading) {
            return Center(
                child:
                showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is AddTaskSuccess) {
            return  showAlertDialogEdit(
                context,
                state.addTask,
                AppConstants.dialogButtonText);
          }
          else if (state is EditTaskLoading) {
            return Center(
                child:
                showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is EditTaskSuccess) {
          return  showAlertDialogEdit(
                context,
              state.editTask,
                AppConstants.dialogButtonText);
          }
          else if (state is DeleteTaskLoading) {
            return Center(
                child:
                showProgressIndicator(AppConstants.secondaryColor)
            );
          }
          else if (state is DeleteTaskSuccess) {
            return  showAlertDialogDelete(
                context,
                state.deleteTask,
                AppConstants.dialogButtonText);
          }
          else {
            return Container();
          }
        },
      ),
    );
  }
}



