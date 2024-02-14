part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

final class LoadingInitial extends TodoState {}

final class GetAllTodoState extends TodoState {
  final List<Todo> todo;

  const GetAllTodoState(this.todo);
}

final class FailureState extends TodoState {
  final String message;

  const FailureState(this.message);
}

final class GetTodoState extends TodoState {
  final Todo todo;

  const GetTodoState(this.todo);
}
