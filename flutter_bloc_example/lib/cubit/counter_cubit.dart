import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  // here we must create the default constructor and initialize it with the initial state
  // we initialize the constructor with initial state because cubit has it
  CounterCubit() : super(0);
}
