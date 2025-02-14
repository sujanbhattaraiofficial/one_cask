// presentation/pages/auth/sign_in/bloc/sign_in_event.dart
part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailChanged extends SignInEvent {
  final String email;
  const SignInEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class SignInPasswordChanged extends SignInEvent {
  final String password;
  const SignInPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class SignInPasswordVisibilityToggled extends SignInEvent {}

class SignInSubmitted extends SignInEvent {}
