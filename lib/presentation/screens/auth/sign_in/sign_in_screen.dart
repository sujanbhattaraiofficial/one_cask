// presentation/pages/auth/sign_in/sign_in_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_cask/core/constants/route_names.dart';
import 'package:one_cask/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocProvider(
        create: (context) => SignInBloc(),
        child: const _SignInView(),
      ),
    );
  }
}

class _SignInView extends StatelessWidget {
  const _SignInView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == SignInStatus.success) {
          Navigator.pushReplacementNamed(context, RouteNames.collection);
        }
        if (state.status == SignInStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.errorMessage ?? 'Authentication failed')),
          );
        }
      },
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.all(24),
          child: _SignInForm(),
        );
      },
    );
  }
}

class _SignInForm extends StatelessWidget {
  const _SignInForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sign In',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                )),
        const SizedBox(height: 32),
        _EmailInput(),
        const SizedBox(height: 16),
        _PasswordInput(),
        const SizedBox(height: 32),
        _SubmitButton(),
        const SizedBox(height: 16),
        _RecoverPasswordButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.emailError != current.emailError,
      builder: (context, state) {
        return TextFormField(
          key: const Key('signIn_emailInput'),
          autofillHints: const [AutofillHints.email],
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
            errorText: state.emailError,
            errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          onChanged: (email) =>
              context.read<SignInBloc>().add(SignInEmailChanged(email)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.passwordError != current.passwordError ||
          previous.obscurePassword != current.obscurePassword,
      builder: (context, state) {
        return TextFormField(
          key: const Key('signIn_passwordInput'),
          autofillHints: const [AutofillHints.password],
          obscureText: state.obscurePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
            errorText: state.passwordError,
            errorStyle: TextStyle(color: Theme.of(context).colorScheme.error),
            suffixIcon: IconButton(
              icon: Icon(
                state.obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => context
                  .read<SignInBloc>()
                  .add(SignInPasswordVisibilityToggled()),
            ),
          ),
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          onChanged: (password) =>
              context.read<SignInBloc>().add(SignInPasswordChanged(password)),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: state.isValid
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: state.isValid && state.status != SignInStatus.loading
                ? () => context.read<SignInBloc>().add(SignInSubmitted())
                : null,
            child: state.status == SignInStatus.loading
                ? CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onPrimary)
                : Text('Continue',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary)),
          ),
        );
      },
    );
  }
}

class _RecoverPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/recover-password'),
        child: RichText(
          text: TextSpan(
            text: 'Can\'t sign in? ',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                ),
            children: [
              TextSpan(
                text: 'Recover password',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
