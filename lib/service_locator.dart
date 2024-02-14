import 'package:get_it/get_it.dart';
import 'package:todoclean/Todo/data/data_sources/remote.dart';
import 'package:todoclean/Todo/data/impl/todo_impl.dart';
import 'package:todoclean/Todo/domain/repository/todo_repo.dart';
import 'package:todoclean/Todo/domain/usecases/getalltodo_usecase.dart';
import 'package:todoclean/Todo/domain/usecases/gettodo_usecase.dart';
import 'package:todoclean/Todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
void init() {
  // bloc
  sl.registerFactory(() => TodoBloc(sl(), sl()));
  // use cases
  sl.registerLazySingleton(() => GetTodoUseCase(sl()));
  sl.registerLazySingleton(() => GetAllToDoUseCase(sl()));
  // repo
  sl.registerLazySingleton<TodoRepo>(() => TodoImpl(sl()));
  //data source

  sl.registerLazySingleton<ToDoRemoteDataSource>(() => TodoRDSIhttp(sl()));
  //core

  // external
  sl.registerLazySingleton(() => http.Client());
}
