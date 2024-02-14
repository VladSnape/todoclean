import 'dart:convert';
import 'package:todoclean/Todo/domain/entity/todo_entity.dart';

class TodoModel extends Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  const TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  }) : super(userId, id, title, completed);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Todo toEntity() => Todo(userId, id, title, completed);
}
