// presentation/pages/auth/sign_in/bloc/sign_in_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<SignInSubmitted>(_onSubmitted);
  }

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  void _onEmailChanged(SignInEmailChanged event, Emitter<SignInState> emit) {
    final emailError = _validateEmail(event.email);
    emit(state.copyWith(
      email: event.email,
      emailError: emailError,
      errorMessage: null,
    ));
  }

  void _onPasswordChanged(
      SignInPasswordChanged event, Emitter<SignInState> emit) {
    final passwordError = _validatePassword(event.password);
    emit(state.copyWith(
      password: event.password,
      passwordError: passwordError,
      errorMessage: null,
    ));
  }

  void _onPasswordVisibilityToggled(
    SignInPasswordVisibilityToggled event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: SignInStatus.loading));

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Throw error for demonstration
      // throw Exception('Invalid credentials');

      emit(state.copyWith(status: SignInStatus.success));
    } catch (e) {
      emit(state.copyWith(
        status: SignInStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!_emailRegex.hasMatch(email)) return 'Invalid email format';
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}
