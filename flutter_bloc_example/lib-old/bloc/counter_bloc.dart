import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => increment(event, emit));
    on<CounterDecrement>((event, emit) => decrement(event, emit));

    // on<CounterIncrement>(increment);
  }

  void increment(CounterIncrement event, Emitter<int> emit) {
    // here we can't use emit of main class like cubit,
    // because we have multiple events to listen to them
    emit(state + 1);
  }

  void decrement(CounterDecrement event, Emitter<int> emit) {
    emit(state - 1);
  }
}
