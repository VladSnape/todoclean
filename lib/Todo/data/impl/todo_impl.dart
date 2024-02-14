import 'package:dartz/dartz.dart';
import 'package:todoclean/Todo/data/data_sources/remote.dart';
import 'package:todoclean/Todo/domain/entity/todo_entity.dart';
import 'package:todoclean/Todo/domain/repository/todo_repo.dart';
import 'package:todoclean/core/failure/exeptions.dart';
import 'package:todoclean/core/failure/failures.dart';

class TodoImpl implements TodoRepo {
  final ToDoRemoteDataSource toDoRemoteDataSource;

  TodoImpl(this.toDoRemoteDataSource);
  @override
  Future<Either<Failure, List<Todo>>> getAllToDo() async {
    try {
      final result = await toDoRemoteDataSource.getAllToDo();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure('serverFailureMessage'));
    }
  }

  @override
  Future<Either<Failure, Todo>> getToDo(int index) async {
    try {
      final result = await toDoRemoteDataSource.getTodo(index);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure('serverFailureMessage'));
    }
  }
}
