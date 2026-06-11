part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

final class AuthSignupRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  AuthSignupRequested({
    required this.name,
    required this.email,
    required this.password,
  });
}

final class AuthGoogleSignInRequested extends AuthEvent {}
