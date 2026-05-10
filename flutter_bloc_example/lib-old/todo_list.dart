import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/todo_cubit.dart';
import 'models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (BuildContext context, int index) {
              final item = state[index];
              return ListTile(
                title: Text(item.name),
                trailing: Text(item.createdAt.toIso8601String()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
