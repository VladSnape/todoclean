import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:todoclean/Todo/domain/entity/todo_entity.dart';
import 'package:todoclean/Todo/domain/usecases/getalltodo_usecase.dart';
import 'package:todoclean/Todo/domain/usecases/gettodo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetAllToDoUseCase getAllToDoUseCase;
  final GetTodoUseCase getTodoUseCase;
  TodoBloc(
    this.getAllToDoUseCase,
    this.getTodoUseCase,
  ) : super(TodoInitial()) {
    on<GetAllTodoEvent>((event, emit) async {
      emit(LoadingInitial());
      final result = await getAllToDoUseCase.call();
      result.fold((failure) {
        emit(FailureState(failure.message));
      }, (data) {
        emit(GetAllTodoState(data));
      });
    });

    on<GetTodoEvent>(
      (event, emit) async {
        emit(LoadingInitial());
        final result = await getTodoUseCase.call(event.index);
        result.fold((failure) {
          emit(FailureState(failure.message));
        }, (r) {
          emit(GetTodoState(r));
        });
      },
    );
  }
}
