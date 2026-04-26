import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => increment(event, emit));

    // on<CounterIncrement>(increment);
  }

  void increment(CounterIncrement event, Emitter<int> emit) {
    emit(state + 1);
  }
}
