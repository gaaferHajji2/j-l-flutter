import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  // Here we must create the default constructor and initialize it with the initial state.
  // We initialize the constructor with initial state because cubit has it
  CounterCubit() : super(0);

  void increment() {
    // We can't call this function outside the class
    emit(state + 1);
  }
}
