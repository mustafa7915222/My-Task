import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/models/delete_task.dart';
import 'package:test1/services/task_list_api_service.dart';
import 'package:test1/utils/var.dart';

import '../classes/task_list.dart';
import '../models/add_task.dart';
import '../models/edit_task.dart';
import '../models/task_list.dart';

class TaskListRepository {
  final TaskListApiService taskListApiService;

  TaskListRepository(this.taskListApiService);
  Future<bool> checkTaskList()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey("taskList1")){

      return true;
    }
    else{
      return false;
    }
  }


  Future<bool> checkLoadedPage(int page)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getInt("loadedPage$page") ==page ){

      return true;
    }
    else{
      return false;
    }
  }

  Future<List<TasksList>> getTaskList() async {
    try {
      List<dynamic> taskData =await taskListApiService.getTaskList();

      List<TasksList> taskList = taskData.map((json) => TasksList.fromJson(json)).toList();


      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> encodedData = taskData.map((task) => json.encode(task)).toList();
      List<String> taskLists = prefs.getStringList('taskList1') ?? [];
      taskLists.addAll(encodedData);
      await prefs.setStringList('taskList1', taskLists);

      int taskListPageNumber = prefs.getInt('taskListPageNumber') ?? 0;
      taskListPageNumber = AppVar.pageNumber;
      await prefs.setInt('taskListPageNumber', taskListPageNumber);
      int loadedPage = prefs.getInt('loadedPage1') ?? 0;
      loadedPage =1;
      await prefs.setInt('loadedPage1', loadedPage);

      return taskList;
    } catch (e) {
      // Handle error
      throw Exception('Login failed: $e');
    }
  }

  Future<List<TasksList>> getMoreTaskList(int page) async {
    try {
      List<dynamic> taskData =await taskListApiService.getMoreUserList(page);

      List<TasksList> taskList = taskData.map((json) => TasksList.fromJson(json)).toList();


      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String> encodedData = taskData.map((task) => json.encode(task)).toList();
      List<String> taskLists = prefs.getStringList('taskList$page') ?? [];
      taskLists.addAll(encodedData);
      await prefs.setStringList('taskList$page', taskLists);

      int loadedPage = prefs.getInt('loadedPage$page') ?? 0;
      loadedPage =page;
      await prefs.setInt('loadedPage$page', loadedPage);


      return taskList;
    } catch (e) {
      // Handle error
      throw Exception('Login failed: $e');
    }
  }

  Future<AddTask> addTasks(String description , int userId , bool State) async {
    try {
      // Perform login API call
      return await taskListApiService.addTasks(description, userId ,State);
    } catch (e) {
      // Handle error
      throw Exception('Login failed: $e');
    }
  }


  Future<EditTask> editTasks(int id,bool taskState ) async {
    try {
      // Perform login API call
      return await taskListApiService.editTasks( id ,taskState );
    } catch (e) {
      // Handle error
      throw Exception('Login failed: $e');
    }
  }

  Future<DeleteTask> deleteTasks(int id ) async {
    try {
      // Perform login API call
      return await taskListApiService.deleteTasks( id );
    } catch (e) {
      // Handle error
      throw Exception('Login failed: $e');
    }
  }

}
