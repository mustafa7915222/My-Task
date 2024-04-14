
import 'package:test1/models/delete_task.dart';
import 'package:test1/models/edit_task.dart';

import '../../models/add_task.dart';
import '../../models/task_list.dart';

abstract class TaskListState {}

class TaskListInitial extends TaskListState {}

class TaskListLoading extends TaskListState {}
class TaskListStored extends TaskListState {
  final List<TasksList> taskList;
  final int pageNumber;


  TaskListStored({required this.taskList ,required this.pageNumber});
}

class MoreTaskListStored extends TaskListState {
  final List<TasksList> taskList;
  final int pageNumber;


  MoreTaskListStored({required this.taskList ,required this.pageNumber});
}

class TaskListSuccess extends TaskListState {
  final List<TasksList> taskList;

  TaskListSuccess({required this.taskList});
}

class TaskListFailure extends TaskListState {
  final String error;

  TaskListFailure({required this.error});
}

class MoreTaskListLoading extends TaskListState {
  final int pageNumber;
  MoreTaskListLoading({ required this.pageNumber});

}

class MoreTaskListSuccess extends TaskListState {
  final List<TasksList> taskList;
  final int pageNumber;


  MoreTaskListSuccess({required this.taskList, required this.pageNumber});
}

class MoreTaskListFailure extends TaskListState {
  final String error;

  MoreTaskListFailure({required this.error});
}

class AddTaskLoading extends TaskListState {}

class AddTaskSuccess extends TaskListState {
  final AddTask addTask;

  AddTaskSuccess({required this.addTask});
}

class AddTaskFailure extends TaskListState {
  final String error;

  AddTaskFailure({required this.error});
}


class EditTaskLoading extends TaskListState {}

class EditTaskSuccess extends TaskListState {
  final EditTask editTask;

  EditTaskSuccess({required this.editTask});
}

class EditTaskFailure extends TaskListState {
  final String error;

  EditTaskFailure({required this.error});
}


class DeleteTaskLoading extends TaskListState {}

class DeleteTaskSuccess extends TaskListState {
  final DeleteTask deleteTask;

  DeleteTaskSuccess({required this.deleteTask});
}

class DeleteTaskFailure extends TaskListState {
  final String error;

  DeleteTaskFailure({required this.error});
}




