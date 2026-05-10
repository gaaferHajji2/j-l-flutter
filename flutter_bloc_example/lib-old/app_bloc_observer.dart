import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    debugPrint("AppBlocObserver - onCreate - $bloc");
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    debugPrint("AppBlocObserver - onChange - $bloc - Change is: $change");
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    debugPrint(
      "AppBlocObserver - onTransition - $bloc - Transition is: $transition",
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint("AppBlocObserver - onError - $bloc - Error is: $error");
  }
}
