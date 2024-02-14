import 'package:dartz/dartz.dart';
import 'package:todoclean/Todo/domain/entity/todo_entity.dart';
import 'package:todoclean/core/failure/failures.dart';

abstract class TodoRepo {
  Future<Either<Failure, List<Todo>>> getAllToDo();
  Future<Either<Failure, Todo>> getToDo(int index);
}
