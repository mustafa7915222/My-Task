import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/blocs/task_list/task_list_cubit.dart';
import '../screens/home_screen.dart';
import 'constants.dart';

void addTask(BuildContext context,String description , int userId , bool State) {
  BlocProvider.of<TaskListCubit>(context).addTask(description,userId,State);
  userIdController.text ="";
  descriptionController.text = "";

  Navigator.pop(context);

}
void editTask(BuildContext context, id,taskState) {
  print(taskState);
  BlocProvider.of<TaskListCubit>(context).editTask(id,taskState);
  userIdController.text ="";
  descriptionController.text = "";

  Navigator.pop(context);
}
void showDeleteTaskDialog(BuildContext context, int id) {
  showDialog(

      context: context,
      builder: (context)=>AlertDialog(
        title: Text(
          AppConstants.deleteTaskTitle,
          style: TextStyle(
            color:AppConstants.secondaryColor,
            fontFamily: AppConstants.fontFamily,
            fontSize: AppConstants.deleteTaskTitleFontSize,

          ),

        ),
        content: Text(AppConstants.deleteTaskContent,style: TextStyle(
          color:AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
          fontSize: AppConstants.deleteTaskContentFontSize,

        ),),
        actions: [

          TextButton(
            onPressed:() async{
              Navigator.pop(context);

              BlocProvider.of<TaskListCubit>(context).deleteTask(id);

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => AppConstants.primaryColor),
            ),
            child:Text(
              AppConstants.deleteTaskOkButtonTitle,
              style: TextStyle(
                color:AppConstants.myWhite,
                fontFamily: AppConstants.fontFamily,
                fontSize: AppConstants.deleteTaskOkButtonFontSize,
              ),
            ),
          ),
          TextButton(
            onPressed:() {
              Navigator.pop(context);

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => AppConstants.secondaryColor),
            ),
            child: const Text(
              AppConstants.deleteTaskCancelButtonTitle,
              style: TextStyle(
                color:AppConstants.myWhite,
                fontFamily: AppConstants.fontFamily,
                fontSize: AppConstants.deleteTaskCancelButtonFontSize,
              ),
            ),
          ),


        ],
      ));

}


