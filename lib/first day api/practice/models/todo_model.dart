class TodoModel {
  int? id;
  int? userId;
  String? todo;
  bool? completed;

  TodoModel({
    required this.id,
    required this.userId,
    required this.todo,
    required this.completed,
  });

  /// map -> model
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      userId: json['userId'],
      todo: json['todo'],
      completed: json['completed'],
    );
  }
}
