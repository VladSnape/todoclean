part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetAllTodoEvent extends TodoEvent {}

class GetTodoEvent extends TodoEvent {
  final int index;

  const GetTodoEvent(this.index);
}
