import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String name) {
    final todo = Todo(name: name, createdAt: DateTime.now());
    // [emit] does nothing if the [state] being emitted is equal to the current [state].
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
