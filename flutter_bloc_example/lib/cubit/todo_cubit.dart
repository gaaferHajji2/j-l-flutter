import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
}
