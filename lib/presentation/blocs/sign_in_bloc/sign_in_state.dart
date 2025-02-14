// presentation/pages/auth/sign_in/bloc/sign_in_state.dart
part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool obscurePassword;
  final SignInStatus status;
  final String? emailError;
  final String? passwordError;
  final String? errorMessage;

  const SignInState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.status = SignInStatus.initial,
    this.emailError,
    this.passwordError,
    this.errorMessage,
  });

  bool get isValid => emailError == null && passwordError == null;

  SignInState copyWith({
    String? email,
    String? password,
    bool? obscurePassword,
    SignInStatus? status,
    String? emailError,
    String? passwordError,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      status: status ?? this.status,
      emailError: emailError,
      passwordError: passwordError,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        obscurePassword,
        status,
        emailError,
        passwordError,
        errorMessage,
      ];
}
