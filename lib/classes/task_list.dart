import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/screens/edit_task_screen.dart';
import '../models/task_list.dart';
import '../utils/constants.dart';
import '../utils/function.dart';

class TaskList extends StatelessWidget {
  final List<TasksList> taskList;

  const TaskList({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        TasksList task = taskList[index];
        return Card(
          elevation: 2,
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task ID: ${task.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstants.cardTitleFontSize,
                    color: AppConstants.secondaryColor,
                    fontFamily: AppConstants.fontFamily,),
                ),
                const SizedBox(height: AppConstants.cardTitleSpacing),
                Text('Task Description: ${task.todo.toString()}', style: const TextStyle(
                  fontSize: AppConstants.cardContentFontSize,
                  color: AppConstants.secondaryColor,
                  fontFamily: AppConstants.fontFamily,
                )),
                Text('User Id: ${task.userId}', style: const TextStyle(
                  fontSize: AppConstants.cardContentFontSize,
                  color: AppConstants.secondaryColor,
                  fontFamily: AppConstants.fontFamily,
                )),
                Text('Task State: ${task.completed?"Completed":"In Progress"}', style: const TextStyle(
                  fontSize: AppConstants.cardContentFontSize,
                  color: AppConstants.secondaryColor,
                  fontFamily: AppConstants.fontFamily,
                )),

              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  EditTaskScreen(id: task.id)),
                    );
                   // showEditTaskDialog(context,task.id,);
                  },
                  icon: Icon(Icons.edit),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: () {
                    showDeleteTaskDialog(context,task.id);
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
