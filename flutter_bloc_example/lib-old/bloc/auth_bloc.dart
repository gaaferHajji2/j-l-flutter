import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authLoginRequested);
  }

  void _authLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

      if (!emailRegex.hasMatch(email)) {
        emit(AuthFailure(errorMessage: 'Invalid email address'));
      } else if (password.length < 6) {
        emit(
          AuthFailure(errorMessage: 'Password must be at least 6-characters'),
        );
      } else {
        await Future.delayed(Duration(seconds: 3), () {
          emit(AuthSuccess(uid: '$email-$password'));
        });
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
}
