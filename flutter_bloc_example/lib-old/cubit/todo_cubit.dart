import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('Title can\'t be empty');
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    // [emit] does nothing if the [state] being emitted is equal to the current [state].
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
  }
}
