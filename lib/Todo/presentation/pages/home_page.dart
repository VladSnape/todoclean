import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoclean/Todo/presentation/widgets/todo_widget.dart';

import '../bloc/bloc/todo_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController indexcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is LoadingInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FailureState) {
            return Center(
                child: TodoWidget(
                    authorId: 0,
                    id: 0,
                    title: state.message,
                    isCompleted: true));
          } else if (state is GetAllTodoState) {
            final todoList = state.todo;
            return SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 40, top: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: indexcontroller,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context, i) {
                          return TodoWidget(
                              authorId: todoList[i].userId,
                              id: todoList[i].id,
                              title: todoList[i].title,
                              isCompleted: todoList[i].completed);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is GetTodoState) {
            final todo = state.todo;
            return SafeArea(
              child: TodoWidget(
                  authorId: todo.userId,
                  id: todo.id,
                  title: todo.title,
                  isCompleted: todo.completed),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.send,
              size: 30,
            ),
            onPressed: () {
              final int? index = int.tryParse(indexcontroller.text);
              if (index != null) {
                BlocProvider.of<TodoBloc>(context).add(GetTodoEvent(index));
              } else {
                const TodoWidget(
                  authorId: 0,
                  id: 0,
                  title: 'error , try to insert a number',
                  isCompleted: false,
                );
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            child: const Icon(
              Icons.replay,
              size: 30,
            ),
            onPressed: () =>
                BlocProvider.of<TodoBloc>(context).add(GetAllTodoEvent()),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(icon: Icon(Icons.home) , label: 'home' ,),
      //             BottomNavigationBarItem(icon: Icon(Icons.home) , label: '' ,)

      // ]),
    );
  }
}
