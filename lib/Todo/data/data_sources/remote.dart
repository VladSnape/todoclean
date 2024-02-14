import 'dart:convert';

import 'package:todoclean/Todo/data/model/todo_model.dart';
import 'package:http/http.dart' as http;
import 'package:todoclean/core/consts/consts.dart';
import 'package:todoclean/core/failure/exeptions.dart';

abstract class ToDoRemoteDataSource {
  Future<List<TodoModel>> getAllToDo();
  Future<TodoModel> getTodo(int index);
}

class TodoRDSIhttp implements ToDoRemoteDataSource {
  final http.Client client;

  TodoRDSIhttp(this.client);

  @override
  Future<List<TodoModel>> getAllToDo() async {
    final response = await client.get(Uri.parse(Urls.baseUrl));
    if (response.statusCode == 200) {
      List decodedJson = jsonDecode(response.body) as List;
      List<TodoModel> listTodo =
          decodedJson.map((e) => TodoModel.fromMap(e)).toList();
      return listTodo;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> getTodo(int index) async {
    final response =
        await client.get(Uri.parse(Urls.otherUrl + index.toString()));
    if (response.statusCode == 200) {
      TodoModel decodedResponse = TodoModel.fromMap(jsonDecode(response.body));
      return decodedResponse;
    } else {
      throw ServerException();
    }
  }
}
