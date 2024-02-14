import 'package:dartz/dartz.dart';
import 'package:todoclean/Todo/domain/entity/todo_entity.dart';
import 'package:todoclean/Todo/domain/repository/todo_repo.dart';
import 'package:todoclean/core/failure/failures.dart';

class GetAllToDoUseCase {
  final TodoRepo todoRepo;

  GetAllToDoUseCase(this.todoRepo);
  Future<Either<Failure, List<Todo>>> call() async {
    return await todoRepo.getAllToDo();
  }
}
