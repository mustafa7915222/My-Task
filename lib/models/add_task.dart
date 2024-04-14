class AddTask {
  final int id;
  final String todo;
  final bool completed;
  final int userId;


  AddTask({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory AddTask.fromJson(Map<String, dynamic> json) {
    return AddTask(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

}
