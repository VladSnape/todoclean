import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoclean/Todo/presentation/bloc/bloc/todo_bloc.dart';
import 'package:todoclean/Todo/presentation/pages/home_page.dart';
import 'package:todoclean/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<TodoBloc>()..add(GetAllTodoEvent()),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
