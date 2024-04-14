import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/blocs/task_list/task_list_state.dart';

import '../../models/task_list.dart';
import '../../repositories/task_list_repository.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskListRepository _taskListRepository;

  TaskListCubit(this._taskListRepository) : super(TaskListInitial());

  void getTaskList() async {
    final taskList = await _taskListRepository.checkTaskList();
    if (taskList) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> taskListJson = prefs.getStringList('taskList1') ?? [];
      List<TasksList> taskss = taskListJson
          .map((jsonString) => TasksList.fromJson(json.decode(jsonString)))
          .toList();

      emit(TaskListStored(taskList: taskss ,pageNumber: prefs.getInt("taskListPageNumber")!));
    }
    else {
      emit(TaskListLoading());
      try {
        final taskList = await _taskListRepository.getTaskList();

        emit(TaskListSuccess(taskList: taskList));
      } catch (e) {
        print(e);
        emit(TaskListFailure(error: e.toString()));
      }
    }
  }

  void getMoreTaskList(int page) async {
    print(page);
    final taskList = await _taskListRepository.checkLoadedPage(page);
    print(taskList);
    if (taskList) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> taskListJson = prefs.getStringList('taskList$page') ?? [];
      List<TasksList> taskss = taskListJson
          .map((jsonString) => TasksList.fromJson(json.decode(jsonString)))
          .toList();

      emit(MoreTaskListStored(taskList: taskss ,pageNumber: prefs.getInt("taskListPageNumber")!));
    }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();

      emit(MoreTaskListLoading(pageNumber: prefs.getInt("taskListPageNumber")!));
      try {
        final userDetails = await _taskListRepository.getMoreTaskList(page);

        emit(MoreTaskListSuccess(taskList: userDetails,pageNumber: prefs.getInt("taskListPageNumber")!));
      } catch (e) {
        print(e);
        emit(MoreTaskListFailure(error: e.toString()));
      }
    }

  }

  void addTask(String description, int userId, bool State) async {
    emit(AddTaskLoading());
    try {
      final addTask =
          await _taskListRepository.addTasks(description, userId, State);

      emit(AddTaskSuccess(addTask: addTask));
    } catch (e) {
      print(e);
      emit(AddTaskFailure(error: e.toString()));
    }
  }

  void editTask(int id, bool taskState) async {
    emit(EditTaskLoading());
    try {
      final editTask = await _taskListRepository.editTasks(id, taskState);

      emit(EditTaskSuccess(editTask: editTask));
    } catch (e) {
      print(e);
      emit(EditTaskFailure(error: e.toString()));
    }
  }

  void deleteTask(int id) async {
    emit(DeleteTaskLoading());
    try {
      final deleteTask = await _taskListRepository.deleteTasks(id);

      emit(DeleteTaskSuccess(deleteTask: deleteTask));
    } catch (e) {
      print(e);
      emit(DeleteTaskFailure(error: e.toString()));
    }
  }

  void taskListInt() async {
    emit(TaskListInitial());
  }
}
