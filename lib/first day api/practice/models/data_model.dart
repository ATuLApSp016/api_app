
import 'package:api_app/first%20day%20api/practice/models/todo_model.dart';

class DataModel {
  List<TodoModel>? todos;
  int? total;
  int? skip;
  int? limit;

  DataModel(
      {required this.todos,
      required this.total,
      required this.skip,
      required this.limit});

  /// map -> model
  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<TodoModel> mTodos = [];

    for (Map<String, dynamic> eachTodos in json['todos']) {
      TodoModel model = TodoModel.fromJson(eachTodos);
      mTodos.add(model);
    }

    return DataModel(
      todos: mTodos,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
