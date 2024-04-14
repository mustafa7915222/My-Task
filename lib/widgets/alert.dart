import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_list/task_list_cubit.dart';
import '../models/edit_task.dart';
import '../utils/constants.dart';
import '../utils/var.dart';

Widget showAlertDialog(state ,context , title,content,buttonText){
  return AlertDialog(
    title: Text(title),
    content: Text('$content $state'),
    actions: [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child:  Text(buttonText),
      ),
    ],
  );
}

Widget showAlertDialogEdit(context,editTask,buttonText){

  return AlertDialog(
    title:     Text(
      'Edited Sucsses',
      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstants.cardTitleFontSize,
        color: AppConstants.secondaryColor,
        fontFamily: AppConstants.fontFamily,),
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task ID: ${editTask.id}',
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstants.cardTitleFontSize,
            color: AppConstants.secondaryColor,
            fontFamily: AppConstants.fontFamily,),
        ),
        const SizedBox(height: AppConstants.cardTitleSpacing),
        Text('Task Description: ${editTask.todo.toString()}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
        Text('User Id: ${editTask.userId}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
        Text('Task State: ${editTask.completed?"Completed":"In Progress"}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
      ],
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          AppVar.pageLoadingCounter = 1;
          AppVar.pageNumber =0;
          BlocProvider.of<TaskListCubit>(context).getTaskList();
        },
        child:  Text(buttonText),
      ),
    ],
  );
}

Widget showAlertDialogDelete(context,deleteTask,buttonText){

  return AlertDialog(
    title:     Text(
      'Delete Sucsses',
      style: const TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstants.cardTitleFontSize,
        color: AppConstants.secondaryColor,
        fontFamily: AppConstants.fontFamily,),
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task ID: ${deleteTask.id}',
          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstants.cardTitleFontSize,
            color: AppConstants.secondaryColor,
            fontFamily: AppConstants.fontFamily,),
        ),
        const SizedBox(height: AppConstants.cardTitleSpacing),
        Text('Task Description: ${deleteTask.todo.toString()}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
        Text('User Id: ${deleteTask.userId}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
        Text('Task State: ${deleteTask.completed?"Completed":"In Progress"}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
        Text('Is Deleted ? ${deleteTask.isDeleted?"Yes":"No"}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
        Text('Deleted On: ${deleteTask.deletedOn}', style: const TextStyle(
          fontSize: AppConstants.cardContentFontSize,
          color: AppConstants.secondaryColor,
          fontFamily: AppConstants.fontFamily,
        )),
      ],
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          AppVar.pageLoadingCounter = 1;
          AppVar.pageNumber =0;
          BlocProvider.of<TaskListCubit>(context).getTaskList();
        },
        child:  Text(buttonText),
      ),
    ],
  );
}