import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/models/add_task.dart';
import 'package:test1/models/delete_task.dart';
import 'package:test1/utils/var.dart';

import '../models/edit_task.dart';
import '../models/task_list.dart';

class TaskListApiService {
  late Dio dio = Dio();
  late List<TasksList> taskList;
  Future<List<dynamic>> getTaskList() async {
    taskList =[];
    try {
      // قم بإجراء طلب GET إلى الخادم باستخدام الصفحة المحددة
      final response = await dio.get('https://dummyjson.com/todos?limit=10');

      // قم بفحص إذا كان الطلب ناجحًا
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['todos'];
        AppVar.pageNumber =response.data['total'];
        return data;
      } else {
        // إذا كان هناك خطأ في الطلب، قم برمي استثناء
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // إذا حدث خطأ أثناء الطلب، قم برمي استثناء
      throw Exception('Error: $e');
    }
  }

  Future<List<dynamic>> getMoreUserList(int page) async {
    try {
      // قم بإجراء طلب GET إلى الخادم باستخدام الصفحة المحددة
      final response = await dio.get('https://dummyjson.com/todos?limit=10&skip=${(page-1)*10}');

      // قم بفحص إذا كان الطلب ناجحًا
      if (response.statusCode == 200) {
        // قم بتحويل البيانات إلى قائمة من الكائنات Task
        final List<dynamic> data = response.data['todos'];

        taskList = data.map((json) => TasksList.fromJson(json)).toList();

        return data;

      } else {
        // إذا كان هناك خطأ في الطلب، قم برمي استثناء
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // إذا حدث خطأ أثناء الطلب، قم برمي استثناء
      throw Exception('Error: $e');
    }
  }



  Future<AddTask> addTasks(String description , int userId , bool State) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "todo": description,
      "completed": State,
      "userId": userId
    });
    try {
      // قم بإجراء طلب GET إلى الخادم باستخدام الصفحة المحددة
      final response = await dio.request(
        'https://dummyjson.com/todos/add',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,

      );

      // قم بفحص إذا كان الطلب ناجحًا
      if (response.statusCode == 200) {
        print(response.data);
        return AddTask.fromJson(response.data);;
      } else {
        // إذا كان هناك خطأ في الطلب، قم برمي استثناء
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // إذا حدث خطأ أثناء الطلب، قم برمي استثناء
      throw Exception('Error: $e');
    }
  }


  Future<EditTask> editTasks(int id,bool taskState) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "completed": taskState,
    });
    try {
      // قم بإجراء طلب GET إلى الخادم باستخدام الصفحة المحددة
      final response = await dio.request(
        'https://dummyjson.com/todos/$id',
        options: Options(
          method: 'PUT',
          headers: headers,
        ),
        data: data,

      );

      // قم بفحص إذا كان الطلب ناجحًا
      if (response.statusCode == 200) {
        print(response.data);
        return EditTask.fromJson(response.data);;
      } else {
        // إذا كان هناك خطأ في الطلب، قم برمي استثناء
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // إذا حدث خطأ أثناء الطلب، قم برمي استثناء
      throw Exception('Error: $e');
    }
  }


  Future<DeleteTask> deleteTasks(int id) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    try {
      // قم بإجراء طلب GET إلى الخادم باستخدام الصفحة المحددة
      final response = await dio.request(
        'https://dummyjson.com/todos/$id',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),

      );

      // قم بفحص إذا كان الطلب ناجحًا
      if (response.statusCode == 200) {
        print(response.data);
        return DeleteTask.fromJson(response.data);;
      } else {
        // إذا كان هناك خطأ في الطلب، قم برمي استثناء
        throw Exception('Failed to load users');
      }
    } catch (e) {
      // إذا حدث خطأ أثناء الطلب، قم برمي استثناء
      throw Exception('Error: $e');
    }
  }


}
