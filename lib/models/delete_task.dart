class DeleteTask {
  final int id;
  final String todo;
  final bool completed;
  final int userId;
  final bool isDeleted;
  final String deletedOn;


  DeleteTask({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
    required this.isDeleted,
    required this.deletedOn,
  });

  factory DeleteTask.fromJson(Map<String, dynamic> json) {
    return DeleteTask(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
      isDeleted: json['isDeleted'],
      deletedOn: json['deletedOn'],
    );
  }

}
