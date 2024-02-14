import 'package:dartz/dartz.dart';
import 'package:todoclean/Todo/domain/entity/todo_entity.dart';
import 'package:todoclean/Todo/domain/repository/todo_repo.dart';
import 'package:todoclean/core/failure/failures.dart';

class GetTodoUseCase {
  final TodoRepo todoRepo;

  GetTodoUseCase(this.todoRepo);
  Future<Either<Failure, Todo>> call(int index) async {
    return await todoRepo.getToDo(index);
  }
}
