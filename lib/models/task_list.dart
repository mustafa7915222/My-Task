class TasksList {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  TasksList({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TasksList.fromJson(Map<String, dynamic> json) {
    return TasksList(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }


  @override
  String toString() {
    return 'UserDetails{id: $id, todo: $todo, completed: $completed, userId: $userId}';
  }
}
