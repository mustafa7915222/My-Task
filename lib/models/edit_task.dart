class EditTask {
  final int id;
  final String todo;
  final bool completed;
  final int userId;


  EditTask({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory EditTask.fromJson(Map<String, dynamic> json) {
    return EditTask(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

}
